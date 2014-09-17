class TRAINER
-- Dickbutts

create
	make

feature {}
	dict: DICT

feature
	make
		do
			create dict.make
			dict.add_term("dick", "butt")
			dict.add_term("foo", "bar")
			dict.add_term("something", "else")
		end

	train
		local
			shuf: DICT
			word: WORD
			input: STRING
		do
			shuf := dict.shuffled
			across shuf.words as ic
			loop
				word := ic.item
				io.put_string(" > What is: "+word.term+" ?")
				io.put_new_line
				
				io.read_line
				input := io.last_string

				if word.is_translation(input) then
					io.put_string(" > Correct!")
				else
					io.put_string(" > No, it is "+word.translation+" .")
				end
				io.put_new_line
				io.put_new_line
			end
		end
end
