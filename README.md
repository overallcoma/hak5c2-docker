# hak5c2-docker
Docker Build for Hak5C2

## Example docker-compose.yml

```docker-compose
---
version: "2.1"
services:
  hak5c2:
    image: overallcoma/hak5c2-docker:main
    container_name: hak5c2
    hostname: hak5c2
    environment:
      - C2_HOSTNAME=my.domain.com
    ports:
      - 2022:2022
      - 8080:8080
    volumes:
      - hak5c2:/data
    restart: unless-stopped

networks:
  default:
    external:
      name: MyNetworkName
volumes:
  hak5c2:
    name: hak5c2
```

### Retrieve Setup Token
```
docker exec hak5c2 cat /c2_setup_token.txt
