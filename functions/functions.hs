--'FUNCTIONNAME :: DATATYPE -> DATATYPE'
--or
--'FUNCTIONNAME :: DATATYPE -> DATATYPE -> DATATYPE'
---and on and on 
--'FUNCTIONNAME :: DATATYPE -> ... -> DATATYPE'

sumSquares :: Int -> Int
sumSquares 0 = 0
sumSquares i = i * i + sumSquares (i - 1)


allequal :: Int -> Int -> Int -> Bool
allequal x y z = (x == y) && (x == z)


max' :: Int -> Int -> Int
max' x y --following is case differentiation   
 | x < y  = y    --if x < y is true the value this function return is/equals y
 | x == y  = x   --since x and y must be equal it doesnt matter which one i give back meaning i could also write '| x == y  = y'
 | otherwise = x


maxOfList :: [Int] -> Int
maxOfList [] = 0
maxOfList (x:xs) --decomposition of the argument/list into a first element x and the remaining list xs
 | x > maxOfList xs = x
 | otherwise = maxOfList xs


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

pythagoras :: Floating a => a -> a -> a -- a is a form of Floating; (Floating is already a form )
pythagoras x y = sqrt (let square z = z * z in square x + square y) --'let' is used for local definition before usage of things described in let, in comparison to 'where' clauses, 'let' is an expression, so as every expression it can be used inside other expressions


--this language consists of functions only so get fkn used to it, there is no memory to save things