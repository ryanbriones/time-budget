module TimeBudget
  module Presenters
    class DayPresenter
      attr_reader :name, :activities

      def initialize(name, activities = [])
        @name = name
        @activities = activities.map { |a| ActivityPresenter.new(a) }
      end
    end
  end
end
