-- The prime factors of 13195 are 5, 7, 13 and 29.
--
-- What is the largest prime factor of the number 600851475143 ?

gpf n =
  let loop rem f 
        | rem == p            = p
        | rem `mod` p == 0    = loop (floor(fromIntegral(rem)/fromIntegral(p))) f
        | otherwise           = loop rem xs
          where p:xs = f
  in loop n pfactors
  where
    pfactors = [p | p<-primes, n `mod` p == 0]
    primes = 2 : eratos [3,5..]
    eratos (p:xs) = p : eratos [x | x<-xs, x `mod` p /= 0]

main = print(gpf(600851475143))

