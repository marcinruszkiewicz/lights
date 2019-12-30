# frozen_string_literal: true

require 'lights/schedule'
require 'lights/list'

class ScheduleList < List
  def initialize(data = {})
    super
    data&.each { |id, value| @list << Schedule.new(id, value) }
  end
end
