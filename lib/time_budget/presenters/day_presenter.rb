module TimeBudget
  module Presenters
    class DayPresenter
      DAY_DURATION = 60*60*24

      attr_reader :name, :activities

      def initialize(name, activities = [])
        @name = name
        @activities = activities.map { |a| ActivityPresenter.new(a) }
      end

      def has_time_available?
        (DAY_DURATION - activities_duration) > 0
      end

      def activities_duration
        @activities.inject(0) { |total, activity| total += activity.duration }
      end

      def hours_and_minutes_available
        available_duration = DAY_DURATION - activities_duration

        an_hour = 60*60
        number_of_hours = (available_duration/an_hour.to_f).floor
        number_of_minutes = ((available_duration-(an_hour*number_of_hours))/60).floor

        output = ""
        if number_of_hours > 0
          output << "#{number_of_hours}"
        end

        if number_of_minutes > 0
          output << ":#{number_of_minutes}"
        end

        output
      end
    end
  end
end
