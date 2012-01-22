require_relative "../lib/time_budget/presenters/day_presenter"

describe TimeBudget::Presenters::DayPresenter do
  it "displays the name of the day" do
    day = TimeBudget::Presenters::DayPresenter.new("Sunday")
    day.name.should == "Sunday"
  end

  it "exposes a list of activities specified for this day" do
    activity = stub("activity")
    day = TimeBudget::Presenters::DayPresenter.new("Sunday", [activity])
    day.activities.should == [activity]
  end

  it "activities is an empty list if not specified" do
    day = TimeBudget::Presenters::DayPresenter.new("Sunday")
    day.activities.should == []
  end
end