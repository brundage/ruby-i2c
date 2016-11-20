describe RubyI2C::Adapter::Device do

  let(:address) { nil }

  it 'has a device by default' do
    expect(subject.device_file).not_to be_nil
  end


  it 'has a mutex by default' do
    expect(subject.mutex).not_to be_nil
  end

  context 'handle operations' do

    let(:command) { 0 }
    let(:handle) { double :handle }
    let(:read_return) { :blark }
    let(:write_return) { :llama }

    before do
      allow(File).to receive(:open).and_return(handle)
      allow(handle).to receive(:sysread).and_return(read_return)
      allow(handle).to receive(:syswrite).and_return(write_return)
    end

    it 'reads' do
      expect( subject.read(address) ).to eq read_return
    end


    it 'commands' do
      expect( subject.command(address, command) ).to eq read_return
    end


    it 'writes' do
      expect( subject.write(address, command) ).to eq write_return
    end

  end

end
