{-# OPTIONS_GHC -Wno-deferred-type-errors #-}
module Main where
    
map' :: (Int -> Int) -> [Int] -> [Int] --map is a function taking a function (depicting from integers to integers) and an arry of integers. map returns an array of integers
map' f []            = []
map' f (x : xs)      = f x : map f xs

double :: Int -> Int
double x = x * 2

--let list = [1, 2, 3, 4]



------------------------------------------

foldr' :: (Int -> Int -> Int) -> Int -> [Int] -> Int
--foldr is a function with three arguments, which are: 
    --First a function (Int -> Int -> Int) which seemingly has two integer arguments and returns an integer
    --Second a an integer
    --Third a list
foldr' _ z []        = z
foldr' f z (x : xs)  = f x (foldr' f z xs)


--foldr' calculative-orperation neutral-element-of-calculative-orperation [...]
sumList :: [Int] -> Int
sumList = foldr' (+) 0 -- sumList is an underfed/partially applied verions of foldr'

prodList :: [Int] -> Int
prodList = foldr' (*) 1 -- <=> "prodList = foldr (*) 1" so prodList is an underfed version of foldr waiting for its third parameter, the list of Integers



------------------------------------------

filter' :: (Int -> Bool) -> [Int] -> [Int]
filter' _ []         = []
filter' p (x : xs)
    | p x               = x : filter' p xs --since the function p returns a bool it returns true or false causing this line to execute or not and consecutively letting the next line take action
    | otherwise         = filter' p xs

even' :: Int -> Bool
even' x = mod x 2 == 0



-----------------------------------------

compose :: (Int -> Int) -> (Int -> Int) -> Int -> Int
--compose is a function with three arguments:
    --First a function with one integer argument returning an integer 
    --Second and function exacly like the first
    --Third an integer
compose f g x = f (g x)
--a predefined writing style for composing functions is
--'(f . g) x'  since '(f . g) x' <=> 'f (g x)'

-----------------------------------------

--partcial application of functions
--means a function doesnt get enough parameters i.e. malnutritioned
quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x : xs) = quicksort (filter (x >) xs) ++ [x] ++ quicksort (filter (x <=) xs)
--here the functions (x >) and (x <=) passed to the filter functions are malnutritioned


-----------------------------------------

main :: [b]
main = do
    map' double [1, 2, 3, 4] --result should be [2, 4, 6, 8]
    sumList [1, 2, 3, 4] --result should be 10
    prodList [1, 2, 3, 4] --result should be 24
    filter' even' [1, 2, 3, 4]
    --anonymous/lambda functions
    \ n -> n * 2  --'\ n -> n * 2' <=> 'f :: Int -> Int; f n = n * 2' <=> (* 2)