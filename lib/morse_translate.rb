
class MoreToEnglish
  def run(morseToEnglish, textToTranslate)
    vocy = { "a" => ".-","b" => "-...","c" => "-.-.","d" => "-..","e" => ".","f" => "..-.","g" => "--.","h" => "....","i" => "..","j" => ".---","k" => "-.-","l" => ".-..","m" => "--","n" => "-.","o" => "---","p" => ".--.","q" => "--.-","r" => ".-.","s" => "...","t" => "-","u" => "..-","v" => "...-","w" => ".--","x" => "-..-","y" => "-.--","z" => "--.."," " => " ","1" => ".----","2" => "..---","3" => "...--","4" => "....-","5" => ".....","6" => "-....","7" => "--...","8" => "---..","9" => "----.","0" => "-----"}
		if morseToEnglish == true
			ar = textToTranslate.split("   ")
			return 'Invalid Morse Code Or Spacing' if ar.all?{|m| vocy.invert.keys.include?(m)}
        words = ar.map{|m| m.split(" ")}
  		  m =	words.each{|m| m.map!{|a| a =  vocy.invert[a]}}.map{|f| f.join(" ")}
        translatedText = m.map{|c| c.delete(" ").join(" ").capitalize
  		return translatedText
		else
			ar = textToTranslate.split("   ")
		return 'Invalid Morse Code Or Spacing' if	ar.all?{|m| vocy.keys.include?(m)}
			b = []
			ar.each{|m| b << vocy[m] }
		  b.each{|m| translatedText << m + "  " }
			return translatedText
	  end
  end
end
