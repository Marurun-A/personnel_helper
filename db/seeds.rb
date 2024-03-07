# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tag.create([
#   { name: 'ホール業務' },
#   { name: '皿洗い' },
#   { name: '荷物整理' },
#   { name: '交通整備' },
#   { name: 'レジ打ち' }
# ])

tem.image.attach(io: File.open(Rails.root.join("app/assets/images/item-#{i+1}-#{j+1}.jpg")), filename: "item-#{i+1}-#{j+1}.jpg")