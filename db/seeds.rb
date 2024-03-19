# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tags = ["ホール業務","皿洗い","荷物整理","交通整備","レジ打ち","未経験OK"]
tags.each do |tag|
  Tag.find_or_create_by!(tag_name: tag) do |t|
    t.tag_name = tag
  end
end

#tem.image.attach(io: File.open(Rails.root.join("app/assets/images/item-#{i+1}-#{j+1}.jpg")), filename: "item-#{i+1}-#{j+1}.jpg")

kubotamikiko= Staff.find_or_create_by!(email: "mikiko@example.com") do |staff|
  staff.first_name = "窪田"
  staff.last_name = "美貴子"
  staff.first_name_kana ="クボタ"
  staff.last_name_kana ="ミキコ"
  # staff.email = "email"
  staff.postal_code = "524-0202"
  staff.address = "滋賀県野洲市菖蒲4-3"
  staff.telephone_number = "0740969492"
  staff.password = "kqBLn3z4"
  staff.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff1.jpg"), filename:"sample-staff1.jpg")
end

yanagawamarumi= Staff.find_or_create_by!(email: "marumi@example.com") do |staff|
  staff.first_name = "柳川"
  staff.last_name = "円美"
  staff.first_name_kana ="ヤナガワ"
  staff.last_name_kana ="マルミ"
  # staff.email = "email"
  staff.postal_code = "350-0035"
  staff.address = "埼玉県川越市西小仙波町3-16-10ステージ西小仙波町408	"
  staff.telephone_number = "0493368604"
  staff.password = "ZpX1zhbs"
  staff.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff2.jpg"), filename:"sample-staff2.jpg")
end

hukazawatomiko= Staff.find_or_create_by!(email: "tomiko@example.com") do |staff|
  staff.first_name = "深沢"
  staff.last_name = "登美子"
  staff.first_name_kana ="フカザワ"
  staff.last_name_kana ="トミコ"
  # staff.email = "email"
  staff.postal_code = "649-6451"
  staff.address = "和歌山県紀の川市神通1-11-20"
  staff.telephone_number = "0737469561"
  staff.password = "bO0NJENa"
  staff.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff3.jpg"), filename:"sample-staff3.jpg")
end

ookumamakoto= Staff.find_or_create_by!(email: "makoto@example.com") do |staff|
  staff.first_name = "大熊"
  staff.last_name = "信"
  staff.first_name_kana ="オオクマ"
  staff.last_name_kana ="マコト"
  # staff.email = "email"
  staff.postal_code = "683-0822"
  staff.address = "鳥取県米子市中町3-6-2	"
  staff.telephone_number = "0858060756"
  staff.password = "Io9S69P"
  staff.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff4.jpg"), filename:"sample-staff4.jpg")
end

todasiniti= Staff.find_or_create_by!(email: "siniti@example.com") do |staff|
  staff.first_name = "戸田"
  staff.last_name = "進一"
  staff.first_name_kana ="トダ"
  staff.last_name_kana ="シンイチ"
  # staff.email = "email"
  staff.postal_code = "949-4125"
  staff.address = "新潟県柏崎市西山町中央台1-2-20西山町中央台フォレスト400"
  staff.telephone_number = "0253375415"
  staff.password = "wBwAxF47"
  staff.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff5.jpg"), filename:"sample-staff5.jpg")
end

isikawaharuo= Staff.find_or_create_by!(email: "haruo@example.com") do |staff|
  staff.first_name = "石川"
  staff.last_name = "春夫"
  staff.first_name_kana ="イシカワ"
  staff.last_name_kana ="ハルオ"
  # staff.email = "email"
  staff.postal_code = "524-0002"
  staff.address = "滋賀県守山市小島町4-16"
  staff.telephone_number = "0749957069"
  staff.password = "fZCSFTj"
  staff.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff6.jpg"), filename:"sample-staff6.jpg")
