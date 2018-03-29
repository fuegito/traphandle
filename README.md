# traphandle

SNMP traphandler for NET-SNMPD written in crystal-lang.

Exports traps (or informs) to a redis list using rpush.

More infos for using and installing crystal-lang:
* https://crystal-lang.org/
* https://crystal-lang.org/docs/installation/
* https://medium.com/@DuroSoft/why-crystal-is-the-most-promising-programming-language-of-2018-aad669d8344f

Pre-compiled binaries are included in bin/ (traphandle and traphandle.static).

Compiled on 3.16.0-5-amd64 #1 SMP Debian 3.16.51-3+deb8u1 (2018-01-08) x86_64 GNU/Linux


Benchmarks for crystal-lang vs. others:
* https://github.com/tbrand/which_is_the_fastest
* https://github.com/drujensen/fib
* https://github.com/kostya/crystal-benchmarks-game
* https://github.com/kostya/benchmarks

## Installation

    git clone https://github.com/fuegito/traphandle.git
    cd traphandle
    crystal deps

build "semi-static":

    crystal build src/traphandle.cr --release
or full-static:

    crystal build src/traphandle.cr --release --static

## Usage

for testing (no redis connection is done, output to STDOUT):

    ./traphandle 1 127.0.0.1 6379 snmp hallo123

for production use (in snmptrapd.conf):

    traphandle default <path>/traphandle.static 0 127.0.0.1 6379 snmp <password>

description:

traphandle <test = 0|1> <redis_host> <redis_port> <redis_list_name> <redis_password>

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/fuegito/traphandle/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [fuegito](https://github.com/fuegito) Stefan Feurle - creator, maintainer
