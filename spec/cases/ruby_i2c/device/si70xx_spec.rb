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
#    expect(subject.serial_number).to be_a Numeric
  end


end
