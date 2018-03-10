# Bionic
[![Gem Version](https://badge.fury.io/rb/bionic.svg)](https://badge.fury.io/rb/bionic)  [![Build Status](https://travis-ci.org/floor114/bionic.svg?branch=master)](https://travis-ci.org/floor114/bionic)

Telegram bots building tool.


The library provides next features:
* Easy configuration;
* Built-in message parser into command and arguments;
* Internationalization and localization using [i18n](https://github.com/svenfuchs/i18n) gem;
* Handlers for every command;
* Database connection.

## Installation

1. Install Bionic at the command prompt if you haven't yet:

        $ gem install bionic

2. At the command prompt, create a new Bionic application:

        $ bionic new app

   where `app` is the application name.

3. Change directory to `app` and run:

        $ cd myapp
        $ bundle install

4. Paste your your [bot token and username](https://core.telegram.org/bots#6-botfather) to `.env`.

5. Start the application with:

        $ bionic start


## Usage

For handling new command you need to create new handler called like a command.
For example, if command sent from a user is `/bye`, you need to create handler called `Bye` under `handlers` directory.
This handler should be inherited from `Bionic::Handler` and override `answer` method, which is a message that will be sent back.

```ruby
module Handlers
  class Bye < Bionic::Handler
    private

    def answer
      'Bye!'
    end
  end
end
```

All text after base part of command will be split with `,` and passed to a handler as an array called `args`. 

If there is no necessary handler you will see a corresponding message in logs.

## Project structure

```
.
├── app
│   ├── handlers           # Handlers directory.
|   |   └── .
│   ├── models             # Activerecord models directory.
|   |   └── .
│   └── services           # Services directory.
|       └── .
├── bin
|   └── run                # Run script.
├── config
│   ├── locales            # I18n locales directory.
|   |   └── .
|   ├── application.rb     # Application configuration.
|   ├── boot.rb            # Gems load.
|   └── database.yml       # Database comfiguration.
├── db
|   └── migrate            # Database migrations.
|       └── .
├── log                    # Logs
|   └── .
├── .env                   # Dotenv environment variables.
├── .standalone_migrations # Migrations configuration.
├── Gemfile                # Gems dependencies.
├── Rakefile               # Rake tasks.
└── README.md               
```
## Additional info

More information about bot wrapper you can find [here](https://github.com/atipugin/telegram-bot-ruby).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

If you have some proposals how to improve this boilerplate feel free to open issues and send pull requests!

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License

Bionic is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

