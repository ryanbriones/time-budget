require_relative "../lib/time_budget/presenters/day_presenter"
require_relative "../lib/time_budget/presenters/activity_presenter"

describe TimeBudget::Presenters::DayPresenter do
  it "displays the name of the day" do
    day = TimeBudget::Presenters::DayPresenter.new("Sunday")
    day.name.should == "Sunday"
  end

  it "exposes a list of activities specified for this day" do
    activity = stub("activity")
    day = TimeBudget::Presenters::DayPresenter.new("Sunday", [activity])
    day.activities.should_not be_empty
  end

  it "activities is an empty list if not specified" do
    day = TimeBudget::Presenters::DayPresenter.new("Sunday")
    day.activities.should == []
  end

  it "activities are wrapped in ActivityPresenters" do
    activity = stub("activity")
    day = TimeBudget::Presenters::DayPresenter.new("Sunday", [activity])
    day.activities.first.should be_instance_of(TimeBudget::Presenters::ActivityPresenter)
  end

  it "has time available if the sum of the activities duration is less than the duration of a day" do
    activity = stub("activity", duration: 1)
    day = TimeBudget::Presenters::DayPresenter.new("Sunday", [activity])
    day.should have_time_available
  end

  context "when displaying the hours available" do
    it "displays the hours that are available" do
      activity = stub("activity", duration: 1)
      day = TimeBudget::Presenters::DayPresenter.new("Sunday", [activity])
      day.hours_available.should == "23"
    end

    it "pads the hours with one zero if the value is a single digit" do
      activity = stub("activity", duration: 60*60*15)
      day = TimeBudget::Presenters::DayPresenter.new("Sunday", [activity])
      day.hours_available.should == "09"
    end

    it "displays the minutes that are available" do
      activity = stub("activity", duration: 1)
      day = TimeBudget::Presenters::DayPresenter.new("Sunday", [activity])
      day.minutes_available.should == "59"
    end

    it "pads the minutes with one zero if the value is a single digit" do
      activity = stub("activity", duration: 60*53)
      day = TimeBudget::Presenters::DayPresenter.new("Sunday", [activity])
      day.minutes_available.should == "07"
    end
  end
end
