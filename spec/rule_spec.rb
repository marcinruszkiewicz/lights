describe Rule do
  let(:data) do
    {
      "name" => "test name",
    }
  end
  let(:rule) { Rule.new 1, data }

  it "properly reconstucts object hash" do
    expect(rule.id).to eql 1
    expect(rule.name).to eql "test name"
    expect(rule.data).to eql data
  end
end
