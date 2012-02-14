module TimeBudget
  module Models
    class Activity
      attr_accessor :title, :day, :duration

      def initialize(activity_data = {})
        @title = activity_data[:title]
        @day = activity_data[:day]
        @duration = activity_data[:duration]
      end

      def self.for_day(day_number)
        table.filter(day: day_number).all.map_to(self)
      end

      def self.table
        DB[:activities]
      end
    end
  end
end