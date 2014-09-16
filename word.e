class WORD
-- A word. Surprise, motherfuckers!

create
	make,
	make_empty,
	make_simple

feature
	terms: LINKED_LIST[STRING]
	translations: LINKED_LIST[STRING]

	make_empty is
		do
			create terms.make
			create translations.make
		end

	make_simple(term, translation: STRING) is
		do
			create terms.make
			create translations.make
			terms.add_first(term)
			translations.add_first(translation)
		end
	
	make (term_list, translation_list: LINKED_LIST[STRING]) is
		do
			terms := term_list
			translations := translation_list
		end

	is_translation(term: STRING): BOOLEAN is
		do
			Result := False
			from terms.start
			until terms.exhausted or Result
			loop
				if term.same_as(terms.item) then
					Result := True
				end
				terms.forth
			end
		end
end
