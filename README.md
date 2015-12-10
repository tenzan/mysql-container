# Creating docker container for sample.sql in MySQL

## Install docker

Instructions for Mac OS X

1. Install docker

 `brew install Caskroom/cask/dockertoolbox`

 Alternative install https://docs.docker.com/v1.8/installation/mac/

2. You will need to start a docker daemon.
 - From Applications run `Docker Quickstart Terminal`, which will open a terminal
and create a docker daemon as a VirtualBox VM with name `default`.
 - This can be checked by `VBoxManage list runningvms` or `docker-machine ls`.

3. Check if install was successful by running `docker run hello-world`

4. Run `docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7.9`

 General format:
 `docker run --name <container-name> -e MYSQL_ROOT_PASSWORD=<password-for-root> -d mysql:<version>`

5. Check if container `mysql-container` is running with `docker ps`

6. Login into the `mysql-container`: `docker exec -it mysql-container bash`
 - This will mean you logged in another linux environment, so you can login mysql by `mysql -uroot --proot`

7. Connect to MySQL from the MySQL command line client

 `docker run -it --link mysql-container:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'`

8. Logs: `docker logs mysql-container`

9. Connect to MySQL from an application in another Docker container (Work in Progress)

 `docker run --name some-app --link some-mysql:mysql -d application-that-uses-mysql`

10. Create `catalog` database in the `mysql-container`. Refer to step 6 or 7 to access container's mysql.

11. Import `sample.sql`: `docker exec -i mysql-container mysql -uroot -proot products < sample.sql`

# TODO
- Extend instructions for Ubuntu and Windows
- Check if steps 10-11 can be automated with `Dockerfile` or `docker-composer.yml`
- Create a docker image and push it to a DockerHub.

_Notes:_ OFFICIAL REPOSITORY is Debian based
 - Dockerfile: https://goo.gl/1sWRXV
 - https://hub.docker.com/_/mysql/
