terraform-datadog-timeboard-system
=================

Terraform module to create Datadog timeboard for system.



Usage
-----

```hcl
module "timeboard_system_beical-app" {
  source = "github.com/traveloka/terraform-datadog-timeboard-system.git"

  product_domain = "BEI"
  cluster    = "beical-app"
}
```

Terraform Version
-----------------

This module was created using Terraform 0.11.7. 
So to be more safe, Terraform version 0.11.7 or newer is required to use this module.

Authors
-------

* [Karsten Ari Agathon](https://github.com/karstenaa)

License
-------

Apache 2 Licensed. See LICENSE for full details.
