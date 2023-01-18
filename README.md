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
    expose:
      - "4242"
      - "8080"
    ports:
      - 2022:2022
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
