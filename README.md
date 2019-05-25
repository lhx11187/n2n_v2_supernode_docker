# n2n_v2_supernode_docker

Based on [ntop_n2n_v2](https://github.com/ntop/n2n),and make some modifications to use in Alpine Linux.

Size just 10MB and easy to build.

## Build

The dot "." means current directory,v2 is the image name(change it if you like).

```
docker build -t v2 .
```

## Run

7654 is the port defined at Dockerfile.

```
docker run --rm -p 7654:7654/udp v2
```

## Connect

see at ntop's doc.
