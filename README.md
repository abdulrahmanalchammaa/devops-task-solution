# devops-task-solution
Task
Create two docker containers, one holding a MSSQL database, another one holding a Web-Server offering a pre-defined PHP script. Finally write a Launcher, which starts both containers, so the Web-Server can be called

Docker Container 1: MSSQL-Server
Write a Dockerfile for the following tasks

Perform MSSQL Server Installation
Set password for SA to Un!q@to2023
Run MSSQL Service
Docker Container 2: API
Install Webserver of your choice
Install PHP 7.1+
Install proper driver to connect to MSSQL Server (s. Container 1 above)
Add the script QuickDbTest.php to the web-root folder
Launcher
Write a launcher, which builds and starts both containers (can be shell scripting or docker-compose)
