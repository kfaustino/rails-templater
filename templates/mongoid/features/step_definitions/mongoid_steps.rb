Given /^an? (.+) exists with an? (.+) of "([^"]*)"$/ do |model, field, value|
  factory_name = model.gsub(' ', '_')
  Factory factory_name, field => value
end