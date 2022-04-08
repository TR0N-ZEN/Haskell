--tupel
--'type VARIABLENAME = (DATATYPE, ... DATATYPE)'
--e.g. 'type Triple = (Int,Int,Int)'
--e.g. 'type Triple = (Int,Char,Int)'

--list
--'[DATATYPE]'
--defines what (data)type of values the list holds, a list can only hold values of one datatype

--aliases
--'type VARIABLENAME = DATATYPE

--algebraic datatypes
--'data VARIABLENAME = VALUE | VALUE | ... VALUE'

--important keywords: 
--'data' for definition of algebraic data,
--'type' for definition of custom types via other datatypes which might be nested

module Main where

--tupel / custom type
type CustomType = (Float, Float) --tupel

functionOnCustomType::CustomType -> Float
functionOnCustomType (a,b) = a + b

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
isWorkingDay _          = True -- the underscore "_" is a wildcard meaning it matches everything


--recursive data constructor
data Expression = Literal Int | Add Expression Expression | Sub Expression Expression
--e.g. Add Sub Lit 9 Lit 3 Lit 4
--      or more clearly Add( Sub (Lit 9 Lit 3) Lit 4 )

eval :: Expression -> Int
eval (Literal n)        = n
eval (Add e1 e2)        = eval e1 + eval e2
eval (Sub e1 e2)        = eval e1 - eval e2

height :: Expression -> Int
height (Literal _)      = 1
height (Add e1 e2)      = 1 + max (height e1) (height e2)
height (Sub e1 e2)      = 1 + max (height e1) (height e2)