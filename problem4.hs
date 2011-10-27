-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
--
-- Find the largest palindrome made from the product of two 3-digit numbers.

digits :: (Integral a) => a->a->[a]
digits base n =
  let loop acc n'
        | n' == 0     = acc
        | otherwise   = loop ((n' `mod` base):acc) (n' `div` base)
  in loop [] n

digits10 = digits 10

isPalindrome l = foldl (&&) True (zipWith (==) l (reverse l))

-- xyzzyx
--
-- 100000x + 10000y + 1000z + 100z + 10y + x
-- 100001x + 10010y + 1100z
-- 11(9091a + 910b + 100c)
-- 
largest =
  [ x*y | x<-[110,121..999], y<-[100..999], (isPalindrome.digits10) (x*y)]

main = print( maximum(largest) )
  
