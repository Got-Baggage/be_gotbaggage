require "csv"

namespace :load do
  task essential_items: :environment do
    csv_text = File.read("lib/csvs/essential_items.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      # Item.create(name: row["name"], category: "essentials")
      Item.create(name: row["name"], category: "essentials")
    end
  end

  task beach_items: :environment do
    csv = csv_reader("lib/csvs/beach_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "beach")
    end
  end

  task city_items: :environment do
    csv = csv_reader("lib/csvs/city_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "city")
    end
  end

  task international_items: :environment do
    csv = csv_reader("lib/csvs/international_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "international")
    end
  end

  task roadtrip_items: :environment do
    csv = csv_reader("lib/csvs/roadtrip_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "roadtrip")
    end
  end

    task snowsports_items: :environment do
    csv = csv_reader("lib/csvs/snowsports_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "snowsports")
    end
  end

    task camping_items: :environment do
    csv = csv_reader("lib/csvs/camping_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "camping")
    end
  end

  desc "Load all from CSV"
  task all_items: :environment do
    Rake::Task["load:essential_items"].invoke
    Rake::Task["load:city_items"].invoke
    Rake::Task["load:international_items"].invoke
    Rake::Task["load:roadtrip_items"].invoke
    Rake::Task["load:snowsports_items"].invoke
    Rake::Task["load:camping_items"].invoke
    puts "all items loaded successfully"
  end
end

def csv_reader(csv_file)
  csv_text = File.read(csv_file)
  CSV.parse(csv_text, :headers => true)
end