require "time_budget/presenters/day"
require "time_budget/presenters/activity"
require "time_budget/models/activity"


describe TimeBudget::Presenters::Day do
  it "displays the name of the day" do
    day = TimeBudget::Presenters::Day.new(0)
    day.name.should == "Sun"
  end

  it "exposes a list of activities specified for this day" do
    activity = stub("activity")
    day = TimeBudget::Presenters::Day.new(0, [activity])
    day.activities.should_not be_empty
  end

  it "activities is an empty list if not specified" do
    day = TimeBudget::Presenters::Day.new(0)
    day.activities.should == []
  end

  it "has time available if the sum of the activities duration is less than the duration of a day" do
    activity = stub("activity", duration: 1)
    day = TimeBudget::Presenters::Day.new("Sunday", [activity])
    day.should have_time_available
  end

  context "when displaying the hours available" do
    it "displays the hours that are available" do
      activity = stub("activity", duration: 1)
      day = TimeBudget::Presenters::Day.new("Sunday", [activity])
      day.hours_available.should == "23"
    end

    it "pads the hours with one zero if the value is a single digit" do
      activity = stub("activity", duration: 60*60*15)
      day = TimeBudget::Presenters::Day.new("Sunday", [activity])
      day.hours_available.should == "09"
    end

    it "displays the minutes that are available" do
      activity = stub("activity", duration: 1)
      day = TimeBudget::Presenters::Day.new("Sunday", [activity])
      day.minutes_available.should == "59"
    end

    it "pads the minutes with one zero if the value is a single digit" do
      activity = stub("activity", duration: 60*53)
      day = TimeBudget::Presenters::Day.new("Sunday", [activity])
      day.minutes_available.should == "07"
    end
  end

  context "when collecting days for this week" do
    it "builds 7 Day presenters for the day number" do
      TimeBudget::Presenters::Day.should_receive(:for_day_number).exactly(7).times
      TimeBudget::Presenters::Day.this_week
    end
  end

  context "when creating a Day from a day number" do
    let(:activities) { stub }

    before do
      TimeBudget::Presenters::Activity.stub(:for_day) { activities }
    end

    it "returns a day with the day name" do
      TimeBudget::Presenters::Day.for_day_number(0).name.should == "Sun"
    end

    it "looks up the activities for the day" do
      TimeBudget::Presenters::Day.for_day_number(0).activities.should == activities
    end
  end
end
