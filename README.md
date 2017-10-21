# Dogecoind container

Docker script to start a dogecoind node on Digital Ocean. You need a DO server and a volume (between 50GB and 100GB) call `data`.

## Commands

```
$ docker-compose build
$ docker-compose up -d
```

## Notes

You should modify the `RPCUSER` and `RPCPASS` value.

Does not work on scaleway for some reasons...
