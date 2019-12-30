# frozen_string_literal: true

class BridgeConnectException < RuntimeError
  def initialize(msg = "Press the button on the Hue bridge and try again.")
    super
  end
end

class UsernameException < RuntimeError
  def initialize(msg = "Please register username and try again.")
    super
  end
end

class BulbStateValueOutOfRangeException < RuntimeError
  def initalize(msg = "Value out of range.")
    super
  end
end

class BulbStateValueTypeException < RuntimeError
  def initialize(msg = "Value is of incorrect type.")
    super
  end
end

class ResourceUnavailableException < RuntimeError
  def initialize(msg = "ResourceUnavailable")
    super
  end
end

class ParameterUnavailableException < RuntimeError
  def intialize(msg = "Parameter unavailable")
    super
  end
end

class SceneLockedException < RuntimeError
  def initialize(msg = "Scene could not be removed, because it's locked.")
    super
  end
end
