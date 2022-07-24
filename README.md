# Dogecoind docker container

```
$ docker build -t dogecoind .
$ docker run --rm --network=host -v $PWD/data:/root/.dogecoin -v $PWD/dogecoin.example.conf:/root/dogecoin.conf:ro dogecoind
```

## Notes

You should modify the `RPCUSER` and `RPCPASS` value.
