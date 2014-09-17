class WORD
-- A word. Surprise, motherfuckers!

create
	make,
	make_empty,
	make_simple

feature
	terms: LINKED_LIST[STRING]
	translations: LINKED_LIST[STRING]

	make_empty
		do
			create terms.make
			create translations.make
		end

	make_simple(term, translation: STRING)
		do
			create terms.make
			create translations.make
			terms.put_front(term)
			translations.put_front(translation)
		end
	
	make (term_list, translation_list: LINKED_LIST[STRING])
		do
			terms := term_list
			translations := translation_list
		end

	is_translation(term: STRING): BOOLEAN
		do
			Result := False
			from terms.start
			until terms.exhausted or Result
			loop
				if term.is_case_insensitive_equal(terms.item) then
					Result := True
				end
				terms.forth
			end
		end
end