end

 banndouyutaka= Company.find_or_create_by!(email: "yutaka@example.com") do |company|
  company.first_name = "坂東"
  company.last_name = "穰"
  company.first_name_kana ="バンドウ"
  company.last_name_kana ="ユタカ"
  # company.email = "email"
  company.postal_code = "669-5341"
  company.address = "兵庫県豊岡市日高町国分寺4-1	"
  company.telephone_number = "0798594470"
  company.password = "zZvdrAHP"
  company.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company1.jpg"), filename:"sample-company1.jpg")
end

 sakagamikanata= Company.find_or_create_by!(email: "kanata@example.com") do |company|
  company.first_name = "坂上"
  company.last_name = "彼方"
  company.first_name_kana ="サカガミ"
  company.last_name_kana ="カナタ"
  # company.email = "email"
  company.postal_code = "789-1702"
  company.address = "高知県幡多郡黒潮町佐賀橘川1-18-11	"
  company.telephone_number = "0889489295"
  company.password = "O7fiqGra"
  company.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company2.jpg"), filename:"sample-company2.jpg")
end

 nakamoriyasuyuki= Company.find_or_create_by!(email: "yasuyuki@example.com") do |company|
  company.first_name = "中森"
  company.last_name = "恭之"
  company.first_name_kana ="ナカモリ"
  company.last_name_kana ="ヤスユキ"
  # company.email = "email"
  company.postal_code = "480-1102"
  company.address = "愛知県長久手市前熊根ノ原4-1-1前熊根ノ原マンション101"
  company.telephone_number = "0562746954"
  company.password = "e9a3ojJ"
  company.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company3.jpg"), filename:"sample-company3.jpg")
end

 hujiwaramako= Company.find_or_create_by!(email: "mako@example.com") do |company|
  company.first_name = "藤原"
  company.last_name = "真子"
  company.first_name_kana ="フジワラ"
  company.last_name_kana ="マコ"
  # company.email = "email"
  company.postal_code = "997-0862"
  company.address = "山形県鶴岡市ほなみ町2-19-20ほなみ町の杜317"
  company.telephone_number = "0233837810"
  company.password = "CCtp4wAd"
  company.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company4.jpg"), filename:"sample-company4.jpg")
end

 yagutiasako= Company.find_or_create_by!(email: "asako@example.com") do |company|
  company.first_name = "矢口"
  company.last_name = "亜抄子"
  company.first_name_kana ="ヤグチ"
  company.last_name_kana ="アサコ"
  # company.email = "email"
  company.postal_code = "728-0027"
  company.address = "広島県三次市三原町1-18-11	"
  company.telephone_number = "0826878119"
  company.password = "AaCaseGB"
  company.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company5.jpg"), filename:"sample-company5.jpg")
end

 matidakanade= Company.find_or_create_by!(email: "kanade@example.com") do |company|
  company.first_name = "町田"
  company.last_name = "奏"
  company.first_name_kana ="マチダ"
  company.last_name_kana ="カナデ"
  # company.email = "email"
  company.postal_code = "374-0031"
  company.address = "群馬県館林市東美園町"
  company.telephone_number = "0276059473"
  company.password = "UDQ2ND"
  company.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company6.jpg"), filename:"sample-company6.jpg")
end

Request.find_or_create_by!(request_name: "窪田美貴子") do |request|
  request.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff1.jpg"), filename:"sample-request1.jpg")
  request.request_kana = "クボタミキコ"
  request.introduction = "飲食店でのバイト経験があります。調理関係は経験がありませんが、接客業務やレジ打ちなどフロア業務全般に関しては長期間していたのでできます。"
  request.start_date = "2024-04-15"
  request.finish_date = "2024-04-20"
  request.start_time = "18:00"
  request.finish_time = "21:00"
  request.maximum_time = "3"
  request.place = "滋賀県野洲市"
  request.contact_address = "0740969492"
  request.staff = kubotamikiko
   #request.staff_id = "staff_id"
end

