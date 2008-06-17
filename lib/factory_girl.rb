require 'activesupport'
require 'factory_girl/factory'
require 'factory_girl/attribute_proxy'
require 'factory_girl/sequence'
require 'factory_girl/lorem'

# Shortcut for Factory.create.
#
# Example:
#   Factory(:user, :name => 'Joe')
def Factory (name, attrs = {})
  Factory.create(name, attrs)
end

def HashFactory( name, attrs = {})
  Factory.attributes_for(name, attrs)
end