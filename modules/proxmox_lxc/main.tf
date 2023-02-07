resource "proxmox_lxc" "basic" {
  target_node  = var.target_node
  hostname     = var.hostname
  ostemplate   = var.ostemplate
  password     = var.password
  unprivileged = true
  rootfs {
    storage = "local-zfs"
    size    = var.size
  }
  features {
    fuse    = true
    nesting = true
    mount   = "nfs;cifs"
  }
  network {
    name   = "eth0"
    bridge = var.bridge
    ip     = var.ip
  }
}
