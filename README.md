# SsredisOrm

SsredisOrm it's just a very basic and simple redis orm, made for fun and learning purposes.

It doesn't support relationships but i hope it does one day. Feel free to contibute and i hope it helps someone :).

## Installation

Add this line to your application's Gemfile:

    gem 'ssredis_orm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ssredis_orm

## Usage

###Setting up redis rerver connection

You should initialize redis and set up a global $redis variable.

    require 'redis'
    $redis = Redis.new(:host => 'localhost', :port => 6379)
    
###Defining your model

Just create your model and extend `SsredisOrm::Model`.
    
    class User
        extend SsredisOrm::Model
        field :name, :username, :password
    end

Specify as many fields you wish to persist. Fields and the class itself will be serialized using de `JSON` library and persisted in redis under the key `#{class.name}:#{@id}`. Id's are auto-incremental, using redis atomic increment operations.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
