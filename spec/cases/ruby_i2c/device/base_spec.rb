describe RubyI2C::Device::Base do

  it 'has an device adapter by default' do
    expect(subject.adapter).to be_a RubyI2C::Adapter::UnixDevice
  end


  it 'has an device address' do
    expect(subject.address).to be_nil
  end

  context 'reading and riting (no rithmatec)' do

    let(:adapter) { double :adapter, command: nil, read: nil, write: nil }
    let(:subject) { described_class.new adapter: adapter }

    [ :command, :read, :write ].each do |msg|
      it "sends #{msg} to the adapter" do
        subject.send msg
        expect(adapter).to have_received(msg)
      end
    end

  end

end
