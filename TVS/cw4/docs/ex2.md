# Commands

### Solution up 

```
cw4/docker compose up -d --scale webapp=<NUMBER_OF_NODES> --no-recreate
```

### Solution down

```
cw4/docker compose down 
```

### List containers

```
docker ps
```

### Logs

```
cw4/docker compose logs -f -t
```

### Running interactive program (shell) in service

```
cw4/docker compose exec -it <SERVICE_NAME> sh
```

---

# Conclusions of exercise 2

### Explain [and show] why http://webapp:PORT is enough on nginx to reach all the replicas
Docker compose sets up an internal DNS server where the IP address of each container is mapped 
to the service name. Because of this when nginx requests the IPS address of webapp, the DNS server
returns the list of IP addresses.

### Explain the purpose of resolver 127.0.0.11 valid=5s in the nginx configuration
The resolver command is used to indicate the IP address of the DNS server used for discovery the 
availables upstreams related to domain names. 
The IP indicated in the command is the IP address of the internal DNS server defined by docker compose.
The flag valid is used to indicate the duration of time where the response from the DNS server is considered 
valid. In other words, during this period of time nginx will not ask the server to resolve a domain name.
