## ElasticWeb ruby client library

Client library for talking to [Elasticweb API](http://elasticweb.org/ru/user/api). Supports all endpoints.

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'elasticweb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elasticweb

### Usage

Initialize client:

```ruby
client = ElasticWeb::Client.new('API_KEY')
```

And then talk to API:

```ruby
client.me
```

### List of all methods

Client methods just map 1 to 1 to API, see all of them beyond. Check [API docs](https://github.com/elasticweb/api) for list of available `options`.

#### User

```ruby
me
```

#### Account

```ruby
accounts
create_account(options)
update_account(id, options)
delete_account(id)
```

#### Account cron

```ruby
update_cron(id, options)
```

#### Server

```ruby
servers
```

#### Alias

```ruby
aliases(account_id)
create_alias(account_id, options)
update_alias(alias_name, options)
delete_alias(alias_name)
```

#### Domain

```ruby
domains(account_id)
create_domain(account_id, options)
update_domain(domain_name, options)
delete_domain(domain_name)
```

#### DNS

```ruby
domain_dns(domain_name)
dns(id)
create_dns(domain_name, options)
delete_dns(id)
```

#### Database

```ruby
databases(account_id)
create_database(account_id, options)
delete_database(account_id, db_name)
```

#### Database user

```ruby
databases_users(account_id)
database_user_info(account_id, db_user_name)
create_database_user(account_id, options)
update_database_user(account_id, db_user_name, options)
delete_database_user(account_id, db_user_name)
```

#### Billing

```ruby
operation_types
operations(type_name)
```

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dev1vitaly/elasticweb.


### License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

