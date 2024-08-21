# Introduction to MySQL

To get started, we need to install a version of MySQL on your PC. In my case,
I will use Docker for this process as it seems to be the best option.

## Create MySQL container

Run this command in your terminal

```bash
docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=test12345 -d mysql:latest

```

Now you will have a container with the MySQL image that we can use for
practice. Additionally, we have exposed port 3306, which MySQL uses to
create connections to the database, outside the container.

## How to connect to MYSQL ?

```bash
docker exec -it mysql bash

# Connect MySQL
mysql -u root -ptest12345

#Check
show databases;
```

Everthing is set up, and we're ready to practice with MySQL
