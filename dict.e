class DICT
-- Dictionary for words, WORD.

create
	make,
	make_dict

feature
	words: LINKED_LIST[WORD]

	make
		do
			create words.make
		end

	make_dict(word_list: LINKED_LIST[WORD])
		do
			words := word_list.twin
		end

	add_word(word: WORD)
		do
			words.force(word)
		end

	add_term(term, translation: STRING)
		local
			word: WORD
		do
			create word.make_simple(term, translation)
			add_word(word)
		end

	shuffled: DICT
		local
			dict: DICT
			shuf: LINKED_LIST[WORD]
			rng: FUCK_RANDOM
		do
			create rng.make
			shuf := words.deep_twin
			
			from shuf.start
			until shuf.exhausted
			loop
				shuf.swap(rng.get(shuf.index-1, shuf.count))
				shuf.forth
			end

			create dict.make_dict(shuf)
			Result := dict
		end
end
