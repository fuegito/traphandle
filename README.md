# traphandle

SNMP traphandler for NET-SNMPD.
Exports traps (or informs) to a redis list using rpush.

## Installation

    git clone https://github.com/fuegito/traphandle.git
    cd traphandle
    crystal build src/traphandle.cr --release
or
    crystal build src/traphandle.cr --release --static

## Usage

/traphandle 1 127.0.0.1 6379 snmp hallo123
/traphandle <test = 0|1> <redis_host> <redis_port> <redis_list_name> <redis_password>

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/[your-github-name]/traphandle/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[your-github-name]](https://github.com/[your-github-name]) Stefan Feurle - creator, maintainer