Request.find_or_create_by!(request_name: "柳川円美") do |request|
  request.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff2.jpg"), filename:"sample-request2.jpg")
  request.request_kana = "ヤナガワマルミ"
  request.introduction = "本屋での業務経験があります。本の陳列から発注まで、本屋に関する業務は一通りできます。"
  request.start_date = "2024-04-20"
  request.finish_date = "2024-04-30"
  request.start_time = "13:00"
  request.finish_time = "18:00"
  request.maximum_time = "5"
  request.place = "埼玉県川越市"
  request.contact_address = "0493368604"
  request.staff = yanagawamarumi
  #request.staff_id = "staff_id"
end

Request.find_or_create_by!(request_name: "深沢登美子") do |request|
  request.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff3.jpg"), filename:"sample-request3.jpg")
  request.request_kana = "フカザワトミコ"
  request.introduction = "運送業で２年勤務していました。主にセンターで商品の仕分けを行なっていました"
  request.start_date = "2024-03-20"
  request.finish_date = "2024-05-30"
  request.start_time = "8:00"
  request.finish_time = "17:00"
  request.maximum_time = "8"
  request.place = "和歌山県紀の川市"
  request.contact_address = "0737469561"
  request.staff = hukazawatomiko
  #request.staff_id = "staff_id"
end

Request.find_or_create_by!(request_name: "大熊信") do |request|
  request.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff4.jpg"), filename:"sample-request4.jpg")
  request.request_kana = "オオクママコト"
  request.introduction = "土木現場での業務を現在もしています。アルバイトなので掛け持ちで日雇いのバイトを探しいています。体力と力仕事には自信があります"
  request.start_date = "2024-05-21"
  request.finish_date = "2024-05-30"
  request.start_time = "8:00"
  request.finish_time = "21:00"
  request.maximum_time = "8"
  request.place = "鳥取県米子市"
  request.contact_address = "0858060756"
  request.staff = ookumamakoto
   #request.staff_id = "staff_id"
end

Request.find_or_create_by!(request_name: "戸田進一") do |request|
  request.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff5.jpg"), filename:"sample-request5.jpg")
  request.request_kana = "トダシンイチ"
  request.introduction = "昨年までコンビニでアルバイトをしていました。深夜帯で一人で業務するのも当たり前にしていました。"
  request.start_date = "2024-06-24"
  request.finish_date = "2024-06-30"
  request.start_time = "21:00"
  request.finish_time = "24:00"
  request.maximum_time = "3"
  request.place = "新潟県柏崎市"
  request.contact_address = "0253375415"
  request.staff = todasiniti
  #request.staff_id = "staff_id"
end

Request.find_or_create_by!(request_name: "石川春夫") do |request|
  request.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-staff6.jpg"), filename:"sample-request6.jpg")
  request.request_kana = "イシカワハルオ"
  request.introduction = "以前日雇いの交通量調査のバイトを何回か経験しています。忍耐力はあるので単純な作業であればできます"
  request.start_date = "2024-07-21"
  request.finish_date = "2024-08-30"
  request.start_time = "8:00"
  request.finish_time = "17:00"
  request.maximum_time = "8"
  request.place = "滋賀県守山市"
  request.contact_address = "0749957069"
  request.staff = isikawaharuo
  #request.staff_id = "staff_id"
end

Recruitment.find_or_create_by!(recruitment_name: "坂東運送") do |recruitment|
  recruitment.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company1.jpg"), filename:"sample-recruitment1.jpg")
  recruitment.recruitment_kana = "バンドウウンソウ"
  recruitment.introduction = "配送センターで、荷物の仕分け作業です。現場スタッフの指示にて作業を行ってもらうので、未経験でも可能です。"
  recruitment.hourly_wage = "900"
  recruitment.start_date = "2024-04-01"
  recruitment.finish_date = "2024-04-30"
  recruitment.start_time = "13:00"
  recruitment.finish_time = "18:00"
  recruitment.minimum_time = "3"
  recruitment.place = "兵庫県豊岡市日高町国分寺4-1"
  recruitment.contact_address = "0798594470"
  recruitment.company = banndouyutaka
  # recruitment.company_id = ""
end

