class FAFF

create
	make

feature
	make
		local
			trainer: TRAINER
		do
			create trainer.make
			trainer.dict.add_term("dick", "butt")
			trainer.dict.add_term("foo", "bar")
			trainer.dict.add_term("something", "else")
			trainer.train
		end
end
