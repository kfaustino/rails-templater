create_file '.rvmrc' do
  "rvm use #{RailsTemplater::RvmBootstrap.environment_name}\n"
end
