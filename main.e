class MAIN

create
	make

feature
	make
		local
			trainer: TRAINER
		do
			create trainer.make
			trainer.train
		end
end
