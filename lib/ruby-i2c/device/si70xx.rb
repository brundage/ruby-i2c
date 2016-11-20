module RubyI2C
  class Device
    class SI70XX < Base
      # Silicon Labs Si70xx chips
      # https://www.silabs.com/products/sensors/humidity-sensors/Pages/si7013-20-21.aspx

      ADDRESS               = 0x40
      MEASURE_RH_CMD        = 0xE5
      MEASURE_TEMP_CMD      = 0xE3
      READ_FIRMWARE_REV_CMD = [ 0x84, 0xB8 ]
      READ_SERIAL_NUM_CMD   = [ 0xFA, 0x0F, 0xFC, 0xC9 ]

      def self.address; ADDRESS; end
      def self.measure_rh_cmd; MEASURE_RH_CMD; end
      def self.measure_temp_cmd; MEASURE_TEMP_CMD; end
      def self.read_firmware_rev_cmd; READ_FIRMWARE_REV_CMD; end
      def self.read_serial_num_cmd; READ_SERIAL_NUM_CMD; end

      def command(cmd, length=1, rest=nil)
        super.unpack("C"*length)
      end


      def firmware_revision
        command(self.class.read_firmware_rev_cmd, 1).first
      end
      alias_method :firmware_rev, :firmware_revision


      def initialize(*args)
        super
        @address ||= self.class.address
      end


      def name
        case serial_array[4]
        when 0x00, 0xFF
          :engineering
        when 0x0D
          :si7013
        when 0x14
          :si7020
        when 0x15
          :si7021
        else
          :unknown
        end
      end


      def read(cmd, length=1, rest=nil)
        super.unpack("C"*length)
      end


      def relative_humidity
        ( (125 * measure(self.class.measure_rh_cmd)) / 65535 ) - 6
      end
      alias_method :rh, :relative_humidity


      def serial_number
        (1..7).reduce(0) do |serial,pow|
          serial += serial_array[pow-1] << 8*pow
        end + serial_array[7]
      end
      alias_method :serial, :serial_number


      def temperature
        ( (175.72 * measure(self.class.measure_temp_cmd)) / 65536 ) - 46.85
      end
      alias_method :temp, :temperature

    private

      def measure(*cmd)
        msb, lsb = command(*cmd, 2)
        (msb << 8) + lsb
      end


      def serial_array
        return @serial_array if @serial_array
        cmds = self.class.read_serial_num_cmd
        @serial_array = sift_serial_command cmds.shift(2)
        @serial_array += sift_serial_command cmds.shift(2)
      end


      def sift_serial_command(cmd)
        command(cmd,8).values_at(0,2,4,6)
      end

    end
  end
end
