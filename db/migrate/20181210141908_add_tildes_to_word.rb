class AddTildesToWord < ActiveRecord::Migration[5.0]

  def change
  end

  def self.convert2tilde(letra)

  end

  palabras = Word.all
  c = 0
  palabras.each do |palabra|

    i = 0
    s = ""
    puts "Primer: "+palabra.name
    if (palabra.name.at(palabra.name.size-1)=="\n")
      word = palabra.name.slice(0,palabra.name.size-1)
    else
      word = palabra.name
    end


    while i < word.length

      if word.at(i+1) == "\\" or word.at(i) == "\\" or word.at(i) == "~"
        if ('a'== word.at(i))
          tilde = 'á'
        elsif ('e'== word.at(i))
          tilde = 'é'
        elsif ('i'== word.at(i))
          tilde = 'í'
        elsif ('o'== word.at(i))
          tilde = 'ó'
        elsif ('u'== word.at(i))
          tilde = 'ú'
        else
          tilde = ""
        end
        s = s + tilde
      elsif word.at(i+1) == "~"
        s = s + "ñ"   
      else
        s = s + word.at(i)
      end
      i += 1
    end
    c+=1
    descripcion = palabra.description

    puts "num ciclo: "+ c.to_s
    puts s
    puts "Segundo: " + palabra.name

    Word.destroy(Word.where(id: palabra.id))
    Word.create(name: s, description: descripcion)

  end

end
