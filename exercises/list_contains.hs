(||) :: Bool -> Bool -> Bool
b1 || b2
 | b1 = True
 | b2 = True
 | otherwise = False


listContains :: Int -> [Int] -> Bool
listContains x [] = False
listContains x (y:ys) = (x == y) Main.|| listContains x ys
-- I wrote 'Main.||' since || is defined in Prelude (a standard library used in ghc)
{-
	I had to use braces on '(x == y)' because of haskells rightside associativitythat
	that would have caused following order of evaluation of expressions if i left the braces out:
	1. listContains x ys
	2. y Main.|| (listContains x ys)
	3. x == (y Main.|| (listContains x ys))
	With braces like i wrote them:
	1. listContains x ys
	2. x == y
	3. (x == y) Main.|| (listContains x ys))
-}

listContains' :: Int -> [Int] -> Bool
listContains' x [] = False
listContains' x ys = foldr (\ y r -> (y==x) Main.|| r) False ys

-- since definition of foldr is
--
-- foldr :: (Int -> Int -> Int) -> Int -> [Int] -> Int
-- foldr _ z []        = z
-- foldr f z (x : xs)  = f x (foldr f z xs)
--
-- meaning that
-- foldr (\ y r -> (y==x) Main.|| r) False (a:as)
-- is equal to
-- (a==x) Main.|| foldr (\ y r -> (y==x) Main.|| r) False as
-- and so on
-- seeing it like this makes the right associativity of haskell seem natural