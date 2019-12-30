describe Group do
  let(:data) { JSON.parse(file_fixture('spec/fixtures/groups.json').read)['1'] }
  let(:group) { Group.new 1, data }

  it "properly parses input parameters" do
    expect(group.id).to eql 1
    expect(group.name).to eql "Ceiling light"
    expect(group.type).to eql "LightGroup"
    expect(group.lights).to eql ["1", "2", "3", "4"]
  end

  it "properly reconstucts object hash" do
    expect(group.id).to eql 1
    expect(group.data).to eql data
  end
end
