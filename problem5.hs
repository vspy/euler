--
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
-- 
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
--

-- it was bruteforce solution first:

--smallest to = 
--  head [x' | x'<-[primesProduct,primesProduct*2..], rangeDivisible x']
--  where 
--    range = [1..to]
--    rangeDivisible x = foldl (&&) True [divisible x y | y<-range]
--    divisible x y = ((==).mod x) y 0
--    -- should be at least divisible by all the primes in range,
--    -- so it should be divisable by their product as well
--    primesProduct = foldl (*) 1 toPrimes
--    toPrimes = takeWhile (<=to) primes
--    -- primes from problem 3
--    primes = 2 : eratos [3,5..]
--    eratos (p:xs) = p : eratos [x | x<-xs, x `mod` p /= 0]
--
-- main = print(smallest 20) 


-- and then I found out lcm x y - the smallest positive integer that both x and y divide
-- and it became like:
main = print (foldl lcm 2 [3..20])
