module Main where

map' :: (Int -> Int) -> [Int] -> [Int] --map is a function taking a function (depicting from integers to integers) and an arry of integers. map returns an array of integers
map' f []            = []
map' f (x : xs)      = f x : map f xs

double :: Int -> Int
double x = x * 2

------------------------------------------

foldr' :: (Int -> Int -> Int) -> Int -> [Int] -> Int
--foldr is a function with three arguments, which are: 
    --First a function (Int -> Int -> Int) which seemingly has two integer arguments and returns an integer
    --Second an integer
    --Third a list of integers
--and returns a single integer value
foldr' _ z []        = z
foldr' f z (x : xs)  = f x (foldr' f z xs)


--foldr' calculative-orperation neutral-element-of-calculative-orperation [...]
sumList :: [Int] -> Int
sumList = foldr' (+) 0 -- sumList is an underfed/partially applied verion of foldr'

prodList :: [Int] -> Int
prodList = foldr' (*) 1 -- <=> "prodList = foldr (*) 1" so prodList is an underfed version of foldr waiting for its third parameter, the list of Integers


------------------------------------------

filter' :: (Int -> Bool) -> [Int] -> [Int]
filter' _ []         = [] -- _ is a wildcard and matches any data of type (Int -> Bool)
filter' p (x : xs)
 | p x               = x : filter' p xs --since the function p returns a bool it returns True or False causing this line to execute or not and consecutively letting the next line take action if p x evaluats to False, p x can be considered a conition p on x if that is fullfilled the filter doesn't filter it out
 | otherwise         = filter' p xs

even' :: Int -> Bool
even' = even --even' is now an alias of even
--or
--even' x = mod x 2 == 0
--even' x = (mod x 2 == 0) more clearly

uneven :: Int -> Bool
uneven = odd
--uneven x = not (even x)

-----------------------------------------

compose :: (Int -> Int) -> (Int -> Int) -> Int -> Int
--compose is a function with three arguments:
 --First a function with one integer argument returning an integer 
 --Second and function exacly like the first
 --Third an integer
compose f g x = f (g x)
--a predefined writing style for composing functions is
--'(f . g) x'  while '(f . g) x' <=> 'f (g x)'

-----------------------------------------

--partcial application of functions
--means a function doesnt get enough parameters i.e. malnutritioned
quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x : xs) = quicksort (filter (x >) xs) ++ [x] ++ quicksort (filter (x <=) xs)
--here the functions (x >) and (x <=) passed to the filter functions are malnutritioned or you could say they are lambda functions


-----------------------------------------

main::IO()
main = do
 print(map' double [1, 2, 3, 4]) --result should be [2, 4, 6, 8]
 print(sumList [1, 2, 3, 4]) --result should be 10
 print(prodList [1, 2, 3, 4]) --result should be 24
 print(filter' even' [1, 2, 3, 4]) --result should be [2,4]
 --anonymous/lambda functions
 print((*2) 33)
 -- (*2)
 -- <=>
 -- (\ n -> n * 2)
 -- <=>
 -- f :: Int -> Int
 -- f n = n * 2'
 -- 
 -- thats why the following two lines return the same values
 print(map' (\x -> x * 2) [1, 2, 3, 4]) --result should be [2, 4, 6, 8]
 print(map' (*2) [1, 2, 3, 4]) --result should be [2, 4, 6, 8]