describe RubyI2C::Device::SI70XX do

  let(:adapter) { RubyI2C::Adapter::Dummy.new returns: returns }
  let(:command_return) { "0" * 8 }
  let(:read_return) { "0" * 8 }
  let(:returns) { { command: command_return,
                    read: read_return,
                    write: write_return
                } }
  let(:subject) { described_class.new adapter: adapter }
  let(:write_return) { "0" * 8 }


  it 'reads temperature' do
    expect(subject.temperature).to be_a Numeric
  end


  it 'reads relative humidity' do
    expect(subject.relative_humidity).to be_a Numeric
  end


  it 'provides its firmware revision' do
    expect(subject.firmware_revision).to be_a Numeric
  end


  it 'provides its serial number' do
    expect(subject.serial_number).to be_a Numeric
  end


  it 'read returns an array' do
    expect(subject.read 0).to be_an Array
  end


  it 'sends reset' do
    allow(adapter).to receive(:write)
    subject.reset
    expect(adapter).to have_received(:write).with(described_class.address, described_class.reset_cmd)
  end


  describe 'names' do

    let(:serial_array) { [ 0, 0, 0, 0, serial_number ] }

    before do
      allow(subject).to receive(:serial_array).and_return(serial_array)
    end

    { 0x00 => :engineering,
      0xff => :engineering,
      0x0D => :si7013,
      0x14 => :si7020,
      0x15 => :si7021,
      0x01 => :unknown }.each_pair do |num,name|

        context name.to_s do
          let(:serial_number) { num }
          it "returns #{name} for #{num}" do
            expect(subject.name).to eq(name)
          end
      end
    end
  end


end
