module TimeBudget
  class Application < Sinatra::Base
    configure do
      TimeBudget::DB = Sequel.connect(ENV["DATABASE_URL"])
    end

    get("/") do
      days = (0..7).map_into(Date::ABBR_DAYNAMES).zip((0..7)).map do |day_name, day_number|
        activities = DB[:activities].filter(day: day_number).all.map_to(OpenStruct)
        Presenters::Day.new(day_name, activities)
      end
      
      haml :"budget/show", locals: {days: days}
    end
  end
end
