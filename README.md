bossjones-packer
================

Create Packer images using Rake tasks

```
± |master ✓| → be rake -T
rake build:digitalocean         # Build a base image from chef cookbooks
rake check:build_vars[service]  # Check that ENV variables are set
rake check:validate[service]    # Validate all the packer templates in service directory
rake spec                       # Run the specs

 |1.9.3-p448|  malcolm-MacBookPro1 in ~/dev/bossjones/bossjones-packer
± |master ✓| →
```
