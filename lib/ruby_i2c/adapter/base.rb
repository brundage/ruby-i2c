module RubyI2C
  class Adapter
    class Base

      def initialize(force: false, **args)
        @slave_addr = force ? I2C_SLAVE_FORCE : I2C_SLAVE
      end


      def command(address, cmd, length=1, rest=nil)
        raise NotImplementedError
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
