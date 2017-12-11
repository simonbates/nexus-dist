A distribution of the Nexus and supporting tools.

# Running the Nexus

## Docker

Users with Docker installed (either for Mac/Windows or natively on Linux) can use the provided Dockerfile to built and start Nexus containers.

The easiest method for someone to start a container running the Nexus is to use the public `gpii/nexus` image:

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

The Docker container can also be started using the provided [seccomp]() profile to further limit what processes running inside it are able to do:

```
$ docker run -d -p 9081:9081 --security-opt seccomp=nexus-seccomp.json gpii/nexus
```

At the moment, the seccomp profile does not allow processes to open external network connections (the [connect()](https://linux.die.net/man/2/connect) syscall is not allowed) or acquire new Linux [capabilities](http://man7.org/linux/man-pages/man7/capabilities.7.html).

Users can also limit the amount of CPU and memory that the container can use. For more information, read the Docker documention about [resource constraints](https://docs.docker.com/engine/admin/resource_constraints/).

## Vagrant

For users without Docker installed or that would like to limit Docker usage inside a virtual machine, it's possible to use Vagrant to start a VirtualBox-based Linux VM that includes Docker and run the Nexus container inside it.

Ensure you have the following software installed:

 * [VirtualBox](https://www.virtualbox.org)
 * [Vagrant](https://www.vagrantup.com)

Now run the following commands:

```
$ git clone https://github.com/GPII/nexus-dist
$ cd nexus-dist
$ vagrant up
```

A new Linux VM will be provisioned and the Docker instance running inside it will be used to start the Nexus container.

To build and start a new Docker container inside the VM (in case you have modified the Nexus source code), run:

```
$ vagrant provision
```
