# frozen_string_literal: true

require 'lights/sensor'
require 'lights/list'

class SensorList < List
  def initialize(data = {})
    super
    data&.each { |id, value| @list << Sensor.new(id, value) }
  end
end
