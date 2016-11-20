describe RubyI2C::Device::Base do


  it 'has an device adapter by default' do
    expect(subject.adapter).to be_a RubyI2C::Adapter::Device
  end


  it 'has an device address' do
    expect(subject.address).to be_nil
  end

end
