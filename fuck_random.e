class FUCK_RANDOM
-- I hate my life
-- so much.
create
	make
	
feature {}
	rng: RANDOM

feature
	make
		local
			l_time: TIME
			l_seed: INTEGER
		do
			create l_time.make_now
			l_seed := l_time.hour
			l_seed := l_seed * 60 + l_time.minute
			l_seed := l_seed * 60 + l_time.second
			l_seed := l_seed * 1000 + l_time.milli_second
			create rng.set_seed(l_seed)
		end
	
	get(lower, upper:INTEGER): INTEGER
		do
			rng.forth
			Result := rng.item \\ (upper-lower) + lower
		end
end
