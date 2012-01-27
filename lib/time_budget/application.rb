module TimeBudget
  class Application < Sinatra::Base
    get("/") do
      sunday = Presenters::DayPresenter.new("Sunday", [
        OpenStruct.new(name: "Sleep", duration: 28800),
        OpenStruct.new(name: "Lunch", duration: 5400),
        OpenStruct.new(name: "Dinner", duration: 5400)
      ])

      monday = Presenters::DayPresenter.new("Monday", [
        OpenStruct.new(name: "Sleep", duration: 28800),
        OpenStruct.new(name: "Work", duration: 28800),
        OpenStruct.new(name: "Lunch", duration: 3600),
        OpenStruct.new(name: "Dinner", duration: 5400)
      ])

      tuesday = Presenters::DayPresenter.new("Tuesday", [
        OpenStruct.new(name: "Sleep", duration: 28800),
        OpenStruct.new(name: "Work", duration: 28800),
        OpenStruct.new(name: "Lunch", duration: 3600),
        OpenStruct.new(name: "Dinner", duration: 5400)
      ])

      wednesday = Presenters::DayPresenter.new("Wednesday", [
        OpenStruct.new(name: "Sleep", duration: 28800),
        OpenStruct.new(name: "Work", duration: 28800),
        OpenStruct.new(name: "Lunch", duration: 3600),
        OpenStruct.new(name: "Dinner", duration: 5400)
      ])

      thursday = Presenters::DayPresenter.new("Thursday", [
        OpenStruct.new(name: "Sleep", duration: 28800),
        OpenStruct.new(name: "Work", duration: 28800),
        OpenStruct.new(name: "Lunch", duration: 3600),
        OpenStruct.new(name: "Dinner", duration: 5400)
      ])

      friday = Presenters::DayPresenter.new("Friday", [
        OpenStruct.new(name: "Sleep", duration: 28800),
        OpenStruct.new(name: "Work", duration: 28800),
        OpenStruct.new(name: "Lunch", duration: 3600),
        OpenStruct.new(name: "Dinner", duration: 5400)
      ])

      saturday = Presenters::DayPresenter.new("Saturday", [
        OpenStruct.new(name: "Sleep", duration: 28800),
        OpenStruct.new(name: "Fiddle 1", duration: 4800),
        OpenStruct.new(name: "Lunch", duration: 5400),
        OpenStruct.new(name: "Dinner", duration: 5400)
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
