module Main where

--FUNCTIONNAME :: DATATYPE -> DATATYPE
--or
--FUNCTIONNAME :: DATATYPE -> DATATYPE -> DATATYPE
---and on and on 
--FUNCTIONNAME :: DATATYPE -> ... -> DATATYPE

main :: IO ()
main = do
    print "Sumsquares"
    getSumsquares
    print "Allequal"
    getAllequal
    print "GetMax"
    getMax


getSumsquares :: IO ()
getSumsquares = do
    putStrLn "Please enter two Integer values and press 'enter' after each" --"putStrLn" send data to the standart system output
    n <- readLn --"<- readLn" sends data enterd into the standard input into a variable which in this case is n
    print (sumSquares n) --"print ()" convertes data in the parentheses to string and sends the string to the standard system output

sumSquares :: Int -> Int
sumSquares 0 = 0
sumSquares i = i * i + sumSquares (i - 1)


getAllequal :: IO ()
getAllequal = do
    putStrLn "Please enter two Integer values and press 'enter' after each"
    a <- readLn
    b <- readLn
    c <- readLn
    print (allequal a b c)

allequal :: Int -> Int -> Int -> Bool
allequal x y z = (x == y) && (x == z)


getMax :: IO()
getMax = do
    putStrLn "Please enter two Integer values and press 'enter' after each"
    a <- readLn
    b <- readLn
    putStrLn (max a b)

max' :: Int -> Int -> Int
max' x y --following is case differentiation   
    | x < y  = y    --if x < y is true the value this function return is/equals y
    | x == y  = x   --since x and y must be equal it doesnt matter which one i give back meaning i could also write '| x == y  = y'
    | otherwise = x


getMaxSquare :: IO()
getMaxSquare = do 
    putStrLn "Please enter two Integer values and press 'enter' after each"
    a <- readLn
    b <- readLn
    print (maxSquare a b)

maxSquare :: Int -> Int -> Int
maxSquare n m
    | sqN > sqM = sqN
    | otherwise = sqM
    where                   --'where' is used for lokal definitions or you could say afterwards definitions since "sqN" and "sqM" are both values which are used before but haven't been defined so far 
        sqN = square n 
        sqM = square m 
        square :: Int -> Int
        square z = z * z

maxSquare' :: Int -> Int -> Int
maxSquare' n m = let square' :: Int -> Int -- 'let' is used for predefinition of functions for the with 'in' marked blocks; used again in pythagoras
                     square' z = z * z
                 in if square' n > square' m
                    then n
                    else m

getPythagoras :: IO()
getPythagoras = do
    putStrLn "Please enter two Integer values and press 'enter' after each"
    a <- readLn
    b <- readLn
    print (pythagoras a b)

pythagoras :: Floating a => a -> a -> a -- a is a form of Floating; (Floating is already a form )
pythagoras x y = sqrt (let square z = z * z in square x + square y) --'let' is used for local definition before usage of things described in let, in comparison to 'where' clauses, 'let' is an expression, so as every expression it can be used inside other expressions
