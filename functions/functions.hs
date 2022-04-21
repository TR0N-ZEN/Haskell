--'functionname :: datatype -> datatype'
--or
--'functionname :: datatype -> datatype -> datatype'
---and on and on 
--'functionname :: datatype -> ... -> datatype'

f :: Int -> Int -> Int 
f x y = x + y

--pattern matching
swap :: (Int,Int) -> (Int,Int)
swap (a,b) = (b,a)

 --on left side
isEmpty :: [Int] -> Bool
isEmpty [] = True
isEmpty xs = False
 --on right side
isEmpty' :: [Int] -> Bool
isEmpty' list = case list of
 [] -> True
 xs -> False

--case differentiation
max' :: Int -> Int -> Int
max' x y --following is case differentiation 
 | x < y  = y    --if x < y is true the value this function return is/equals y
 | x == y  = x   --since x and y must be equal it doesnt matter which one i give back meaning i could also write '| x == y  = y'
 | otherwise = x

--recursion
maxOfList :: [Int] -> Int
maxOfList [] = 0
maxOfList (x:xs) --decomposition of the argument/list into a first element x and the remaining list xs
 | x > maxOfList xs = x
 | otherwise = maxOfList xs


--inline defintions
maxSquare :: Int -> Int -> Int
maxSquare n m
 | sqN > sqM = sqN
 | otherwise = sqM
 where            --'where' is used for lokal definitions or you could say afterwards definitions since "sqN" and "sqM" are both values which are used before but haven't been defined so far 
  sqN = square n
  sqM = square m
  square :: Int -> Int
  square z = z * z

maxSquare' :: Int -> Int -> Int
maxSquare' n m =
 let square' z = z * z in -- 'let' is used for predefinition of functions for the with 'in' marked blocks; used again in pythagoras
  if square' n > square' m
   then n
   else m



--this language consists of functions only so get fkn used to it, there is no memory to save things

allequal :: Int -> Int -> Int -> Bool
allequal x y z = (x == y) && (x == z)

pythagoras :: Floating a => a -> a -> a -- a is a form of Floating; (Floating is already a form )
pythagoras x y = sqrt (let square z = z * z in square x + square y) --'let' is used for local definition before usage of things described in let, in comparison to 'where' clauses, 'let' is an expression, so as every expression it can be used inside other expressions

sumSquares :: Int -> Int
sumSquares 0 = 0
sumSquares i = i * i + sumSquares (i - 1)


-- lambda abstraction
increase = \x -> x+1 --instead of increase x = x + 1
add = \x y -> x + y  -- instead of add x y = x + y

-- function mal nutriition
increase = (+1) -- and increase = (1+) should also be possible
add = (+)

---constructor function for an infinite list
ones = 1 : ones

numsFrom n = n : numsFrom (n+1)

numsFrom2 = numsFrom 2

squares = map (^2) (numsFrom 0)
