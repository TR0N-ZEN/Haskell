module Main where

main::IO()
main = do
 putStrLn "count_lists.hs"

--program that counts the number of occurences of all natural numbers in a given list


countAppearances :: Int -> [Int] -> Int
countAppearances n [] = 0
countAppearances n (x:xs)
 | n == x = countAppearances n xs + 1
 | otherwise = countAppearances n xs

tillCounted :: (Int -> [Int] -> Int) -> [Int] -> [Int] -> Int -> [Int]
tillCounted f xs ys n
 | length xs == sum ys = reverse ys
 | otherwise = tillCounted f xs (f n xs :ys)  (n+1)

countNInList :: [Int] -> [Int]
countNInList xs = tillCounted countAppearances xs [] 0