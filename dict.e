class DICT
-- Dictionary for words, WORD.

create
	make,
	make_dict

feature {}
	dictionary: LINKED_LIST[WORD]

feature

	make is
		do
			create dictionary.make
		end

	make_dict(word_list: LINKED_LIST[WORD]) is
		do
			dictionary := word_list.twin
		end

	add_word(word: WORD): WORD is
		do
			create dictionary.make
			Result := word
			dictionary.add_first(word)
		end

	add_term(term, translation: STRING): WORD is
		local
			word: WORD
		do
			create word.make_simple(term, translation)
			Result := add_word(word)
		end

	start is
		do
			dictionary.start
		end

	next: WORD is
		do
			dictionary.forth
			dictionary.item
		end

	exhausted: BOOLEAN is
		do
			Result := dictionary.exhausted
		end

	shuffled: DICT is
		local
			shuf: LINKED_LIST[WORD]
			count: INTEGER
			i: INTEGER
			rng: FUCK_RANDOM
		do
			create rng.make
			shuf := dictionary.twin
			count := shuf.count
			
			from i := count - 1
			until i <= 0
			loop
				shuf.swap(rng.get(i, count), i)
				i := i - 1
			end

			Result := shuf
		end
end
