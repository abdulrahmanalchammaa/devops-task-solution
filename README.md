# devops-task-solution

Docker Compose setup that stands up an MSSQL database and a PHP web server able to query it, plus a launcher script to bring both up with one command.

## Task

- **Container 1 — MSSQL Server**: SQL Server instance with `SA` password `Un!q@to2023`.
- **Container 2 — Web server**: PHP 7.1+ with the proper driver to connect to the MSSQL container, serving [`QuickDbTest.php`](solving%20the%20task/web-root/QuickDbTest.php) from the web root.
- **Launcher**: builds and starts everything in one step.

## Solution

Implemented as three services in [`docker-compose.yml`](solving%20the%20task/docker-compose.yml):

- `mssqlserver` — `mcr.microsoft.com/mssql/server:2022-preview-ubuntu-22.04`
- `php` — custom [`Dockerfile`](solving%20the%20task/Dockerfile) (`php:7.3-fpm-buster` + `msodbcsql17`/`pdo_sqlsrv`/`sqlsrv` extensions) serving `QuickDbTest.php`
- `nginx` — reverse proxy in front of PHP-FPM ([`nginx.conf`](solving%20the%20task/nginx.conf))

## Running

```bash
cd "solving the task"
./launch.sh
```

This runs `docker-compose up --build -d` and verifies both containers came up. The site is then reachable on `http://localhost`.

> The solution files are packaged in `solving the task.rar` in this repo — extract it before running.
