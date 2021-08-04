--tupel
--'type VARIABLENAME = (DATATYPE, ... DATATYPE)'
--e.g. 'type Triple = (Int,Int,Int)'

--list
--'[DATATYPE]'
--defines what (data)type of values the list holds, a list can only hold values of one datatype

--aliases
--'type VARIABLENAME = DATATYPE

--algebraic datatypes
--'data VARIABLENAME = VALUE | VALUE | ... VALUE'

--important keywords: 'data', 'type'

module Main where

--tupel / custom type
type Custom_type = (Float, Float) --tupel

function_on_custom_type::Custom_type -> Float
function_on_custom_type (a,b) = a + b

--list
list = [2,3,5] -- list of
list_2 = ["a","d","B"]
sumList::[Int] -> Int --function on list
sumList [] = 0
sumList (x:xs) = x + sumList xs --x is a variable for the first element in the list and xs for the rest of the list apart from the first element

--aliasses
type Loc = Int --Loc is euqal to Int which is the amount of integers
type State = Loc -> Int --State is the amount of functions taking values of the amount of Loc and depicts them into the amount of Int

--algebraic datatypes
data Season = Spring | Summer | Autumn | Winter
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday

isWorkingDay :: Day -> Bool
isWorkingDay Saturday   = False
isWorkingDay Sunday     = False
isWorkingDay _          = True -- the underscore "_" is a wildcard meaning it means everything at the same time

data Expression = Literal Int | Add Expression Expression | Sub Expression Expression --recursive data constructor
                --two places | three places and the first place holds Add | three places and the first place holds Sub

eval :: Expression -> Int
eval (Literal n)        = n
eval (Add e1 e2)        = eval e1 + eval e2
eval (Sub e1 e2)        = eval e1 - eval e2

height :: Expression -> Int
height (Literal _)      = 1
height (Add e1 e2)      = 1 + max (height e1) (height e2)
height (Sub e1 e2)      = 1 + max (height e1) (height e2)