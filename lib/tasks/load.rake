namespace :load do
  task items: :environment do
    require "csv"
    csv_text = File.read("lib/csvs/items_list.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Item.create(name: row["name"])
    end
    puts "items loaded successfully"
  end
end
