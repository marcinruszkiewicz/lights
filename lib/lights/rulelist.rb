# frozen_string_literal: true

require 'lights/rule'
require 'lights/list'

class RuleList < List
  def initialize(data = {})
    super
    data&.each { |id, value| @list << Rule.new(id, value) }
  end
end
