map :: (Int -> Int) -> [Int] -> [Int]
map f []            = []
map f (x : xs)      = f x : map f xs

double :: Int -> Int
double x = x * 2

map double [1, 2, 3, 4] --result should be [2, 4, 6, 8]

------------------------------------------

foldr :: (Int -> Int -> Int) -> Int -> [Int] -> Int  
--foldr is a function with three arguments, which are: 
    --First a function (Int -> Int -> Int) which seemingly has two integer arguments and returns an integer
    --Second a an integer
    --Third a list
foldr _ z []        = z
foldr f z (x : xs)  = f x (foldr f z xs)

sumList :: [Int] -> Int
sumList xs          = foldr (+) 0 xs

prodList :: [Int] -> Int
sumList xs          = foldr (*) 1 xs

foldr sumList 0 [1, 2, 3, 4] --result should be 10
foldr prodList 1 [1, 2, 3, 4] --result should be 24

------------------------------------------

filter :: (Int -> Bool) -> [Int] -> [Int]
filter _ []         = []
filter p (x : xs)
    | p x               = x : filter p xs
    | otherwise         = filter p xs

even :: Int -> Bool
even x              = mod x 2 == 0

filter even [1, 2, 3, 4]

-----------------------------------------

compose :: (Int -> Int) -> (Int -> Int) -> Int -> Int
--compose is a function with three arguments:
    --First a function with one integer argument returning an integer 
    --Second and function exacly like the first
    --Third an integer
compose f g x = f (g x)
--a predefined writing style for composing functions is
--'(f . g) x'  since (f . g) x' <=> 'f (g x)'

-----------------------------------------

--partcial application of functions
quicksort :: [Int] -> [Int]
quicksort []        = []
quicksort (x : xs)  = quicksort (filter (x >) xs) ++ [x] ++ quicksort (filter (x <=) xs)


-----------------------------------------

--anonymous/lambda functions
\ n -> 2 * n 