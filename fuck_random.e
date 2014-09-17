class FUCK_RANDOM
-- I hate my life
-- so much.
create
	make
	
feature {}
	rng: RANDOM

feature
	make
		do
			create rng.make
		end
	
	get(start, stop:INTEGER): INTEGER
		do
			rng.forth
			Result := rng.item \\ stop + start
		end
end
