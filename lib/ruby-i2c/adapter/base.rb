require 'pp'
class RubyI2C
  class Adapter
    class Base

      def initialize(force: false)
        @slave_addr = force ? I2C_SLAVE_FORCE : I2C_SLAVE
      end


      def read(address, length=1)
        raise NotImplementedError
      end


      def write(address, *data)
        raise NotImplementedError
      end

    private

     attr_reader :slave_addr

    end
  end
end
