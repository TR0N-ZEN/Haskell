module Main where

------------
--base types
------------

--int (integers) with the operations + - * div ^ mod abs negate < > <= >= ==

--bool (booleans) with the operations && || not 

--char (character) and string (strings) with the operations ++   toEnum :: Int -> Char   fromEnum :: Char -> Int

--float (floating point numbers) with the operations + - * /  == /= < > <= >= == abs sin cos ceiling floor round fromInt read show signum
 








 ---------------
 --compsit types
 ---------------
 

 --tupel 'type VARIABLENAME = (DATATYPE, ... DATATYPE)' e.g. 'type Triple = (Int, Int, Int) addThree :: Triple -> Int addThree :: (a, b, c) = a + b + c'
 type Triple = (Int, Int, Int)
 addThree :: Triple -> Int
 addThree :: (a, b, c) = a + b + c


--lists '[DATATYPE]' defines what (data)type of values the list holds, a list can only hold values of on (data)type e.g.
[1, 2, 3, 4] ::  [Int]
1 : [2, 3 , 4] :: [Int]
[True] :: [Bool]
[] :: [Int]
[[2, 3], [], [4]] :: [[Int]]

sumList :: [Int] -> Int 
sumList [] = 0
sumList (x : xs) = x + sumList xs --'[x1, x2 ,x3 ,x4] <=> x1 : [x2, x3, x4] <=> x1 : xs' because 'xs <=> [x2, x3, x4]' 

append :: [Int] -> [Int] -> [Int] --remeber this function takes two arguments which are lists of type with integer values
append []           ys = ys
append (x : xs)     ys = x : append xs ys


--functions e.g.
type Loc = Int -- i do not know if that what is written int tis line has to be done
type State = Loc -> Int

--algebraic datatypes 'data VARIABLENAME = VALUE | VALUE | ... VALUE'
data Season = Spring | Summer | Autumn | Winter
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday

isWorkingDay :: Day -> Bool
isWorkingDay Saturday   = False
isWorkingDay Sunday     = False
isWorkingDay _          = True

data Expression = Literal Int
    |Add Expression Expression
    |Sub Expression Expression

eval :: Expression -> Int
eval (Lit n)            = n
eval (Add e1 e2)        = eval e1 + eval e2
eval (Sub e1 e2)        = eval e1 - eval e2

height :: Expression -> Int
height (Lit _)          = 1
height (Add e1 e2)      = 1 + max (height e1) (height e2)
height (Sub e1 e2)      = 1 + max (height e1) (height e2)
