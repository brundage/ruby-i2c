describe RubyI2C do

  it 'aliases RubyI2C to I2C' do
    expect( Module.const_defined? :I2C ).to be_truthy
  end

end
