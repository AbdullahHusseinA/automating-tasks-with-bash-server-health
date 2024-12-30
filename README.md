# Automating Tasks with Bash: Server Health Monitoring

## Description

This project automates common administrative tasks on a Linux server by scheduling cron jobs to monitor server health, including disk usage, memory, CPU load, network connectivity, and service uptime. It generates periodic reports and logs for the health checks and alerts.

## Technologies Used
- **Bash Scripting**: Used for writing the scripts that perform the tasks.
- **Cron Jobs**: Used for automating the scheduling of tasks.
- **Linux server tools**: Various system utilities for disk, memory, CPU, and network monitoring.

<<<<<<< HEAD
## Prerequisites
Before running this project, ensure the following prerequisites are met:
1. A Linux-based operating system.
2. Bash shell and basic familiarity with terminal commands.
3. Required tools installed:
   - `df` (for disk monitoring, part of coreutils).
   - `free` (for memory monitoring, typically included by default).
   - `mpstat` (for CPU monitoring, included in `sysstat` package).
   - `ping` (for network monitoring, part of iputils).
   - Sufficient privileges to modify cron jobs and execute shell scripts.

=======
>>>>>>> 4fa4e5b (Initial commit: Add project files, scripts, and README)
## Installation Instructions

1. **Clone the repository** to your local machine:

    ```bash
    git clone https://github.com/<your-username>/automating-tasks-with-bash-server-health.git
    cd automating-tasks-with-bash-server-health
    ```

2. **Make the scripts executable**:

    ```bash
    chmod +x ./scripts/*.sh
    ```

3. **Edit the paths** in the cron job instructions to your file locations.

    Example (replace `/path/to` with actual file paths):
    - `/home/user/automating-tasks-with-bash-server-health/scripts/check_disk.sh`
    - `/home/user/automating-tasks-with-bash-server-health/scripts/check_memory.sh`
    - `/home/user/automating-tasks-with-bash-server-health/scripts/check_cpu.sh`
    - `/home/user/automating-tasks-with-bash-server-health/scripts/generate_report.sh`

## How to Schedule Cron Jobs

To automate these tasks, add them to cron jobs.

1. Edit the crontab:

    ```bash
    sudo crontab -e
    ```

2. Add the following cron job entries (ensure to adjust the paths to your files):

    ```txt
    # Cron jobs for server health monitoring

    # Check disk every Sunday at 2 AM
    0 2 * * 0 /path/to/check_disk.sh

    # Check memory every Sunday at 3 AM
    0 3 * * 0 /path/to/check_memory.sh

    # Check CPU usage every Sunday at 4 AM
    0 4 * * 0 /path/to/check_cpu.sh

    # Check network every Sunday at 5 AM
    0 5 * * 0 /path/to/check_network.sh

    # Check service uptime every Sunday at 6 AM
    0 6 * * 0 /path/to/service_uptime.sh

    # Generate summary report every Sunday at 7 AM
    0 7 * * 0 /path/to/generate_report.sh
    ```

## Logs and Reports

The scripts produce logs that contain important health information:

- `/logs/disk.log`: Disk usage information.
- `/logs/memory.log`: Memory usage information.
- `/logs/cpu.log`: CPU usage statistics.
- `/logs/network.log`: Network health report.
- `/logs/uptime.log`: Service uptime status.
- `summary_report.log`: A comprehensive report generated every week.

You can find the logs in the `logs/` directory, and each script outputs logs of the tasks it performs.

## Troubleshooting

- **Missing tools**: Ensure that the tools used in the scripts, such as `mpstat` (for CPU monitoring), are installed. You can install them using:
  
  ```bash
  sudo apt-get install sysstat
  ```
## Contributing

Feel free to fork the repository, make changes, and submit pull requests. Contributions are always welcome.

## Licence

This project follows the [MIT License](LICENSE).


