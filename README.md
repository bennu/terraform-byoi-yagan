# Yagan BYOI

> BYOI stands for *bring your own infrastructure*.

This module aims to deploy kubernetes on pre-created infrastructure, just passing a list of nodes (containing a node names and IPs), ssh private key previuosly configured on hosts and a user.

such as:

```hcl
module cluster {
  source = "bennu/yagan/byoi"
  nodes = {
    controlplane = [
      {
        name = "node-0"
        ip = "192.168.1.10"
        labels = {}
        taints = []
      }
    ]
    etcd = [
      {
        name = "node-1"
        ip = "192.168.1.11"
        labels = {}
        taints = []
      }
    ]
    worker = [
      {
        name = "node-2"
        ip = "192.168.1.12"
        labels = {}
        taints = []
      }
    ]
  }
  private_key = file(var.private_key)
  user = "root"
  ...
}
```

## Customization

This module uses [yagan/kubernetes](https://registry.terraform.io/modules/bennu/yagan/kubernetes/latest) and [yagan/addons](https://registry.terraform.io/modules/bennu/yagan/addons/latest), passing needed variables for both modules, which can be found in [`vars.tf`](./vars.tf).

Please refer to each of the modules for documentation on configuring either.