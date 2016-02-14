require 'csv'
require 'erb'

html = File.read("report.erb")

xyz =[]

CSV.foreach("planetexpresslogs.csv", headers: true) do |row|
xyz << row.to_hash
end

money = xyz
  .map {|moneys| moneys["Money"].to_i}
  .inject(:+)

fry=[]
amy=[]
bender=[]
leela=[]

personalmoney=xyz.each do |abc|
  if abc["Destination"] == "Earth"
    fry <<  abc
  elsif abc["Destination"] == "Mars"
    amy << abc
  elsif abc["Destination"] == "Uranus"
    bender << abc
  else
  leela << abc
  end
end


frym=fry.map {|frys| frys["Money"].to_i}.inject(:+)
amym=amy.map {|amys| amys["Money"].to_i}.inject(:+)
benderm=bender.map {|benders| benders["Money"].to_i}.inject(:+)
leelam=leela.map {|leelas| leelas["Money"].to_i}.inject(:+)

frybonus=frym * 0.1
amybonus=amym * 0.1
benderbonus=benderm * 0.1
leelabonus=leelam * 0.1

fryl=fry.length
amyl=amy.length
benderl=bender.length
leelal=leela.length

shipments=xyz.map{|cd| cd["Shipment"]}

# HARD MODE MONEY BY PLANET
earth=[]
mercury=[]
moon=[]
mars=[]
jupiter=[]
saturn=[]
uranus=[]
pluto=[]

planetarymoney=xyz.each do |bbb|
  if bbb["Destination"] == "Earth"
    earth << bbb
  elsif bbb["Destination"] == "Mercury"
    mercury << bbb
  elsif bbb["Destination"] == "Moon"
    moon << bbb
  elsif bbb["Destination"] == "Mars"
    mars << bbb
  elsif bbb["Destination"] == "Jupiter"
    jupiter << bbb
  elsif bbb["Destination"] == "Saturn"
    saturn << bbb
  elsif bbb["Destination"] == "Uranus"
    uranus << bbb
  else
    pluto << bbb
  end
end

earthm=earth.map {|earths| earths["Money"].to_i}.inject(:+).to_f
mercurym=mercury.map {|mercurys| mercurys["Money"].to_i}.inject(:+).to_f
moonm=moon.map {|moons| moons["Money"].to_i}.inject(:+).to_f
marsm=mars.map {|mar| mar["Money"].to_i}.inject(:+).to_f
jupiterm=jupiter.map {|jupiters| jupiters["Money"].to_i}.inject(:+).to_f
saturnm=saturn.map {|saturns| saturns["Money"].to_i}.inject(:+).to_f
uranusm=uranus.map {|uranu| uranu["Money"].to_i}.inject(:+).to_f
plutom=pluto.map {|plutos| plutos["Money"].to_i}.inject(:+).to_f 

new_html = ERB.new(html).result(binding)

File.open("report.html", "wb") do |file|
  file.write(new_html)
  file.close
end
