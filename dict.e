class DICT
-- Dictionary for words, WORD.

create
	make,
	make_dict

feature {}
	dictionary: LINKED_LIST[WORD]

feature

	make
		do
			create dictionary.make
		end

	make_dict(word_list: LINKED_LIST[WORD])
		do
			dictionary := word_list.twin
		end

	add_word(word: WORD): WORD
		do
			create dictionary.make
			Result := word
			dictionary.put_front(word)
		end

	add_term(term, translation: STRING): WORD
		local
			word: WORD
		do
			create word.make_simple(term, translation)
			Result := add_word(word)
		end

	start
		do
			dictionary.start
		end

	next: WORD
		do
			dictionary.forth
			Result := dictionary.item
		end

	exhausted: BOOLEAN
		do
			Result := dictionary.exhausted
		end

	shuffled: DICT
		local
			dict: DICT
			shuf: LINKED_LIST[WORD]
			count: INTEGER
			rng: FUCK_RANDOM
		do
			create rng.make
			shuf := dictionary.twin
			count := shuf.count
			
			from shuf.finish
			until shuf.isfirst
			loop
				shuf.back
				shuf.swap(rng.get(shuf.index, count))
			end

			create dict.make_dict(shuf)
			Result := dict
		end
end
