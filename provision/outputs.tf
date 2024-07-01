output "vlogs_bench_ip" {
  value = lxd_instance.vlogs-bench.ipv4_address
  
}

output "lok_bench_ip" {
  value = lxd_instance.loki-bench.ipv4_address
  
} 