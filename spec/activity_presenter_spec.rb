require_relative "../lib/time_budget/presenters/activity_presenter"

describe TimeBudget::Presenters::ActivityPresenter do
  it "delegates the title to the supplied activity" do
    TimeBudget::Presenters::ActivityPresenter.new(stub(title: "foo")).title.should == "foo"
  end

  it "delegates the duration to the supplied activity" do
    TimeBudget::Presenters::ActivityPresenter.new(stub(duration: 99)).duration.should == 99
  end

  it "displaying hours and minutes of the duration" do
    TimeBudget::Presenters::ActivityPresenter.new(stub(duration: (60*60)+(60*30))).hours_and_minutes.should == "1:30"
  end
end
