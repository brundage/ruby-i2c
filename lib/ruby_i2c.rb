require 'ruby_i2c/version'
module RubyI2C

  autoload :Adapter, File.join('ruby_i2c','adapter')
  autoload :Device, File.join('ruby_i2c', 'device')

end

I2C = RubyI2C unless Module.const_defined? :I2C
