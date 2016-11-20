class RubyI2C
  class Adapter
    class Device < Base

      def self.default_device_file; Dir.glob('/dev/i2c-*').sort.first; end
      def self.default_mutex; Mutex.new; end

      attr_reader :device_file, :mutex

      def initialize(device_file: nil, mutex: nil, force: false)
        super force: force
        @device_file = device_file || self.class.default_device_file
        @mutex = mutex || self.class.default_mutex
      end


      def command(address, cmd, length=1, rest=nil)
        ret = nil
        @mutex.synchronize do
          operate(address) do
            @handle.syswrite encode(cmd)
            sleep rest if rest
            ret = @handle.sysread length
          end
        end
        return ret
      rescue SystemCallError => e
        handle e
      end


      def read(address, length=1)
        ret = nil
        @mutex.synchronize do
          operate(address) do
            ret = @handle.sysread length
          end
        end
        return ret
      rescue SystemCallError => e
        handle e
      end


      def write(address, *data)
        ret = nil
        @mutex.synchronize do
          operate(address) do
            ret = @handle.syswrite encode(*data)
          end
        end
        return ret
      rescue SystemCallError => e
        handle e
      end

    private

      attr_reader :slave_addr

      def close
        return unless @handle.respond_to? :close
        @handle = @handle.close
      end


      def handle(e)
        STDERR.puts "EIO (#{e.errno})"
        raise
      end


      def open
        @handle = File.open @device_file, "r+"
      end


      def operate(address)
        prep_handle address
        yield
        close
      end


      def encode(*data)
         data.pack "C*"
      end


      def prep_handle(address)
        open
        select address
      end


      def select(address)
        return unless @handle.respond_to? :ioctl
        @handle.ioctl @slave_addr, address
      end

    end
  end
end
