#
# Rakefile for Chef Server Repository
#
# Author:: Adam Jacob (<adam@opscode.com>)
# Copyright:: Copyright (c) 2008 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'rubygems'
require 'json'
require 'fileutils'
require 'net/scp'
require 'yaml'
require 'versionomy'
require 'chef'
require 'chef/cookbook/metadata'
require 'pry'
#require 'github_api'

# Load constants + local constants from rake config file.
require File.join(File.dirname(__FILE__), 'config', 'rake-config.rb')

namespace :check do

  # desc 'All new server tasks'
  # task all: [
  #   'server:check_hosts',
  #   'server:create',
  #   'server:pems',
  #   'server:user',
  #   'server:kniferb',
  #   'server:update_databags',
  #   'server:update_environments',
  #   'server:update_roles',
  # ]

  desc 'Check that ENV variables are set. build_vars[digitalocean]'
  task :build_vars, :service do |t, args|
    service_dir = args[:service] || 'digitalocean'

    # todo: check if the manifest file is up to date.

    path_to_local = File.join(File.dirname(__FILE__), 'services', service_dir, 'local.sh')

    contents = File.open(path_to_local).read

    contents_clean = ''

    contents.each_line do |line|
      line = line.gsub(/export /,"")
      line = line.split('=')[0]
      contents_clean += line + ","
    end

    contents_clean = contents_clean.gsub(/($)\,/,"")

    puts "ARE THEY SET? - #{contents_clean}"

    ENV_VARS_TO_CHECK = contents_clean.split(",")

    ENV_VARS_TO_CHECK.each do |key|
      fail "Set an environment variable for #{key}\n" if ENV[key].nil?
    end # ENV_VARS_TO_CHECK

  end # build_vars

  desc 'Validate all the packer templates in service directory.'
  task :validate, :service do |t, args|
    service_dir = args[:service] || 'digitalocean'

    path_to_local = File.join(File.dirname(__FILE__), 'services', service_dir)
    templates = Dir.glob("#{path_to_local}/*/*.json")
    templates.each do |template|
      if !system "packer validate #{template}"
        puts "#{template} is invalid."
      else
        puts "#{template} is valid."
      end
    end
  end

end # check

namespace :build do

  desc 'Build a base image from chef cookbooks - Requires environment variables be set. ( See rake check:build_vars[service ) -
   All required variables can be set to * to build all defined servers.

   EG: ( DIGITALOCEAN )

   "DO_API_KEY="
   "DO_CLIENT_ID="
   "DO_IMAGE="
   "DO_PRIVATE_NETWORKING="
   "DO_REGION_ID="
   "DO_SIZE="
   "DO_SSH_TIMEOUT="
   "DO_SSH_USERNAME="'

  task :digitalocean do
    Rake::Task['check:build_vars'].invoke("digitalocean")

    nmdpacker_os = ENV['NMDPACKER_OS']
    nmdpacker_ver = ENV['NMDPACKER_VER']
    nmdpacker_bits = ENV['NMDPACKER_BITS']
    nmdpacker_var = ENV['NMDPACKER_VAR']
    nmdpacker_only = ENV['NMDPACKER_ONLY']
    nmdpacker_box = ENV['NMDPACKER_BOX']
    nmdpacker_upload = ENV['NMDPACKER_UPLOAD']

    if ENV['NMDPACKER_VAR']
      nmdpacker_var = ENV['NMDPACKER_VAR']
    else
      nmdpacker_var = 'base'
    end

    Dir.chdir '.' do
      FileUtils.rm './Berkshelf.lock', force: true
      `bundle exec berks install --path vendor/cookbooks `
      FileUtils.rm_rf(Dir.glob('./packer-*'))
      if nmdpacker_bits
        processor = nmdpacker_bits == '64' ? "{amd64,x86_64}" : "i386"
      else
        processor = '*'
      end

      templates = Dir.glob("./servers/#{nmdpacker_os}-#{nmdpacker_ver}-#{processor}-#{nmdpacker_var}.json")

      if nmdpacker_only
        templates.each do |template|
          exec "packer build -only=#{nmdpacker_only} #{template}"
        end
      else
        templates.each do |template|
          puts "#{templates}"
          exec "packer build #{template}"
        end
      end

      if nmdpacker_box
        Dir.glob('./builds/virtualbox/nmd*').each do |template|
          box_name = template.match(/(nmd.*).box/).captures[0]
          exec "vagrant box remove #{box_name}"
          exec "vagrant box add #{box_name} #{template}"
        end
        Dir.glob('./builds/vmware/nmd*').each do |template|
          box_name = template.match(/(nmd.*).box/).captures[0]
          exec "vagrant box remove #{box_name}"
          exec "vagrant box add #{box_name} #{template}"
        end
      end

      if nmdpacker_upload.nil? || Rake::Task['upload'].invoke
      end
    end
  end

end

