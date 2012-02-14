require_relative "../lib/time_budget/presenters/activity"

describe TimeBudget::Presenters::Activity do
  it "delegates the title to the supplied activity" do
    TimeBudget::Presenters::Activity.new(stub(title: "foo")).title.should == "foo"
  end

  it "delegates the duration to the supplied activity" do
    TimeBudget::Presenters::Activity.new(stub(duration: 99)).duration.should == 99
  end

  it "displaying hours and minutes of the duration" do
    TimeBudget::Presenters::Activity.new(stub(duration: (60*60)+(60*30))).hours_and_minutes.should == "1:30"
  end

  context "when displaying the duration" do
    it "displays the hours of the duration" do
      TimeBudget::Presenters::Activity.new(stub("activity", duration: (60*60*12)+(60*30))).hours.should == "12"
    end

    it "pads the hours with one zero if the value is a single digit" do
      TimeBudget::Presenters::Activity.new(stub("activity", duration: (60*60)+(60*30))).hours.should == "01"
    end

    it "displays the minutes of the duration" do
      TimeBudget::Presenters::Activity.new(stub("activity", duration: (60*60*12)+(60*30))).minutes.should == "30"
    end

    it "pads the minutes with one zero if the value is a single digit" do
      TimeBudget::Presenters::Activity.new(stub("activity", duration: (60*60*12)+(60*2))).minutes.should == "02"
    end
  end

  context "collecting activities for a day" do
    let(:activities) { [stub(duration: 60*60), stub(duration: 60*60*2)] }

    before(:each) do
      TimeBudget::Models::Activity.stub(:for_day).and_return(activities)
    end

    it "converts the activity models into presenters" do
      activities = TimeBudget::Presenters::Activity.for_day(5)
      activities.first.hours.should == "01"
      activities.last.hours.should == "02"
    end
  end
end
