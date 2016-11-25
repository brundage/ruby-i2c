module RubyI2C
  class Device
    class Base

      attr_reader :adapter, :address

      def initialize(adapter: RubyI2C::Adapter::Device.new, address: nil)
        @adapter = adapter
        @address = address
      end


      def command(*args)
        adapter.command address, *args
      end


      def read(*args)
        adapter.read address, *args
      end


      def write(*args)
        adapter.write address, *args
      end

    end
  end
end
