Task summary:

- VictoriaLogs is TSDB easier to setup comapred to Loki v3.
- VictoriaLogs uses the LogsQL language for querying logs, which appears to be more         user-friendly than Loki's LogQL.
- LogsQL offers Linux utilites for logs log analysis such as "uniq", "less", "stats"...
- The VictoriaLogs documentation is well-written and easy to understand.
- Victorialogs could be integrated with Grafana like Loki

VictoriaLogs is in an early development phase, and its Grafana datasource currently does not support all the functionalities offered by Loki at this moment.
Current version of grafana datasource for VictoriaLogs - https://github.com/VictoriaMetrics/victorialogs-datasource/releases/tag/v0.2.6

Benchmarking:

I created a benchmarking setup to compare the hardware usage of Loki and VictoriaLogs. I used Promtail as scraper for both VMs and set up Netdata on each VM to send metrics to a container. In this container, I used VictoriaLogs and Grafana to visualize the resource usage on these two machines.

The results of the benchmark show that the VictoriaLogs VM used less CPU and RAM compared to the Loki virtual machine. Both VMs generated 4.6 GB of unarchived logs during the same time period.

