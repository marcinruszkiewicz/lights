# frozen_string_literal: true

require 'lights/user'
require 'lights/list'

class UserList < List
  def initialize(data = {})
    super
    data&.each { |id, value| @list << User.new(id, value) }
  end
end
