# frozen_string_literal: true

describe Scene do
  let(:data) do
    {
      "name" => "test name",
      "lights" => %w[1 2 3],
      "active" => true
    }
  end
  let(:scene) { Scene.new 1, data }

  it "properly parse input parameters" do
    expect(scene.name).to eql "test name"
    expect(scene.id).to eql 1
    expect(scene.lights).to eql %w[1 2 3]
    expect(scene.active).to eql true
  end

  it "properly reconstucts object hash" do
    expect(scene.data).to eql data
    expect(scene.id).to eql 1
  end
end
