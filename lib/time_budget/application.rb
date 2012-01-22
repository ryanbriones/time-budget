module TimeBudget
  class Application < Sinatra::Base
    get("/") do
      sunday = Presenters::DayPresenter.new("Sunday", [
        OpenStruct.new(name: "Sleep", hours_and_minutes: "8"),
        OpenStruct.new(name: "Lunch", hours_and_minutes: "1:30"),
        OpenStruct.new(name: "Dinner", hours_and_minutes: "1:30")
      ])

      monday = Presenters::DayPresenter.new("Monday", [
        OpenStruct.new(name: "Sleep", hours_and_minutes: "8"),
        OpenStruct.new(name: "Work", hours_and_minutes: "8"),
        OpenStruct.new(name: "Lunch", hours_and_minutes: "1"),
        OpenStruct.new(name: "Dinner", hours_and_minutes: "1:30")
      ])

      tuesday = Presenters::DayPresenter.new("Tuesday", [
        OpenStruct.new(name: "Sleep", hours_and_minutes: "8"),
        OpenStruct.new(name: "Work", hours_and_minutes: "8"),
        OpenStruct.new(name: "Lunch", hours_and_minutes: "1"),
        OpenStruct.new(name: "Dinner", hours_and_minutes: "1:30")
      ])

      wednesday = Presenters::DayPresenter.new("Wednesday", [
        OpenStruct.new(name: "Sleep", hours_and_minutes: "8"),
        OpenStruct.new(name: "Work", hours_and_minutes: "8"),
        OpenStruct.new(name: "Lunch", hours_and_minutes: "1"),
        OpenStruct.new(name: "Dinner", hours_and_minutes: "1:30")
      ])

      thursday = Presenters::DayPresenter.new("Thursday", [
        OpenStruct.new(name: "Sleep", hours_and_minutes: "8"),
        OpenStruct.new(name: "Work", hours_and_minutes: "8"),
        OpenStruct.new(name: "Lunch", hours_and_minutes: "1"),
        OpenStruct.new(name: "Dinner", hours_and_minutes: "1:30")
      ])

      friday = Presenters::DayPresenter.new("Friday", [
        OpenStruct.new(name: "Sleep", hours_and_minutes: "8"),
        OpenStruct.new(name: "Work", hours_and_minutes: "8"),
        OpenStruct.new(name: "Lunch", hours_and_minutes: "1"),
        OpenStruct.new(name: "Dinner", hours_and_minutes: "1:30")
      ])

      saturday = Presenters::DayPresenter.new("Saturday", [
        OpenStruct.new(name: "Sleep", hours_and_minutes: "8"),
        OpenStruct.new(name: "Fiddle 1", hours_and_minutes: "1:20"),
        OpenStruct.new(name: "Lunch", hours_and_minutes: "1:30"),
        OpenStruct.new(name: "Dinner", hours_and_minutes: "1:30")
      ])

      haml :"budget/show", locals: {
        sunday: sunday,
        monday: monday,
        tuesday: tuesday,
        wednesday: wednesday,
        thursday: thursday,
        friday: friday,
        saturday: saturday
      }
    end
  end
end