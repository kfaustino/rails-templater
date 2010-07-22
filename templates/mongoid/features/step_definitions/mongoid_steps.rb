Given /^an (.+) exists with an? "([^"]*)" of "([^"]*)"$/ do |model, field, value|
  Factory model, field => value
end