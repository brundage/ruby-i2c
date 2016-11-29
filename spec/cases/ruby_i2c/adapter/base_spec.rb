describe RubyI2C::Adapter::Base do

  let(:force) { nil }
  let(:i2c_slave) { RubyI2C::Adapter::I2C_SLAVE }
  let(:i2c_slave_force) { RubyI2C::Adapter::I2C_SLAVE_FORCE }
  let(:slave_addr) { subject.instance_variable_get :@slave_addr }
  let(:subject) { described_class.new force: force }

  it 'defaults to not forcing the slave' do
    expect(slave_addr).to eq i2c_slave
  end


  context 'when told not to force slave' do
    let(:force) { false }
    it "doesn't forces the slave" do
      expect(slave_addr).to eq i2c_slave
    end
  end


  context 'when told to force slave' do
    let(:force) { true }
    it 'forces the slave' do
      expect(slave_addr).to eq i2c_slave_force
    end
  end


  [ :command, :read, :write ].each do |meth|
    it "leaves ##{meth} up to sub-classes" do
      expect{ subject.send(meth, nil, nil) }.to raise_error NotImplementedError
    end
  end

end
