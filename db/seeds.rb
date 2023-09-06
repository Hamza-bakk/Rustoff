# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Item.destroy_all

items_data = [
    {
        title: "Image 1",
        description: "Echantillon de mon travail",
        price: 5.99,
        image_url: "image1.jpg",
        alt: "Test",
        created_at: Time.now,
        updated_at: Time.now
    },
    
    {
        title: "Image 2",
        description: "Echantillon de mon travail",
        price: 4.99,
        image_url: "image2.jpg",
        alt: "Test",
        created_at: Time.now,
        updated_at: Time.now
    },
    
    
    {
        title: "image 3",
        description: "Echantillon de mon travail",
        price: 3.99,
        image_url: "image3.jpg",
        alt: "Test",
        created_at: Time.now,
        updated_at: Time.now
    },
    
    {
        title: "image 4",
        description: "Echantillon de mon travail",
        price: 6.99,
        image_url: "image4.png",
        alt: "Test",
        created_at: Time.now,
        updated_at: Time.now
    },]

    items_data.each do |data|
        Item.create(data)
    end
