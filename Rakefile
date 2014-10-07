#
# Rakefile for Packer image creation
#
# Author:: Malcolm Jones (@bossjones)
#

require "rubygems"
require "json"
require "fileutils"
require "net/scp"
require "yaml"
require "versionomy"
require "chef"
require "chef/cookbook/metadata"
require "pry"
# require 'github_api'

# Load constants + local constants from rake config file.
require File.join(File.dirname(__FILE__), "config", "rake-config.rb")

namespace :check do

  desc "Check that ENV variables are set. build_vars[digitalocean]"
  task :build_vars, :service do |_t, args|
    service_dir = args[:service] || "digitalocean"

    # todo: check if the manifest file is up to date.

    path_to_local = File.join(File.dirname(__FILE__), "services", service_dir, "local.sh")

    contents = File.open(path_to_local).read

    contents_clean = ""

    contents.each_line do |line|
      line = line.gsub(/export /, "")
      line = line.split("=")[0]
      contents_clean += line + ","
    end

    contents_clean = contents_clean.gsub(/($)\,/, "")

    puts "ARE THEY SET? - #{contents_clean}"

    ENV_VARS_TO_CHECK = contents_clean.split(",")

    ENV_VARS_TO_CHECK.each do |key|
      fail "Set an environment variable for #{key}\n" if ENV[key].nil?
    end # ENV_VARS_TO_CHECK

  end # build_vars

  desc "Validate all the packer templates in service directory."
  task :validate, :service do |_t, args|
    service_dir = args[:service] || "digitalocean"

    path_to_local = File.join(File.dirname(__FILE__), "services", service_dir)
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

  desc 'Build a base image from chef cookbooks.
   Requires environment variables be set.
   See "rake check:build_vars[service]"
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

    Rake::Task["check:build_vars"].invoke("digitalocean")

    Dir.chdir "#{PACKER_REPO}" do

      exec "packer build #{PACKER_REPO}/services/digitalocean/centos65/packer-centos65.json"

    end # chdir

  end # digitalocean

  task :virtualbox do

    Rake::Task["check:build_vars"].invoke("virtualbox")

    Dir.chdir "#{PACKER_REPO}" do

      exec "packer build #{PACKER_REPO}/services/virtualbox/ubuntu1204/packer-ubuntu1204.json"

    end # chdir

  end # virtualbox

end # build
