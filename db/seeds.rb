# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning up Database…"
Booking.destroy_all
Dog.destroy_all
User.destroy_all
puts "Database is clean"

user1 = User.new(email: "test@test.com", password: "123456")
user1.save!

img_urls = %w(
https://user-images.githubusercontent.com/95690676/155146028-3afbad6f-ceb7-46b9-aa61-67fd808b93c1.jpg
https://user-images.githubusercontent.com/95690676/155146033-2207347f-68a6-43d5-a50d-956f1c887391.jpg
https://user-images.githubusercontent.com/95690676/155146035-121d51f3-770e-4240-ab70-d76f12c95e63.jpg
https://user-images.githubusercontent.com/95690676/155146038-4c940492-4989-4b19-a283-cd472b4e307e.jpg
https://user-images.githubusercontent.com/95690676/155146039-5d21859a-68be-407b-9d1e-49f79fdd987b.jpg
https://user-images.githubusercontent.com/95690676/155146043-516d9c1a-96d6-4bfb-841a-f324119c0a4b.jpg
https://user-images.githubusercontent.com/95690676/155146044-a5b859c8-9684-4d9e-af39-d78f4cfd38e3.jpg
https://user-images.githubusercontent.com/95690676/155146045-f7b6077a-9062-4cc2-a633-99d75e5ee22e.jpg
https://user-images.githubusercontent.com/95690676/155146047-fa3ba3a8-24bc-44ce-93a7-a0fe006f66c9.jpg
https://user-images.githubusercontent.com/95690676/155146050-0ccef8b4-9382-46c8-8c60-09d142774d03.jpg
https://user-images.githubusercontent.com/95690676/155146054-ef200df6-8d8c-4255-babd-be91c3e4b5de.jpg
https://user-images.githubusercontent.com/95690676/155146056-f0d63765-b2e8-4e0c-b47c-89d298be64d9.jpg
https://user-images.githubusercontent.com/95690676/155146057-c68e5a16-6eb9-419d-a337-6bb83be28a86.jpg
https://user-images.githubusercontent.com/95690676/155146059-a9044144-fc20-412a-9aec-1aabc14ada73.jpg
https://user-images.githubusercontent.com/95690676/155146061-1b09cb95-821a-4ecd-81d9-06792754ce3b.jpg
https://user-images.githubusercontent.com/95690676/155146063-17db1436-ea87-4ef9-998a-87915889ef07.jpg
https://user-images.githubusercontent.com/95690676/155146066-17113c5e-5654-4e2b-a008-bdd7a030435c.jpg
https://user-images.githubusercontent.com/95690676/155146069-d2203eca-39c3-4e33-87e9-61d027269466.jpg
https://user-images.githubusercontent.com/95690676/155146072-e7ef2968-2ab3-4704-a2b4-2c63cb8c9e0e.jpg
https://user-images.githubusercontent.com/95690676/155146074-86dba9ff-3eee-4151-b27e-bca1b85f252a.jpg
https://user-images.githubusercontent.com/95690676/155146075-d7db4ff7-a282-4c33-a0d4-5c7b00838339.jpg
https://user-images.githubusercontent.com/95690676/155146076-0d82a197-16e5-4f2d-a581-9139bdd4db56.jpg
https://user-images.githubusercontent.com/95690676/155146077-384d22d1-c7a2-4b24-95ea-0fbf9eba6db6.jpg
https://user-images.githubusercontent.com/95690676/155146079-e3d3a074-34c3-468e-9f69-39f04327df20.jpg
https://user-images.githubusercontent.com/95690676/155146080-443cfbd7-8091-4f1c-8dde-72a29406048e.jpg
https://user-images.githubusercontent.com/95690676/155146081-a369f446-69a3-495c-9c03-4d536f020269.jpg
https://user-images.githubusercontent.com/95690676/155146082-ba8cf4f5-a44e-495e-a6b7-2b93f2e0a60f.jpg
https://user-images.githubusercontent.com/95690676/155146087-a4fade08-2e75-4d21-9744-92850dd0b622.jpg
https://user-images.githubusercontent.com/95690676/155146088-136cfa0d-4768-4c41-9e32-90aa188e6676.jpg
https://user-images.githubusercontent.com/95690676/155146090-755c24ab-3c90-4f3c-9a5f-19ec02378c43.jpg)

addresses = [
"Lehrter Str. 12, 10557 Berlin, Moabit",
"Boxhagener Str. 73, 10245 Berlin, Friedrichshain",
"Carmerstr. 6, 10623 Berlin, Charlottenburg",
"Hauptstr. 135, 10827 Berlin, Schöneberg",
"Streustr. 123, 13086 Berlin, Weißensee",
"Margaretenstr. 37, 12203 Berlin, Lichterfelde",
"Berliner Str. 44, 10713 Berlin, Wilmersdorf",
"777 Brockton Avenue, Abington MA 2351",
"30 Memorial Drive, Avon MA 2322",
"250 Hartford Avenue, Bellingham MA 2019",
"700 Oak Street, Brockton MA 2301",
"66-4 Parkhurst Rd, Chelmsford MA 1824",
"591 Memorial Dr, Chicopee MA 1020",
"55 Brooksby Village Way, Danvers MA 1923",
"137 Teaticket Hwy, East Falmouth MA 2536",
"42 Fairhaven Commons Way, Fairhaven MA 2719",
"374 William S Canning Blvd, Fall River MA 2721",
"121 Worcester Rd, Framingham MA 1701",
"677 Timpany Blvd, Gardner MA 1440",
"337 Russell St, Hadley MA 1035",
"295 Plymouth Street, Halifax MA 2338",
"1775 Washington St, Hanover MA 2339",
"280 Washington Street, Hudson MA 1749",
"20 Soojian Dr, Leicester MA 1524",
"11 Jungle Road, Leominster MA 1453",
"301 Massachusetts Ave, Lunenburg MA 1462",
"780 Lynnway, Lynn MA 1905",
"70 Pleasant Valley Street, Methuen MA 1844",
"830 Curran Memorial Hwy, North Adams MA 1247",
"1470 S Washington St, North Attleboro MA 2760",
"506 State Road, North Dartmouth MA 2747",
"742 Main Street, North Oxford MA 1537",
"72 Main St, North Reading MA 1864",
"200 Otis Street, Northborough MA 1532",
"180 North King Street, Northhampton MA 1060",
"555 East Main St, Orange MA 1364",
"555 Hubbard Ave-Suite 12, Pittsfield MA 1201"]




img_urls.each_with_index do |img, index|
  file = URI.open(img)
  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    gender: Faker::Creature::Dog.gender,
    breed: Faker::Creature::Dog.breed,
    age: Faker::Creature::Dog.age,
    size: Faker::Creature::Dog.size,
    description: "#{Dog.name} is a cuddly and feisty little teddy bear, who likes to be petted, often putting their front paws on your knee asking for attention. #{Dog.name} braves the other dogs to vie for lap-time - then they lays sideways on your chest and snuggles their head under your chin. #{Dog.name}'s hair is very soft. #{Dog.name} can be playful with their human but not that interactive with the other dogs. When breakfast and dinner is getting dished up, #{Dog.name} barks and barks - the best times of the day. #{Dog.name} does sit before getting their food dish if asked. #{Dog.name} likes to be an only pet; they chase the cats and learned other dogs have boundaries and don’t share their food bowls. #{Dog.name} has gotten much more social with other people but not fond of young children. After they get petted, they go to the couch, kick back and keeps a curious eye on what’s going on. #{Dog.name} is a really cute and fun little dog. They can be quite social or the best nap-buddy you’ve ever had.",
    address: addresses.sample
    )
    dog.user = user1
  dog.photo.attach(io: file, filename: "dog_#{index}.jpg", content_type: 'image/jpg')
  dog.save
  p "Dog #{index} uploaded"
end
