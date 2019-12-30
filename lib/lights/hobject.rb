# frozen_string_literal: true

class HObject
  def initialize(*args); end

  def to_json(_options = {})
    data.to_json
  end
end
