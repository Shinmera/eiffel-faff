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

	make_simple(first_term, first_translation: STRING)
		do
			create terms.make
			create translations.make
			terms.force(first_term)
			translations.force(first_translation)
		end
	
	make (term_list, translation_list: LINKED_LIST[STRING])
		do
			terms := term_list
			translations := translation_list
		end

	is_translation(answer: STRING): BOOLEAN
		do
			Result := False
			from translations.start
			until translations.exhausted or Result
			loop
				if translations.item.is_case_insensitive_equal(answer) then
					Result := True
				end
				translations.forth
			end
		end

	term: STRING
		do
			Result := terms.at(0)
		end

	translation: STRING
		do
			Result := translations.at(0)
		end
	
end
