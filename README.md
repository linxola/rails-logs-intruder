# RailsLogsIntruder

Very simple ruby gem that outputs your (or default) text into Rails logs

## Usage example

    $ rails s
    => Booting Puma
    => Rails 7.0.8 application starting in development 
    => Run `bin/rails server --help` for more startup options

    ██╗  ██╗███████╗██╗     ██╗      ██████╗     ████████╗██╗  ██╗███████╗██████╗ ███████╗
    ██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝
    ███████║█████╗  ██║     ██║     ██║   ██║       ██║   ███████║█████╗  ██████╔╝█████╗
    ██╔══██║██╔══╝  ██║     ██║     ██║   ██║       ██║   ██╔══██║██╔══╝  ██╔══██╗██╔══╝
    ██║  ██║███████╗███████╗███████╗╚██████╔╝       ██║   ██║  ██║███████╗██║  ██║███████╗
    ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝        ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rails_logs_intruder

Or you can manually add the gem to the application's Gemfile:

    gem 'rails_logs_intruder', '~> 0.1.1'

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rails_logs_intruder

## Usage

To use the gem in your Rails application, create in `config/initializers` `rails_logs_intruder.rb` file with such contents:

    RailsLogsIntruder.configure do |config|
    config.default_message = <your_default_message>
    end


After that, add this to `config/application.rb`:

    config.after_initialize do
        RailsLogsIntruder.put_message
    end

You can pass to `RailsLogsIntruder.put_message` your custom message or leave empty for default.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).
