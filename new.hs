module Main where


sliceo :: String -> String -> String
sliceo x y = y

flippojoin :: String -> String -> String
flippojoin x y = y ++ x

getSum :: IO ()
getSum = do
	putStrLn "Enter two numbers to be added"
	a <- readLn 
	b <- readLn
	putStrLn (flippojoin a b)
	putStrLn (sliceo a b)
	putStrLn (sliceo b a)
	putStrLn (flippojoin (sliceo a b) (sliceo b a))

main :: IO ()
main = do
	let x = "4"
	putStrLn "Hello cunt."
	putStrLn x
	getSum
