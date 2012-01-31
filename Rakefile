require "rubygems"
require "bundler/setup"

Bundler.require(:default, ENV["RACK_ENV"] || "development")

namespace :db do
  desc "Create DB schema"
  task :create do
    db = Sequel.connect(ENV["DATABASE_URL"])
    
    db.create_table!(:activities) do
      primary_key :id
      column :title, String
      column :day, Integer
      column :duration, Integer
    end
  end

  desc "Create Basic dataset"
  task :seed do
    db = Sequel.connect(ENV["DATABASE_URL"])
    activities = db[:activities]
    
    # Everyday
    (0..7).each do |i|
      activities.insert(title: "Sleep", day: i, duration: 28800)
      activities.insert(title: "Dinner", day: i, duration: 5400)
    end

    # Weekdays
    (1..5).each do |i|
      activities.insert(title: "Work", day: i, duration: 28800)
      activities.insert(title: "Lunch", day: i, duration: 3600)
    end

    # Weekends
    [0,6].each do |i|
      activities.insert(title: "Lunch", day: i, duration: 5400)
    end

    # Only one day a week
    activities.insert(title: "Fiddle 1", day: 6, duration: 4800)
  end
end
