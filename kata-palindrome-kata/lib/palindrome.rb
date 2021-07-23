class Palindromes
  def string?(word)
    string = word.downcase.delete(' ').reverse 
    string == string.reverse
  end

  def substring?(word)
    list = []
    word_length = word.length
    (0..word_length).each do |index1|
      (0..word_length).each do |index2|
        if index2 > index1
          substring = word.slice(index1..index2)
          if string?(substring) == true
            list.append(substring)
          else
            next
          end
        end
      end
    end
    list.reject! {|element| element.delete(" ").length < 2}
    return true if list.length > 0
    false
  end

end
