module Main where

--FUNCTIONNAME :: DATATYPE -> DATATYPE
--or
--FUNCTIONNAME :: DATATYPE -> DATATYPE -> DATATYPE
---and on and on 
--FUNCTIONNAME :: DATATYPE -> ... -> DATATYPE

GetSumsquares :: IO ()
main = do
    putStrLn "Please enter two Integer values and press 'enter' after each"
    n <- readLn
    print (Sumsquares n)
   
Sumsquares :: Int -> Int
Sumsquares 0 = 0
Sumsquares i = i * i + sumSquares (i - 1)
 

GetAllequal :: IO()
GetAllequal = do
    putStrLn "Please enter two Integer values and press 'enter' after each"
    a <- readLn
    b <- readLn
    c <- readLn
    print (Allequal a b c)

Allequal :: Int -> Int -> Int -> Bool
Allequal x y z = (x == y) && (x == z)


GetMax :: IO()
GetMax = do
    putStrLn "Please enter two Integer values and press 'enter' after each"
    a <- readLn
    b <- readLn
    print (max a b)

Max :: Int -> Int -> Int
Max x y --following is case differentiation   
    | x < y  = y    --if x < y is true the value this function return is/equals y
    | x == y  = x   --since x and y must be equal it doesnt matter which one i give back meaning i could also write '| x == y  = y'
    | otherwise = x


GetMaxSquare :: IO()
GetMaxSquare = do 
    putStrLn "Please enter two Integer values and press 'enter' after each"
    a <- readLn
    b <- readLn
    print (MaxSquare a b)

MaxSquare n m
    | sqN > sqM = sqN
    | otherwise = sqM
    where                   --'where' is used for lokal definitions
        sqN = square n 
        sqM = square m 
        square :: Int -> Int
        square z = z * z

GetPythagoras :: IO()
GetPythagoras = do
    putStrLn "Please enter two Integer values and press 'enter' after each"
    a <- readLn
    b <- readLn
    print (Pythagoras a b)

Pythagoras x y = sqrt (let square z = z * z in square x + square y) --'let' is used for local definition, in comparison to where clauses 'where' 'let' is an expression, so as every expression it can be used inside other expressions
