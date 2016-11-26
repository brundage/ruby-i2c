module RubyI2C
  class Device
    # A piece of hardware that speaks the I2C protocol

    autoload :Base, File.join('ruby_i2c', 'device', 'base')
    autoload :SI70XX, File.join('ruby_i2c', 'device', 'si70xx')

  end
end
