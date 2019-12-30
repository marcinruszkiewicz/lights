describe Bulb do
  let(:data) do
    {
      "name" => "test name"
    }
  end
  let(:bulb) { Bulb.new 1, data }
  let(:state_data) do
    {
      "name" => "test name",
      "state" => {
        "on" => true
      }
    }
  end
  let(:state_bulb) { Bulb.new 1, state_data }

  it "properly parse input parameters" do
    expect(bulb.name).to eql "test name"
  end

  it "properly set name parameter" do
    bulb.name = "new test name"
    expect(bulb.name).to eql "new test name"
  end

  it "properly creates state object" do
    expect(state_bulb.state.on).to eql true
    expect(state_bulb.state.data).to eql state_data["state"]
  end

  it "properly reconstucts object hash" do
    expect(state_bulb.data).to eql state_data
  end
end
