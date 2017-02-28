module RandomData

   def self.random_paragraph
     sentences = []
     rand(2..5).times do
       sentences << random_sentence
     end

     sentences.join(" ")
   end

   def self.random_sentence
     strings = []
     rand(4..10).times do
       strings << random_word
     end

     sentence = strings.join(" ")
     sentence.capitalize << "."
   end

   def self.random_word
     letters = ('a'..'z').to_a
     letters.shuffle!
     letters[0,rand(2..15)].join
   end
 end
