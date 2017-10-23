# Dogecoind container

Docker script to start a dogecoind node on Scaleway (http://scaleway.com/).

## Setup

You will need the latest version of docker-machine, docker (http://docker.io/) and docker scaleway plugin (https://github.com/scaleway/docker-machine-driver-scaleway) install on your computer and a scaleway account.

## Create a scaleway server + volume

```
$ export ACCESS_KEY=<your access key from scaleway>
$ export TOKEN=<your token from scaleway>
```
Like describe in the scaleway/docker github (https://github.com/scaleway/docker-machine-driver-scaleway#1-get-your-scaleway-credentials)

Now you can create your server which will run the dogecoind node.

```
docker-machine create -d scaleway --scaleway-token=$TOKEN --scaleway-organization=$ACCESS_KEY --scaleway-name="dogecoind" --scaleway-commercial-type="VC1M" --scaleway-volumes="50G" dogecoind
```

We are adding a 50G volumes that will store the data.

## Mount the volume

You will need to mount manually the volume that we created by following this instructions : https://www.scaleway.com/docs/attach-and-detach-a-volume-to-an-existing-server/#-Attach-a-volume-to-an-existing-server

## Download bootstrap.dat and dogecoin.conf

We are now going to use `docker-machine ssh` and `docker-machine scp` command to add the config file and a bootstrap of the database.

First, we add our dogecoin.conf
```
$ docker-machine scp dogecoind/dogecoin.conf dogecoind:/mnt/data
```

Then download the bootstrap.dat to our mounted volume.
```
$ docker-machine ssh dogecoind
$ cd /mnt/data
$ wget https://bootstrap.chain.so/bootstrap.dat
```

We can verify that we have everything setup
```
$ ls
bootstrap.dat  dogecoin.conf  lost+found
$ exit
```

## Start our container

Now we can start our container !
```
$ docker-compose --build up -d
```

We are all set !

## Notes

You should modify the `RPCUSER` and `RPCPASS` value.
