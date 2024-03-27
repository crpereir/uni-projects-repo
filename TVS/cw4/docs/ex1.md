# Commands

### Build docker image

```
cw4/app/docker build -t tvsapp .
```

### List docker images

```
docker images
```

### Create container from tvsapp image

```
docker run -itd -p <PORT>:4007/tcp tvsapp
```

### List containers

```
docker ps
```

### Start container

```
docker start <CONTAINER-NAME>
```

### Stop container

```
docker stop <CONTAINER-NAME>
```

### Remove container

```
docker rm <CONTAINER-NAME>
```

---

# Conclusions of exercise 1

### **Host**: id of container

### **Port**: internal port define in NODE_PORT
