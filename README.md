# Nexus

This project provides a distribution of the Nexus and includes the following components:

- Nexus base API
- Visible Nexus web interface
- Co-Occurrence Engine for dynamic creation and wiring of components

Docker and Vagrant configurations are provided for running the Nexus with the components listed above.

## Running the Nexus

### Docker

Users with Docker installed (Docker For Windows, Docker For Mac, or natively on Linux) can run Nexus either by building a container image themselves, using the provided Dockerfile, or by using the public `gpii/nexus` image.

The easiest method to start a container running the Nexus is to use the public `gpii/nexus` image:

```
$ docker run -d -p 9081:9081 gpii/nexus
```

This will run the Nexus in the background and expose it on port 9081.

Users can also build a new Docker image locally:

```
$ git clone https://github.com/GPII/nexus-dist
$ cd nexus-dist
$ docker build -t gpii/nexus .
```

The Docker container can be started using the provided [seccomp](https://docs.docker.com/engine/security/seccomp/) profile to further limit what processes running inside it are able to do:

```
$ docker run -d -p 9081:9081 --security-opt seccomp=nexus-seccomp.json gpii/nexus
```

The seccomp profile stops processes from opening external network connections (the [connect()](http://man7.org/linux/man-pages/man2/connect.2.html) syscall is not allowed) or acquiring new Linux [capabilities](http://man7.org/linux/man-pages/man7/capabilities.7.html).

Users can also limit the amount of CPU and memory that the container can use. For more information, please see the Docker documention on [resource constraints](https://docs.docker.com/engine/admin/resource_constraints/).

### Vagrant

For users without Docker installed, or who would like to limit Docker usage to within a virtual machine, it's possible to use Vagrant to start a VirtualBox-based Linux VM. The VM includes Docker and will run the same Nexus container built above.

Ensure you have the following software installed:

 * [VirtualBox](https://www.virtualbox.org)
 * [Vagrant](https://www.vagrantup.com)

Now run the following commands:

```
$ git clone https://github.com/GPII/nexus-dist
$ cd nexus-dist
$ vagrant up
```

A new Linux VM will be provisioned and the Docker instance inside it will be used to start the Nexus container.

To build and start a new Docker container inside the VM (in case you have modified the Nexus source code), run:

```
$ vagrant provision
```

## Using the Nexus

The Nexus API will be available on port 9081 and the Visible Nexus web interface can be accessed at:

- [http://localhost:9081/visible-nexus/visibleNexus.html](http://localhost:9081/visible-nexus/visibleNexus.html)
