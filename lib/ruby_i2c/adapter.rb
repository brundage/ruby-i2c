require 'pp'
module RubyI2C
  class Adapter

    autoload :Base, File.join('ruby_i2c', 'adapter', 'base')
    autoload :Device, File.join('ruby_i2c', 'adapter', 'device')
    autoload :Dummy, File.join('ruby_i2c', 'adapter', 'dummy')

    I2C_SLAVE       = 0x0703
    I2C_SLAVE_FORCE = 0x0706
    I2C_TENBIT      = 0x070
    I2C_FUNCS       = 0x0705
    I2C_RDWR        = 0x0707
    I2C_ACK_TEST    = 0x0710
    I2C_SMBUS       = 0x0720

  end
end
