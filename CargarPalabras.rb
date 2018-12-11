f = File.open("spanish.lex", "r")
c = 0
descripcion = "Lorem ipsum dolor sit amet, tortor aliquam cursus class aliquam diam sem, quis proin mauris. Convallis tincidunt in risus, vitae quam tincidunt vel eget elementum ultricies, ultrices urna corrupti, neque mollis, odio vel eros rem diam consectetuer."
arrDescript = descripcion.split(',')
linea = ""

f.each_line do |line|
  c = c + 1
  i = 0
  descript = ""
  
  n = rand(7)
  while i <= n do	
        descript = descript + arrDescript.at(i)
	i += 1;
  end
  if c <=91836
  	Word.create(name: line.tr(' ','').tr('*','').tr('#',''), description: descript)
  	linea = line
  end	
end
f.close

puts c
puts linea