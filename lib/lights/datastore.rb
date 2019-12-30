# frozen_string_literal: true

require 'lights/config'
require 'lights/bulblist'
require 'lights/grouplist'
require 'lights/scenelist'
require 'lights/rulelist'
require 'lights/schedulelist'
require 'lights/sensorlist'
require 'lights/hobject'

class Datastore < HObject
  attr_reader :lights, :groups, :config, :rules,
              :scenes, :schedules, :sensors
  def initialize(data = {})
    @lights = BulbList.new(data["lights"])
    @groups = GroupList.new(data["groups"])
    @config = HueConfig.new(data["config"])
    @schedules = ScheduleList.new(data["schedules"])
    @scenes = SceneList.new(data["scenes"])
    @rules = RuleList.new(data["rules"])
    @sensors = SensorList.new(data["sensors"])
  end

  def list
    @lights.list + \
      @groups.list + \
      [@config] + \
      @schedules.list + \
      @scenes.list + \
      @rules.list + \
      @sensors.list
  end

  def data
    data = {}
    data["lights"] = @lights.data unless @lights.data.empty?
    data["groups"] = @groups.data unless @groups.data.empty?
    data["config"] = @config.data unless @config.data.empty?
    data["schedules"] = @schedules.data unless @schedules.data.empty?
    data["scenes"] = @scenes.data unless @scenes.data.empty?
    data["rules"] = @rules.data unless @rules.data.empty?
    data["sensors"] = @sensors.data unless @sensors.data.empty?
    data
  end
end
