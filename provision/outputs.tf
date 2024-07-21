output "vlogs_bench_ip" {
  value = lxd_instance.vlogs-bench.ipv4_address
  
}

output "grafana-bench_ip" {
  value = lxd_instance.grafana-bench.ipv4_address
  
}

output "loki_bench_ip" {
  value = lxd_instance.loki-bench.ipv4_address
  
} 