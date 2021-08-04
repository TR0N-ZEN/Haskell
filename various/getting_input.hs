module Main where

getPythagoras :: IO()
getPythagoras = do
 putStrLn "Please enter two Integer values and press 'enter' after each" --writing to stdout
 a <- readLn --reading from stdin
 b <- readLn --reading from stdin
 print (pythagoras a b) --writing to stdout

pythagoras :: Floating a => a -> a -> a -- a is a form of Floating; (Floating is already a form )
pythagoras x y = sqrt (let square z = z * z in square x + square y) --'let' is used for local definition before usage of things described in let, in comparison to 'where' clauses, 'let' is an expression, so as every expression it can be used inside other expressions

main :: IO()
main = do
 putStrLn "getPythagoras"
 getPythagoras