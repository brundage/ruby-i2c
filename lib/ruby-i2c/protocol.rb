class RubyI2C
  module Protocol
    autoload :Full, File.join('ruby-i2c', 'protocol', 'full')
    autoload :SMBus, File.join('ruby-i2c', 'protocol', 'smbus')
  end
end
