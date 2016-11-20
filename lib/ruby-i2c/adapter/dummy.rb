module RubyI2C
  class Adapter
    class Dummy < Base
      # For testing devices

      def initialize(force: false, returns: {})
        super
        self.returns = returns
      end


      def command(*args)
        returns[__method__]
      end


      def read(*args)
        returns[__method__]
      end


      def write(*args)
        returns[__method__]
      end

    private

      attr_accessor :returns

    end
  end
end
