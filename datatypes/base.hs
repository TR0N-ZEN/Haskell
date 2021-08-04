--int (integers) with the operations + - *  ^ div mod abs negate < > <= >= ==
--bool  (booleans) with the operations && || not
--char (character) and string (strings) with the operations ++ toEnum :: Int -> Char fromEnum :: Char -> Int
--float (floating point numbers) with the operations + - * / == /= < > <= >= abs sin cos ceiling floor round fromInt read show signum


module Main where

add :: Int -> Int -> Int
add x y = x + y

subtract :: Int -> Int -> Int
subtract x y = add x (-y)

multiply::Float -> Float -> Float
multiply x y = x * y

divide:: Float -> Float -> Float
divide x y = x / y

concatenate ::String -> String -> String
concatenate s1 s2 = s1 ++ " " ++ s2


main::IO()
main = do
 print(add 34 23)
 print(Main.subtract 34 23) -- 'main.subtract' means: use definition 'subtract' contained in module 'Main'
 print(multiply 34 23)
 print(divide 34 23)