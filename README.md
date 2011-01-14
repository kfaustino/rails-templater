# Rails Templater

This is a template which allows creating new Ruby on Rails 3 applications quickly using some opinionated defaults. It is inspired by ffmike's [BigOldRailsTemplate](http://github.com/ffmike/BigOldRailsTemplate) Rails 2 template project. To use templater with your Rails apps, use the -m switch when creating your application:

    rails new application_name -JOT -m templater.rb

## Install

    gem install rails_templater
  
## Usage

At the command prompt, create a new Rails application using rails_templater:

    templater myapp_name
  
## Generated Application

Rails Templater will generate the following:

### Ruby on Rails

* Uses [Haml](http://haml-lang.com) as the template engine
* Uses [Sass](http://sass-lang.com) for generating CSS
* [jQuery](http://jquery.com/) for JavaScript over Prototype
* Optionally uses [Compass](http://compass-style.org) for design with the blueprint/semantic framework

## Database

* Uses [Mongoid](http://mongoid.org/) as the Object Document Mapper
* TODO: Optionally add the ability for other databases

## Testing

* [RSpec](http://github.com/rspec/rspec) for testing
* [factory_girl](http://github.com/thoughtbot/factory_girl) for fixture replacement
* [remarkable](http://github.com/remarkable/remarkable) for ActiveModel RSpec matchers
* Optionally uses [Cucumber](http://github.com/aslakhellesoy/cucumber-rails) for integration tests
    
## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix in a branch.
* Send me a pull request.
