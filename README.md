# RandomAPI

Interface with the RandomAPI at https://randomuser.me and provide a ruby wrapper for the responses. Interact with response as a Ruby object with helper methods for fetching all important data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'random_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install random_api

## Usage

Using RandomAPI is simple, you can use it anonymously or use your API Key to make requests.

```ruby
# Create a RandomAPI service with anonymous access to the API
service = RandomApi::Service.new

# Fetch a single random user
user = service.user

# Fetch a male user
user = service.user(gender: "male")

# Fetch a list of users
user = service.users(10)

# Fetch 10 male users
user = service.users(10, gender: "male")

# If you have an API Key, pass it to service
service = RandomApi::Service.new(api_key)

# Then make requests as per the norm
```

The object returned by the call to `RandomApi::Service#user` and `RandomApi::Service#users` is of the type `RandomApi::User`.

```ruby
user = service.user

user.gender # => "female"
user.name # => "Ms. Lois Williams"
user.title # => "Ms."
user.first_name # => "Lois"
user.last_name # => "Williams"
user.street # => "1969 Elgin St"
user.city # => "Frederick"
user.state # => "Delaware"
user.zip # => "56298"
user.email # => "lois.williams50@example.com"
user.username # => "heavybutterfly920"
user.password # => "enterprise"
user.salt # => ">egEn6YsO"
user.md5 # => "2dd1894ea9d19bf5479992da95713a3a",
user.sha1 # => "ba230bc400723f470b68e9609ab7d0e6cf123b59",
user.sha256 # => "f4f52bf8c5ad7fc759d1d4156b25a4c7b3d1e2eec6c92d80e508aa0b7946d4ba",
user.registered # => "1288182167",
user.dob # => "146582153",
user.phone # => "(555)-942-1322",
user.cell # => "(178)-341-1520",
user.SSN # => "137-37-8866",
user.large_picture # => "http://api.randomuser.me/portraits/women/55.jpg",
user.medium_picture # => "http://api.randomuser.me/portraits/med/women/55.jpg",
user.thumbnail # => "http://api.randomuser.me/portraits/thumb/women/55.jpg",
user.api_version # => "0.4.1"
user.seed # => "graywolf"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/random_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
