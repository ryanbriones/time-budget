require_relative "../lib/time_budget/presenters/activity_presenter"

describe TimeBudget::Presenters::ActivityPresenter do
  it "delegates the title to the supplied activity" do
    TimeBudget::Presenters::ActivityPresenter.new(stub(title: "foo")).title.should == "foo"
  end

  it "delegates the duration to the supplied activity" do
    TimeBudget::Presenters::ActivityPresenter.new(stub(duration: 99)).duration.should == 99
  end

  describe "displaying hours and minutes format" do
    it "displays the number of hours and the number of whole minutes in the activity's duration delimited by :" do
      TimeBudget::Presenters::ActivityPresenter.new(stub(duration: (60*60)+(60*30))).hours_and_minutes.should == "1:30"
    end
    
    it "displays only the hour with no colon or zeros when duration is exactly on the hour" do
      TimeBudget::Presenters::ActivityPresenter.new(stub(duration: 60*60*8)).hours_and_minutes.should == "8"
    end

    it "displays minutes prefixed by a colon when duration is only minutes" do
      TimeBudget::Presenters::ActivityPresenter.new(stub(duration: 60*30)).hours_and_minutes.should == ":30"
    end
  end
end
