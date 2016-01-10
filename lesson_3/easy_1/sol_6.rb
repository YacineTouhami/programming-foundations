famous_words = "seven years ago..."
before = "Four score and "

# first way : using +

famous_words = before + famous_words
puts famous_words

# Second way using prepend


famous_words = "seven years ago..."
famous_words.prepend(before)
puts famous_words
