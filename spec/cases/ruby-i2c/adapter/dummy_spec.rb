describe RubyI2C::Adapter::Dummy do

  let(:command_return) { :command }
  let(:force) { nil }
  let(:subject) { described_class.new force: force, returns: returns }
  let(:read_return) { :read }
  let(:returns) { { command: command_return,
                    read: read_return,
                    write: write_return
                } }
  let(:write_return) { :write }


  it '"stubs" command' do
    expect(subject.command).to eq command_return
  end


  it '"stubs" read' do
    expect(subject.read).to eq read_return
  end


  it '"stubs" write' do
    expect(subject.write).to eq write_return
  end

end
