describe BulbState do
  let(:blank_state) { BulbState.new }

  context 'on' do
    let(:data) do
      {
        "on" => true
      }
    end
    let(:state) { BulbState.new data }

    it "properly reconstructs object hash" do
      expect(state.data).to eql data
    end

    it "properly sets on value in constructor" do
      expect(state.on).to eql true
      expect(state.data["on"]).to eql true
    end

    it "properly sets on value" do
      blank_state.on = true
      expect(blank_state.on).to eq true
      expect(blank_state.data["on"]).to eq true
    end

    it "raises exception when on has invalid type" do
      expect { blank_state.on = "test state" }.to raise_error
    end
  end

  context 'off' do
    let(:data) do
      {
        "on" => false
      }
    end
    let(:state) { BulbState.new data }

    it "properly reconstructs object hash" do
      expect(state.data).to eql data
    end
  end

  context 'brightness' do
    let(:data_max) do
      {
        "bri" => BulbState::MAX_BRI
      }
    end
    let(:state_max) { BulbState.new data_max }
    let(:data_min) do
      {
        "bri" => BulbState::MIN_BRI
      }
    end
    let(:state_min) { BulbState.new data_min }
    let(:fail_nonint) do
      {
        "bri" => "test value"
      }
    end
    let(:fail_max) do
      {
        "bri" => BulbState::MAX_BRI + 1
      }
    end
    let(:fail_min) do
      {
        "bri" => BulbState::MIN_BRI - 1
      }
    end

    it "properly set brightness value in constructor" do
      expect(state_max.bri).to eq BulbState::MAX_BRI
      expect(state_max.data["bri"]).to eq BulbState::MAX_BRI
    end

    it "properly set brightness value in constructor" do
      expect(state_min.bri).to eq BulbState::MIN_BRI
      expect(state_min.data["bri"]).to eq BulbState::MIN_BRI
    end

    it "properly set brightness value" do
      blank_state.bri = BulbState::MAX_BRI
      expect(blank_state.bri).to eq BulbState::MAX_BRI
      expect(blank_state.data["bri"]).to eq BulbState::MAX_BRI
    end

    it "properly set brightness value" do
      blank_state.bri = BulbState::MIN_BRI
      expect(blank_state.bri).to eq BulbState::MIN_BRI
      expect(blank_state.data["bri"]).to eq BulbState::MIN_BRI
    end

    it "raise exception when brightness value is not an integer" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueTypeException
    end

    it "raise exception when initial brightness is out of range (high)" do
      expect { BulbState.new(fail_max) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when initial brightness is out of range (low)" do
      expect { BulbState.new(fail_min) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set brightness is out of range (high)" do
      expect { blank_state.bri = BulbState::MAX_BRI + 1 }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set brightness is out of range (LOW)" do
      expect { blank_state.bri = BulbState::MIN_BRI - 1 }.to raise_error BulbStateValueOutOfRangeException
    end
  end

  context 'saturation' do
    let(:data_max) do
      {
        "sat" => BulbState::MAX_SAT
      }
    end
    let(:state_max) { BulbState.new data_max }
    let(:data_min) do
      {
        "sat" => BulbState::MIN_SAT
      }
    end
    let(:state_min) { BulbState.new data_min }
    let(:fail_nonint) do
      {
        "sat" => "test value"
      }
    end
    let(:fail_max) do
      {
        "sat" => BulbState::MAX_SAT + 1
      }
    end
    let(:fail_min) do
      {
        "sat" => BulbState::MIN_SAT - 1
      }
    end

    it "properly set saturation value in constructor" do
      expect(state_max.sat).to eq BulbState::MAX_SAT
      expect(state_max.data["sat"]).to eq BulbState::MAX_SAT
    end

    it "properly set saturation value in constructor" do
      expect(state_min.sat).to eq BulbState::MIN_SAT
      expect(state_min.data["sat"]).to eq BulbState::MIN_SAT
    end

    it "properly set saturation value" do
      blank_state.sat = BulbState::MAX_SAT
      expect(blank_state.sat).to eq BulbState::MAX_SAT
      expect(blank_state.data["sat"]).to eq BulbState::MAX_SAT
    end

    it "properly set saturation value" do
      blank_state.sat = BulbState::MIN_SAT
      expect(blank_state.sat).to eq BulbState::MIN_SAT
      expect(blank_state.data["sat"]).to eq BulbState::MIN_SAT
    end

    it "raise exception when sat value is not an integer" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueTypeException
    end

    it "raise exception when initial saturation is out of range (high)" do
      expect { BulbState.new(fail_max) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when initial saturation is out of range (low)" do
      expect { BulbState.new(fail_min) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set saturation is out of range (high)" do
      expect { blank_state.sat = BulbState::MAX_SAT + 1 }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set saturation is out of range (LOW)" do
      expect { blank_state.sat = BulbState::MIN_SAT - 1 }.to raise_error BulbStateValueOutOfRangeException
    end
  end

  context 'hue' do
    let(:data_max) do
      {
        "hue" => BulbState::MAX_HUE
      }
    end
    let(:state_max) { BulbState.new data_max }
    let(:data_min) do
      {
        "hue" => BulbState::MIN_HUE
      }
    end
    let(:state_min) { BulbState.new data_min }
    let(:fail_nonint) do
      {
        "hue" => "test value"
      }
    end
    let(:fail_max) do
      {
        "hue" => BulbState::MAX_HUE + 1
      }
    end
    let(:fail_min) do
      {
        "hue" => BulbState::MIN_HUE - 1
      }
    end

    it "properly set hue value in constructor" do
      expect(state_max.hue).to eq BulbState::MAX_HUE
      expect(state_max.data["hue"]).to eq BulbState::MAX_HUE
    end

    it "properly set hue value in constructor" do
      expect(state_min.hue).to eq BulbState::MIN_HUE
      expect(state_min.data["hue"]).to eq BulbState::MIN_HUE
    end

    it "properly set hue value" do
      blank_state.hue = BulbState::MAX_HUE
      expect(blank_state.hue).to eq BulbState::MAX_HUE
      expect(blank_state.data["hue"]).to eq BulbState::MAX_HUE
    end

    it "properly set hue value" do
      blank_state.hue = BulbState::MIN_HUE
      expect(blank_state.hue).to eq BulbState::MIN_HUE
      expect(blank_state.data["hue"]).to eq BulbState::MIN_HUE
    end

    it "raise exception when hue value is not an integer" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueTypeException
    end

    it "raise exception when initial hue is out of range (high)" do
      expect { BulbState.new(fail_max) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when initial hue is out of range (low)" do
      expect { BulbState.new(fail_min) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set hue is out of range (high)" do
      expect { blank_state.hue = BulbState::MAX_HUE + 1 }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set hue is out of range (LOW)" do
      expect { blank_state.hue = BulbState::MIN_HUE - 1 }.to raise_error BulbStateValueOutOfRangeException
    end
  end

  context 'color temperature' do
    let(:data_max) do
      {
        "ct" => BulbState::MAX_CT
      }
    end
    let(:state_max) { BulbState.new data_max }
    let(:data_min) do
      {
        "ct" => BulbState::MIN_CT
      }
    end
    let(:state_min) { BulbState.new data_min }
    let(:fail_nonint) do
      {
        "ct" => "test value"
      }
    end
    let(:fail_max) do
      {
        "ct" => BulbState::MAX_CT + 1
      }
    end
    let(:fail_min) do
      {
        "ct" => BulbState::MIN_CT - 1
      }
    end
    let(:unreachable_data) do
      {
        "reachable" => false,
        "ct" => 0
      }
    end
    let(:state_unreachable) { BulbState.new unreachable_data }

    it "properly set color temperature value in constructor" do
      expect(state_max.ct).to eq BulbState::MAX_CT
      expect(state_max.data["ct"]).to eq BulbState::MAX_CT
    end

    it "properly set color temperature value in constructor" do
      expect(state_min.ct).to eq BulbState::MIN_CT
      expect(state_min.data["ct"]).to eq BulbState::MIN_CT
    end

    it "properly set color temperature value" do
      blank_state.ct = BulbState::MAX_CT
      expect(blank_state.ct).to eq BulbState::MAX_CT
      expect(blank_state.data["ct"]).to eq BulbState::MAX_CT
    end

    it "properly set color temperature value" do
      blank_state.ct = BulbState::MIN_CT
      expect(blank_state.ct).to eq BulbState::MIN_CT
      expect(blank_state.data["ct"]).to eq BulbState::MIN_CT
    end

    it "raise exception when color temperature value is not an integer" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueTypeException
    end

    it "raise exception when initial color temperature is out of range (high)" do
      expect { BulbState.new(fail_max) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when initial color temperature is out of range (low)" do
      expect { BulbState.new(fail_min) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set color temperature is out of range (high)" do
      expect { blank_state.ct = BulbState::MAX_CT + 1 }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set color temperature is out of range (LOW)" do
      expect { blank_state.ct = BulbState::MIN_CT - 1 }.to raise_error BulbStateValueOutOfRangeException
    end

    it "ignore out of range color temperature when 'reachable'= false" do
      expect(state_unreachable.data["ct"]).to eq nil
      expect(state_unreachable.data["reachable"]).to eq false
    end
  end

  context 'effect' do
    let(:data) do
      {
        "effect" => BulbState::Effect::COLORLOOP
      }
    end
    let(:state_colorloop) { BulbState.new data }
    let(:fail_nonint) do
      {
        "effect" => "test value"
      }
    end

    it "properly set effect value in constructor" do
      expect(state_colorloop.effect).to eq BulbState::Effect::COLORLOOP
      expect(state_colorloop.data["effect"]).to eq BulbState::Effect::COLORLOOP
    end

    it "properly set effect value" do
      blank_state.effect = BulbState::Effect::COLORLOOP
      expect(blank_state.effect).to eq BulbState::Effect::COLORLOOP
      expect(blank_state.data["effect"]).to eq BulbState::Effect::COLORLOOP
    end

    it "properly reset effect value" do
      blank_state.effect = BulbState::Effect::NONE
      expect(blank_state.effect).to eq BulbState::Effect::NONE
      expect(blank_state.data["effect"]).to eq BulbState::Effect::NONE
    end

    it "raise exception when effect value is invalid" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueTypeException
    end
  end

  context 'transition time' do
    let(:data) do
      {
        "transitiontime" => 0.1
      }
    end
    let(:state_transition) { BulbState.new data }
    let(:fail_nonint) do
      {
        "transitiontime" => "test value"
      }
    end
    let(:fail_min) do
      {
        "transitiontime" => -1
      }
    end

    it "properly set transition time value in constructor" do
      expect(state_transition.transition_time).to eq 0.1
      expect(state_transition.data["transitiontime"]).to eq 0.1
    end

    it "properly set transition time value" do
      blank_state.transition_time = BulbState::MIN_TRANSITION_TIME
      expect(blank_state.transition_time).to eq BulbState::MIN_TRANSITION_TIME
      expect(blank_state.data["transitiontime"]).to eq BulbState::MIN_TRANSITION_TIME
    end

    it "raise exception when transition time value is invalid" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueTypeException
    end

    it "raise exception when transition time is out of range (LOW)" do
      expect { BulbState.new(fail_min) }.to raise_error BulbStateValueOutOfRangeException
    end
  end

  context 'alert' do
    let(:data) do
      {
        "alert" => BulbState::Alert::SELECT
      }
    end
    let(:state_alert) { BulbState.new data }
    let(:fail_nonint) do
      {
        "alert" => "test value"
      }
    end

    it "properly set alert value in constructor" do
      expect(state_alert.alert).to eq BulbState::Alert::SELECT
      expect(state_alert.data["alert"]).to eq BulbState::Alert::SELECT
    end

    it "properly sets alert value" do
      blank_state.alert = BulbState::Alert::LSELECT
      expect(blank_state.alert).to eq BulbState::Alert::LSELECT
      expect(blank_state.data["alert"]).to eq BulbState::Alert::LSELECT
    end

    it "properly resets alert value" do
      blank_state.alert = BulbState::Alert::NONE
      expect(blank_state.alert).to eq BulbState::Alert::NONE
      expect(blank_state.data["alert"]).to eq BulbState::Alert::NONE
    end

    it "raise exception when alert value is invalid" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueTypeException
    end
  end

  context 'color mode' do
    let(:data) do
      {
        "colormode" => BulbState::ColorMode::HS
      }
    end
    let(:state_colormode) { BulbState.new data }
    let(:fail_nonint) do
      {
        "colormode" => "test value"
      }
    end

    it "properly set color mode value in constructor" do
      expect(state_colormode.color_mode).to eq BulbState::ColorMode::HS
      expect(state_colormode.data["colormode"]).to eq BulbState::ColorMode::HS
    end

    it "properly set color mode value" do
      blank_state.color_mode = BulbState::ColorMode::XY
      expect(blank_state.color_mode).to eq BulbState::ColorMode::XY
      expect(blank_state.data["colormode"]).to eq BulbState::ColorMode::XY
    end

    it "properly set color mode value" do
      blank_state.color_mode = BulbState::ColorMode::CT
      expect(blank_state.color_mode).to eq BulbState::ColorMode::CT
      expect(blank_state.data["colormode"]).to eq BulbState::ColorMode::CT
    end

    it "raise exception when alert value is invalid" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueTypeException
    end
  end

  context 'xy' do
    let(:xy_max) { [BulbState::MAX_XY, BulbState::MAX_XY] }
    let(:xy_min) { [BulbState::MIN_XY, BulbState::MIN_XY] }
    let(:data_max) do
      {
        "xy" => xy_max
      }
    end
    let(:data_min) do
      {
        "xy" => xy_min
      }
    end
    let(:state_max) { BulbState.new data_max }
    let(:state_min) { BulbState.new data_min }
    let(:fail_nonarr) do
      {
        "xy" => {}
      }
    end

    it "properly set xy value in constructor" do
      expect(state_max.xy).to eq xy_max
      expect(state_max.data["xy"]).to eq xy_max
    end

    it "properly set xy value in constructor" do
      expect(state_min.xy).to eq xy_min
      expect(state_min.data["xy"]).to eq xy_min
    end

    it "properly set xy value" do
      blank_state.xy = xy_max
      expect(blank_state.xy).to eq xy_max
      expect(blank_state.data["xy"]).to eq xy_max
    end

    it "properly set xy value" do
      blank_state.xy = xy_min
      expect(blank_state.xy).to eq xy_min
      expect(blank_state.data["xy"]).to eq xy_min
    end

    it "raise exception when xy value is not an array" do
      expect { BulbState.new(fail_nonarr) }.to raise_error BulbStateValueTypeException
    end
  end

  context 'xy - x' do
    let(:fail_nonint) do
      {
        "xy" => ["test value", BulbState::MIN_XY]
      }
    end
    let(:fail_max) do
      {
        "xy" => [BulbState::MAX_XY + 1, BulbState::MIN_XY]
      }
    end
    let(:fail_min) do
      {
        "xy" => [BulbState::MIN_XY - 1, BulbState::MIN_XY]
      }
    end

    it "raise exception when x value is not a number" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when initial xy is out of range (X,HIGH)" do
      expect { BulbState.new(fail_max) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when initial xy is out of range (X,LOW)" do
      expect { BulbState.new(fail_min) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set xy is out of range (X,HIGH)" do
      expect { blank_state.xy = [BulbState::MAX_XY + 1, BulbState::MIN_XY] }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set xy is out of range (X,LOW)" do
      expect { blank_state.xy = [BulbState::MIN_XY - 1, BulbState::MIN_XY] }.to raise_error BulbStateValueOutOfRangeException
    end
  end

  context 'xy - y' do
    let(:fail_nonint) do
      {
        "xy" => [BulbState::MIN_XY, "test value"]
      }
    end
    let(:fail_max) do
      {
        "xy" => [BulbState::MAX_XY, BulbState::MAX_XY + 1]
      }
    end
    let(:fail_min) do
      {
        "xy" => [BulbState::MIN_XY, BulbState::MIN_XY - 1]
      }
    end

    it "raise exception when y value is not a number" do
      expect { BulbState.new(fail_nonint) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when initial xy is out of range (Y,HIGH)" do
      expect { BulbState.new(fail_max) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when initial xy is out of range (Y,LOW)" do
      expect { BulbState.new(fail_min) }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set xy is out of range (Y,HIGH)" do
      expect { blank_state.xy = [BulbState::MAX_XY, BulbState::MAX_XY + 1] }.to raise_error BulbStateValueOutOfRangeException
    end

    it "raise exception when set xy is out of range (Y,LOW)" do
      expect { blank_state.xy = [BulbState::MIN_XY, BulbState::MIN_XY - 1] }.to raise_error BulbStateValueOutOfRangeException
    end
  end
end
