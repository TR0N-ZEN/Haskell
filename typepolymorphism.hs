--typepolymorphism for functions

length' :: [Int] -> Int
length' []          = 0
length'' (_ : xs)   = 1 + length' xs

length'' :: [Bool] -> Int
length'' []         = 0
length'' (_ : xs)   = 1 + length'' xs

length :: [a] -> Int                        -- a is now a variable for a type,a so called type-variable
length []           = 0
length (_ : xs)     = 1 + length xs

append :: [a] -> [a] -> [a]
append [] ys        = ys
append (x : xs) ys  = x : append xs ys

zip :: [a] -> [b] -> [(a, b)]               -- a and b can be of different types
zip (x : xs) (y : ys)   = (x, y) : zip xs ys
zip _ _                 = []

map :: (a -> b) -> [a] -> [b]
map f []                = []
map f (x : xs)          = f x : map f xs

------------------------------------------------------

--typepolymorphism for algebraic data-structures

data Tree a = Nil | Node a (Tree a) (Tree a)
-- each instance of 'Tree' is either 'Nil' or a 'Node'.
-- 'Node' contians: value of type 'a'
--                  Tree with a held value of type 'a'
--                  Tree with a held value of type 'a'

height :: Tree a -> Int
height Nill             = 1
height (Node n t1 t2)   = 1 + max (height t1) (height t2)

max :: Int -> Int -> Int
max x y 
    | x <= y            = y
    | x > y             = x

collapse :: Tree a -> [a]
collapse Nil            = []
collapse (Node n t1 t2) = collapse t1 ++ [n] ++ collapse t2 -- '++' is the list concatenation orperator

----------------------------------------------------

-- type checking

f :: (t, Char) -> (t, [Char])


g :: (int, [u]) -> Int

h = g . f -- 'h' only works if 't' = Int and 'u' = [Char]

