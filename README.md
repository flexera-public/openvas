OpenVAS 8 with RightScale crs-apps for Docker
=============
[![Docker Pulls](https://img.shields.io/docker/pulls/rightscale/openvas.svg)](https://hub.docker.com/r/rightscale/openvas/)
[![Docker Stars](https://img.shields.io/docker/stars/rightscale/openvas.svg)](https://hub.docker.com/r/rightscale/openvas/)


Docker container for OpenVAS 8 which includes RightScale crs-apps.   
Dockerfile builds from the latest OpenVAS 8 source code release files that were available for OpenVAS 8 here http://www.openvas.org/install-source.html as of September, 16, 2016 

OS
------------
Ubuntu 14.04 (trusty) using `rightscale/crs-apps:master` as the base image https://hub.docker.com/r/rightscale/crs-apps/

Ports
------------
Ports exposed: `443, 9390, 9391`

Usage
-----

Simply run:

```
docker run -d -p 443:443 -p 9390:9390 -p 9391:9391 --name openvas8 rightscale/openvas
```

This will grab the container from docker hub and start it up.  Openvas 8 startup can take some time.  Run `docker logs openvas8` to check the status of `openvas-check-setup`. If everything was setup properly you should see these two messages below in the logs:

* `It seems like your OpenVAS-8 installation is OK.` 
* `Welcome to OpenVAS 8`.  
 
Once confirmed you should be able to login to the GSA Web UI via `https://<machinename>`
```
Username: admin
Password: openvas
```



To run bash inside the container run:

```
docker exec -it openvas8 bash
```

OpenVas 8 Thanks:
------
**Falk** (2015, April 9). [OpenVas 8 on Ubuntu Server 14.04](https://www.mockel.se/index.php/2015/04/openvas-8-on-ubuntu-server-14-04/) (Web log post). Retrieved Sept 2016 from https://www.mockel.se/index.php/2015/04/openvas-8-on-ubuntu-server-14-04/

**Splain, Mike** (2016, February 22). [OpenVAS image for Docker](https://github.com/mikesplain/openvas-docker). Retrieved from https://github.com/mikesplain/openvas-docker

**Katzmann, Serge** (2015, November 2) [Docker container for OpenVAS8](https://github.com/sergekatzmann/openvas8-complete).  Retrieved from  https://github.com/sergekatzmann/openvas8-complete

**Davies, Simon** (2015, February 17) [Installing OpenVAS 8 Beta From Source On Debian](http://www.procheckup.com/blog/installing-openvas-8-beta-from-source-on-debian/).  Retrieved from  http://www.procheckup.com/blog/installing-openvas-8-beta-from-source-on-debian/

