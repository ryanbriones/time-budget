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
end
