describe GroupState do
  let(:data) do
    {
      "scene" => "22978db88-on-0"
    }
  end
  let(:groupstate) { GroupState.new data }
  let(:without_data) { GroupState.new }

  it "properly reconstructs object hash" do
    expect(groupstate.data).to eql data
  end

  context 'scene' do
    it "properly sets scene value in constructor" do
      expect(groupstate.scene).to eql "22978db88-on-0"
      expect(groupstate.data["scene"]).to eql "22978db88-on-0"
    end

    it "properly sets scene value" do
      without_data.scene = "22978db88-on-0"
      expect(without_data.scene).to eq "22978db88-on-0"
      expect(without_data.data["scene"]).to eq "22978db88-on-0"
    end

    it "raises exception when scene has invalid type" do
      expect { without_data.scene = 124 }.to raise_error BulbStateValueTypeException
    end
  end
end

