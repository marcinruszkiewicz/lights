# frozen_string_literal: true

describe Datastore do
  let(:data) { JSON.parse(file_fixture('spec/fixtures/datastore.json').read) }
  let(:ds) { Datastore.new data }

  it "properly reconstructs sub objects" do
    expect(ds.data).to eql data
  end

  it "properly reconstructs light objects" do
    expect(ds.lights.data).to eql data["lights"]
  end

  it "properly reconstructs group objects" do
    expect(ds.groups.data).to eql data["groups"]
  end

  it "properly reconstructs rule objects" do
    expect(ds.rules.data).to eql data["rules"]
  end

  it "properly reconstructs scene objects" do
    expect(ds.scenes.data).to eql data["scenes"]
  end

  it "properly reconstructs schedule objects" do
    expect(ds.schedules.data).to eql data["schedules"]
  end

  it "properly reconstructs sensor objects" do
    expect(ds.sensors.data).to eql data["sensors"]
  end

  it "properly reconstructs config object" do
    expect(ds.config.data).to eql data["config"]
  end
end
