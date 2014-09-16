class FUCK_RANDOM
-- I hate my life
-- so much.
create
	make
	
feature {}
	rng: RANDOM

feature
	make is
		do
			create rng
		end
	
	get(start, stop:INTEGER): INTEGER is
		do
			rng.forth
			Result := rng.item \\ stop + start
		end
end
