require "time_budget/decorators/hours_and_minutes"

describe TimeBudget::Decorators::HoursAndMinutes do
  describe "displaying hours and minutes format" do
    it "displays the number of hours and the number of whole minutes in the activity's duration delimited by :" do
      TimeBudget::Decorators::HoursAndMinutes.new((60*60)+(60*30)).hours_and_minutes.should == "1:30"
    end

    it "displays only the hour with no colon or zeros when duration is exactly on the hour" do
      TimeBudget::Decorators::HoursAndMinutes.new(60*60*8).hours_and_minutes.should == "8"
    end

    it "displays minutes prefixed by a colon when duration is only minutes" do
      TimeBudget::Decorators::HoursAndMinutes.new(60*30).hours_and_minutes.should == ":30"
    end
  end

  it "displays the hours converted from the supplied duration" do
    hours = 8
    TimeBudget::Decorators::HoursAndMinutes.new(60*60*hours).hours.should == hours
  end

  it "displays the minutes converted from the supplied duration" do
    minutes = 30
    TimeBudget::Decorators::HoursAndMinutes.new(60*minutes).minutes.should == minutes
  end
end
