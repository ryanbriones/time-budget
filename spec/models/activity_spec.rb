require "time_budget/models/activity"

module TimeBudget
  module Models
    describe Activity do
      context "when looking up activities by day" do
        it "filters the table by day" do
          table = stub
          Activity.stub(:table) { table }
          table.should_receive(:filter).with(day: 1) { stub(all: []) }
          Activity.for_day(1)
        end

        it "converts the results into Activity objects" do
          table = stub
          Activity.stub(:table) { table }
          activity_data = stub
          table.stub(:filter) { stub(all: [activity_data]) }
          activity_model = stub
          Activity.stub(:new).with(activity_data) { activity_model}
          Activity.for_day(1).should == [activity_model]
        end
      end
    end
  end
end