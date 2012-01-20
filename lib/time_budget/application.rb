module TimeBudget
  class Application < Sinatra::Base
    get("/") do
      haml :"budget/show"
    end
  end
end