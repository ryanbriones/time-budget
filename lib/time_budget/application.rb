module TimeBudget
  class Application < Sinatra::Base
    configure do
      TimeBudget::DB = Sequel.connect(ENV["DATABASE_URL"])
    end

    get("/") do
      days = []
      (0..7).each do |day_number|
        day_name = Date::DAYNAMES[day_number]
        activities = DB[:activities].filter(:day => day_number).all.map do |activity_data|
          OpenStruct.new(activity_data)
        end
        
        days << Presenters::DayPresenter.new(day_name, activities)
      end
      
      haml :"budget/show", locals: {days: days}
    end
  end
end
