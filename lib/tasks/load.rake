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

  desc "Load all from CSV"
  task all_items: :environment do
    Rake::Task["load:essential_items"].invoke
    Rake::Task["load:beach_items"].invoke
    puts "all items loaded successfully"
  end
end

def csv_reader(csv_file)
  csv_text = File.read(csv_file)
  CSV.parse(csv_text, :headers => true)
end