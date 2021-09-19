# Dogecoind docker container

```
$ docker build -t dogecoind .
$ docker run -d -v $PWD/data:/root/.dogecoin dogecoind
```

## Notes

You should modify the `RPCUSER` and `RPCPASS` value.
