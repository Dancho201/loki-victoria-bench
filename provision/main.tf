terraform {
  required_providers {
    lxd = {
      source = "terraform-lxd/lxd"
      version = ">= 1.8.0"
    }
  }

}

provider "lxd" { 
}


resource "lxd_volume" "vlogs_root" {
  name    = "root_volume_vlogs"
  pool    = "default"
  config  = {
    size = "15GB"
  }
  project = "default"
}

resource "lxd_volume" "vlogs_logs" {
  name    = "logs_volume_vlogs"
  pool    = "default"
  config  = {
    size = "30GB"
  }
  project = "default"
}

resource "lxd_volume" "loki_root" {
  name    = "root_volume_loki"
  pool    = "default"
  config  = {
    size = "15GB"
  }
  project = "default"
}

resource "lxd_volume" "loki_logs" {
  name    = "logs_volume_loki"
  pool    = "default"
  config  = {
    size = "30GB"
  }
  project = "default"
}

# Define Instances and attach volumes in the default project
resource "lxd_instance" "loki-bench" {
  name    = "loki-bench"
  image   = "ubuntu:22.04"
  type    = "virtual-machine"
  project = "default"

  device {
    name = "root"
    type = "disk"
    properties = {
      path = "/"
      pool = "default"
    }
  }

  limits = {
    cpu    = 2
    memory = "2GB"
  }

  device {
    name = "logs"
    type = "disk"
    properties = {
      path   = "/mnt/logs"
      source = lxd_volume.loki_logs.name
      pool   = "default"
    }
  }
}

resource "lxd_instance" "vlogs-bench" {
  name    = "vlogs-bench"
  image   = "ubuntu:22.04"
  type    = "virtual-machine"
  project = "default"

  limits = {
    cpu    = 2
    memory = "2GB"
  }

  device {
    name = "root"
    type = "disk"
    properties = {
      path = "/"
      pool = "default"
    }
  }

  device {
    name = "logs"
    type = "disk"
    properties = {
      path   = "/mnt/logs"
      source = lxd_volume.vlogs_logs.name
      pool   = "default"
    }
  }
}


output "vlogs_bench_ip" {
  value = lxd_instance.vlogs-bench.ipv4_address
  
}

output "lok_bench_ip" {
  value = lxd_instance.loki-bench.ipv4_address
  
} 