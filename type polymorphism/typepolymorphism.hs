--typepolymorphism for functions (I mean for what else there is no standalone data)

length' :: [Int] -> Int
length' []         = 0
length' (_ : xs)   = 1 + length' xs

length'' :: [Bool] -> Int
length'' []         = 0
length'' (_ : xs)   = 1 + length'' xs

length''' :: [a] -> Int                        -- a is now a variable for a type, a so called type-variable, length''' can orperate on Lists of any (basic not sure about that, mybe it works on composite too) datatype
length''' []           = 0
length''' (_ : xs)     = 1 + length''' xs

append :: [a] -> [a] -> [a]
append [] ys        = ys
append (x : xs) ys  = x : append xs ys

zip' :: [a] -> [b] -> [(a, b)]               -- a and b can be of different types
zip' (x : xs) (y : ys)   = (x, y) : zip' xs ys
zip' _ _                 = []

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (x : xs) = f x : map' f xs

------------------------------------------------------

--typepolymorphism for algebraic data-structures

data Tree a = Nil | Node a (Tree a) (Tree a)
-- each instance of 'Tree' is either 'Nil' or a 'Node'.
-- 'Node' contians: value of type 'a'
--                  Tree with a held value of type 'a'
--                  Tree with a held value of type 'a'

height :: Tree a -> Int
height Nil = 1
height (Node n t1 t2) = 1 + max (height t1) (height t2)

-- max :: Int -> Int -> Int
-- max x y 
--   | x <= y       = y
--   | x > y        = x

collapse :: Tree a -> [a]
collapse Nil = []
collapse (Node n t1 t2) = collapse t1 ++ [n] ++ collapse t2 -- '++' is the list concatenation orperator for list also as it seems

----------------------------------------------------

-- type checking

f :: (t, Char) -> (t, [Char])
f (x, y) = (x, [y, y])


g :: (Int, [u]) -> Int
g (x , []) = 0
g (x, ys) = x

h :: (Int, Char) -> Int
h = g . f   -- 'h' only works if 't' = Int and 'u' = [Char] since f is executed first and if it returns (Int, [Char]) so this is h's return type
            --then g can operate on that data since it takes Int as the datatype that g awaits in in it's input tupels first position
