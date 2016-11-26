require 'pp'
module RubyI2C
  class Adapter
    # An Adapter interfaces with hardware to speak the I2C protocol to a Device

    autoload :Base, File.join('ruby_i2c', 'adapter', 'base')
    autoload :Dummy, File.join('ruby_i2c', 'adapter', 'dummy')
    autoload :UnixDevice, File.join('ruby_i2c', 'adapter', 'unix_device')

    I2C_SLAVE       = 0x0703
    I2C_SLAVE_FORCE = 0x0706

  end
end
