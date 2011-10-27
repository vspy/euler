-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
--
-- What is the 10 001st prime number?
-- 
primeNr x = primes!!(x-1) -- one-based to zero-based index
  -- primes from problem nr 3
  where primes = 2 : eratos [3,5..]
        eratos (p:xs) = p : eratos [x | x<-xs, x `mod` p /= 0]

main = print(primeNr 10000)

-- I'm sure it's not the most efficient implementation,
-- but rules are rules — less than a minute
--
--time ./problem7
--104729
--
--real	0m8.083s
--user	0m7.849s
--sys	0m0.055s
--
