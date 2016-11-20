module RubyI2C
  class Device

    autoload :Base, File.join('ruby-i2c', 'device', 'base')
    autoload :SI70XX, File.join('ruby-i2c', 'device', 'si70xx')

  end
end
