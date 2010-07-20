# Rails Templater

This is a template which allows creating new Ruby on Rails 3 applications quickly using some opinionated defaults. It is inspired by ffmike's [BigOldRailsTemplate](http://github.com/ffmike/BigOldRailsTemplate) Rails 2 template project. To use templater with your Rails apps, use the -m switch when creating your application:

    rails new application_name -JOT -m templater.rb

## Getting started

* Clone rails-templater to your hard drive
* Generate the Rails application: <pre><code>rails new application_name -JOT -m /path/to/rails-templater/templater.rb
  
## Generated Application

Rails Templater will generate the following:

### Ruby on Rails

* Uses [Haml](http://haml-lang.com) as the template engine
* Uses [Sass](http://sass-lang.com) for generating CSS
* [jQuery](http://jquery.com/) for JavaScript over Prototype
* Optionally uses [Compass](http://compass-style.org) for design with the blueprint/semantic framework

## Database

* Uses [Mongoid](http://mongoid.org/) as the Object Document Model
* TODO: Optionally add the ability for other databases

## Testing

* [RSpec](http://github.com/rspec/rspec) for testing
* [factory_girl](http://github.com/thoughtbot/factory_girl) for fixture replacement
* Optionally uses [Cucumber](http://github.com/aslakhellesoy/cucumber-rails) for integration tests
    
## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Send me a pull request. Bonus points for topic branches.
