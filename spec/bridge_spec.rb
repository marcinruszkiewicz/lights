describe Bridge do
  let(:data) do
    {
      "id" => "test id",
      "internalipaddress" => "192.168.1.27",
      "macaddress" => "01:23:45:67:89:AB",
      "name" => "test name"
    }
  end
  let(:bridge) { Bridge.new data }

  it "properly parse input parameters" do
    expect(bridge.id).to eql "test id"
    expect(bridge.ip).to eql "192.168.1.27"
    expect(bridge.mac).to eql "01:23:45:67:89:AB"
    expect(bridge.name).to eql "test name"
  end

  it "properly reconstructs object hash" do
    expect(bridge.data).to eql data
  end
end
