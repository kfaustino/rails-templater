require 'thor/group'

module RailsTemplater
  class Cli < Thor::Group
    argument :application_name, :type => :string, :desc => "The name of the rails application"
    desc "Generates a new Rails application with templater'"

    def run_templater
      system("rails new #{application_name} -JOT -m #{RailsTemplater::template_path}")
    end

  end
end
