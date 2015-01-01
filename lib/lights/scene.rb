require 'lights/hobject'

class Scene < HObject
  attr_reader :id, :name, :active, :lights
  def initialize(id,data = {})
    super(data)
    @id = id
    @name = data["name"]
    @active = data["active"]
    @lights = data["lights"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["active"] = @active if @active 
    data["lights"] = @lights if @lights
    data
  end
end

