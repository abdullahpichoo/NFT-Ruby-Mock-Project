# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create 100 nft records that belong to the first user
# User.create(email: "abdullah@mail.com", password: "abdullah@mail.com", password_confirmation: "abdullah@mail.com", username: "pichoo")
# User.first.create_wallet(balance: 0, earnings: 0, items_sold: 0)
image = File.open(Rails.root.join('app/assets/images/test.jpg'))
100.times do |i|
    puts "Creating nft #{i}"
    Wallet.first.nfts.create!(
        name: "tests",
        price: 2,
        created_by: User.first.username,
        owner: User.first.username,
    ).image.attach(io: image, filename: 'test.jpg')
end
