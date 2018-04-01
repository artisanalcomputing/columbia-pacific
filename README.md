# columbia-pacific

Haskell based JSON API for Columbia-Pacific region attraction data.
Work in Progress.


## Build & Run

First clone the repo:

This project is built using [Stack](http://docs.haskellstack.org/en/stable/README.html). To install all deps and build an executable:

```
$ stack setup
...
$ stack build

```

Then you can use the `ghci` REPL to interact with the API.

```
$ stack ghci
....
*ColumbiaPacific> serve
Starting Server...
Setting phasers to stun... (port 3000) (ctrl-c to quit)
```

Then you can get JSON attraction data at http://localhost:3000/attractions or http://localhost:3000/attractions/:id

## License

[BSD3](https://github.com/gyg-ai/columbia-pacific/blob/master/LICENSE) License 2018 © gyg.ai

