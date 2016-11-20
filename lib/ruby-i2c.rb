require 'ruby-i2c/version'
class RubyI2C

  autoload :Adapter, File.join('ruby-i2c','adapter')
  autoload :Protocol, File.join('ruby-i2c', 'protocol')

end

I2C = RubyI2C unless Module.const_defined? :I2C
