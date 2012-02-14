module TimeBudget
  class Application < Sinatra::Base
    configure do
      TimeBudget::DB = Sequel.connect(ENV["DATABASE_URL"])
    end

    get("/") do
      haml :"budget/show", locals: {days: TimeBudget::Presenters::Day.this_week}
    end
  end
end