Recruitment.find_or_create_by!(recruitment_name: "坂上ハンバーグハウス") do |recruitment|
  recruitment.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company2.jpg"), filename:"sample-recruitment2.jpg")
  recruitment.recruitment_kana = "サカガミチステーキハウス"
  recruitment.introduction = "飲食店での皿洗いをお願いしています。経験者で自身のある方はホール業務もお願いしたいです。その場合は時給upします。"
  recruitment.hourly_wage = "1000"
  recruitment.start_date = "2024-04-30"
  recruitment.finish_date = "2024-05-30"
  recruitment.start_time = "11:00"
  recruitment.finish_time = "14:00"
  recruitment.minimum_time = "3"
  recruitment.place = "高知県幡多郡黒潮町佐賀橘川1-18-11"
  recruitment.contact_address = "0889489295"
  recruitment.company = sakagamikanata
  # recruitment.company_id = ""
end

Recruitment.find_or_create_by!(recruitment_name: "5イレブン") do |recruitment|
  recruitment.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company3.jpg"), filename:"sample-recruitment3.jpg")
  recruitment.recruitment_kana = "ファイブイレブン"
  recruitment.introduction = "レジ対応と商品陳列業務をお願いしています。少人数での業務のため経験者が望ましいです。"
  recruitment.hourly_wage = "1100"
  recruitment.start_date = "2024-03-23"
  recruitment.finish_date = "2024-05-30"
  recruitment.start_time = "21:00"
  recruitment.finish_time = "6:00"
  recruitment.minimum_time = "8"
  recruitment.place = "愛知県長久手市前熊根ノ原4-1-1前熊根ノ原マンション101"
  recruitment.contact_address = "0562746954"
  recruitment.company = nakamoriyasuyuki
  # recruitment.company_id = ""
end

Recruitment.find_or_create_by!(recruitment_name: "フワッとヒザ") do |recruitment|
  recruitment.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company4.jpg"), filename:"sample-recruitment4.jpg")
  recruitment.recruitment_kana = "フワットピザ"
  recruitment.introduction = "オーダー取りを主に行ってもらい、時折洗い物もしてもらいます。"
  recruitment.hourly_wage = "950"
  recruitment.start_date = "2024-04-01"
  recruitment.finish_date = "2024-04-30"
  recruitment.start_time = "17:00"
  recruitment.finish_time = "21:00"
  recruitment.minimum_time = "4"
  recruitment.place = "山形県鶴岡市ほなみ町2-19-20ほなみ町の杜317"
  recruitment.contact_address = "0233837810"
  recruitment.company = hujiwaramako
  # recruitment.company_id = ""
end

Recruitment.find_or_create_by!(recruitment_name: "HAIRYAGUTI") do |recruitment|
  recruitment.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company5.jpg"), filename:"sample-recruitment5.jpg")
  recruitment.recruitment_kana = "ヘアーヤグチ"
  recruitment.introduction = "お客さんへのお茶だしと店内の掃除を主に行ってもらいます"
  recruitment.hourly_wage = "1200"
  recruitment.start_date = "2024-04-15"
  recruitment.finish_date = "2024-04-30"
  recruitment.start_time = "9:00"
  recruitment.finish_time = "16:00"
  recruitment.minimum_time = "7"
  recruitment.place = "広島県三次市三原町1-18-11"
  recruitment.contact_address = "0826878119"
  recruitment.company = yagutiasako
  # recruitment.company_id = ""
end

Recruitment.find_or_create_by!(recruitment_name: "株式会社ペット") do |recruitment|
  recruitment.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-company6.jpg"), filename:"sample-recruitment6.jpg")
  recruitment.recruitment_kana = "カブシキカイシャペット"
  recruitment.introduction = "ラベル貼りと梱包の手伝いを募集しています。未経験の方でも簡単にできます"
  recruitment.hourly_wage = "1100"
  recruitment.start_date = "2024-04-01"
  recruitment.finish_date = "2024-04-30"
  recruitment.start_time = "9:00"
  recruitment.finish_time = "12:00"
  recruitment.minimum_time = "3"
  recruitment.place = "群馬県館林市東美園町2-7"
  recruitment.contact_address = "0276059473"
  recruitment.company = matidakanade
  # recruitment.company_id = ""
end
