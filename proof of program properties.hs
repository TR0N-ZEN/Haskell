-- proof through induction


sumList :: [Int] -> Int
sumList []      = 0
sumList (x:xs)  = x + sumList xs

double :: [Int] -> [Int]
double []       = []
double (x:xs)   = (2 * x) : double xs

--what we want to proove / induction hypothesis:
sumList (double xs) = 2 * sumList xs


-- induction beginning: xs = []
-- P(xs): [Int]  -> {0,1} 
-- P(xs): xs     -> sumList(double xs) = 2 * (sumList xs) 
    sumList (double xs) = 2 * (sumList xs)
<=> sumlist (double []) = 2 * (sumList [])
<=> sumList []          = 2 * 0
<=> 0                   = 0
-- P([]): []     -> 1
-- P([]) = 1
-- so sumList (double xs) = 2 * (sumList xs) is a true statement for xs = []

--induction prerequesites:
--be xs' :: [Int]
--be P(xs') = 1

--induction step
-- for xs = x : xs' and x :: Int
    sumList (double xs)             = 2 * (sumList xs')
<=> sumList (double (x : xs'))      = 2 * (sumList xs')
<=> sumList (2 * x) : double xs'    = 2 * (sumList xs')
<=> (2 * x) + sumList (double xs')  = 2 * (sumList xs')
<=> (2 * x) + 2 * sumList xs        = 2 * (sumList xs')
<=> 2 * (x + sumList xs)            = 2 * (sumList xs')
<=> 2 * (sumList xs')               = 2 * (sumList xs')
-- P(xs) = 1



----the same with algebraic datatypes

map :: (a -> a) -> [a] -> [a]
map f []        = []
map f (x:xs)    =  (f x) : (map f xs)

data Tree a =  Nil | Node a Tree a Tree a

mapTree :: (a -> a) -> Tree a -> Tree a
mapTree f Nil                       = Nil
mapTree f (Node value1 tree1 tree2) = Node (f value1) (mapTree f tree1) (mapTree f tree2)

collapse :: Tree a -> [a]
collapse Nil                      = []
collapse Node value1 tree1 tree2  = collapse tree1 ++ [value1] ++ collapse tree2 

--what we are trying to prove / induction hypothesis:
collapse (mapTree (tree)) <=> map f (collapse (tree))

-- induction beginning: x' = Nil 
-- P(x'): Tree   -> {0, 1}
-- P(x'): x'     -> collapse (mapTree f (x')) = map f (collapse (x'))
    collapse (mapTree f (tree a))       = map f (collapse (tree a))
<=> collapse (mapTree f (Nil))          = map f (collapse Nil)
<=> collapse Nil                        = map f []
<=> []                                  = []
-- P(Nil) = 1

--induction prerequisites:
-- P(x): x      -> collapse (mapTree f (x)) = map f (collapse (x))
-- P(x) = 1
-- 

--induction step
--
    collapse (mapTree f x)                          = map f (collapse x)
<=> collapse (mapTree f (Node value1 tree1 tree2))  = map f (collapse (Node value1 tree1 tree2))
<=>                                                 = map f (collapse tree1 ++ [value1] ++ collapse tree2)
<=>                                                 = map f (collapse tree1) ++ map f [value1] ++ map f (collapse tree2)
<=>                                                 = collapse (mapTree (tree1)) ++ [f value1] ++ collapse (mapTree (tree2)) --from the line before to this line the induction prerequisites have been used
<=>                                                 = collapse (Node (f value1) (mapTree tree1) (mapTree tree2))
<=>                                                 = collapse (mapTree f (Node value1 tree1 tree2))
