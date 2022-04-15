
# nginx

```
          ,-.
 ,     ,-.   ,-.
/ \   (   )-(   )
\ |  ,.>-(   )-<
 \|,' (   )-(   )
  Y ___`-'   `-'
  |/__/   `-'
  |
  |
  |    -hi-
__|_____________
```

Helm chart to deploy [nginx](https://www.nginx.com).
Chart supports environment variables inside of the nginx.conf file.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` | number of replicas for nginx deployment. |
