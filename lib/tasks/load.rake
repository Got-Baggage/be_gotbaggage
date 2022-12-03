require "csv"

namespace :load do
  task essential_items: :environment do
    csv_text = File.read("lib/csvs/essential_items.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create(name: row["name"], category: "essentials")
    end
    puts "essential items loaded successfully"
  end

  task beach_items: :environment do
    csv = csv_reader("lib/csvs/beach_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "beach")
    end
    puts "beach items loaded successfully"
  end

  task city_items: :environment do
    csv = csv_reader("lib/csvs/city_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "city")
    end
    puts "city items loaded successfully"
  end

  task international_items: :environment do
    csv = csv_reader("lib/csvs/international_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "international")
    end
    puts "international items loaded successfully"
  end

  task roadtrip_items: :environment do
    csv = csv_reader("lib/csvs/roadtrip_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "roadtrip")
    end
    puts "roadtrip items loaded successfully"
  end

  task snow_sport_items: :environment do
    csv = csv_reader("lib/csvs/snow_sport_items.csv")
    csv.each do |row|
      Item.create(name: row["name"], category: "snow sport")
    end
    puts "snow sport items loaded successfully"
  end

  # task all_items: :environment do
  #   rake load:essential_items
  #   rake load:beach_items
  # end
end



def csv_reader(csv_file)
  csv_text = File.read(csv_file)
  CSV.parse(csv_text, :headers => true)
end