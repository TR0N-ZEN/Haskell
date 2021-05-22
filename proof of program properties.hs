-- proof of program properties through induction
--(deutsch: 'sei' : english: 'let')

sumList :: [Int] -> Int
sumList []      = 0
sumList (x:xs)  = x + sumList xs

double :: [Int] -> [Int]
double []       = []
double (x:xs)   = (2 * x) : double xs

--what we want to proove / induction hypothesis:
sumList (double xs) = 2 * sumList xs


-- P(a): [Int]  -> {0,1} --P is a verfing function that checks if the hypthesis is true (1) or false (0) for a given term in this case a single argument a which is a list of integers
-- P(a): a     	-> sumList(double a) = 2 * (sumList a)

-- induction beginning: a = ys = [] 
    sumList (double ys) = 2 * (sumList ys)
<=> sumlist (double []) = 2 * (sumList [])
<=> sumList []          = 2 * 0
<=> 0                   = 0
-- P([]): []     -> 1
-- P([]) = 1
-- so sumList (double ys) = 2 * (sumList ys) is a true statement for a = ys = []

-- induction prerequesites:
-- let ys :: [Int]
-- let P(ys) = 1 => sumList (double ys) = 2 * (sumList ys) is true/valid --it is the goal to produce a term on one side of the equation to substitute it with the other in the following equation

-- induction step (proof that if P(ys) is valid P(ys') with ys' = y : ys so P(y:ys) is true)
-- it is sumList (double ys) = 2 * (sumList ys)
-- let ys' = y : ys with y :: Int
    sumList (double ys')            = 2 * (sumList ys') -- -> construct term containing ys so apply ys' = y : ys
<=> sumList (double (y : ys))       = 2 * (sumList ys') -- -> apply definition of inner function here it is double on the left side of equation 
<=> sumList ((2 * y) : double ys)  	= 2 * (sumList ya') -- -> apply definition of outer function here it is sumList on the left side of equation
<=> (2 * y) + sumList (double ys)  	= 2 * (sumList ys') -- -> apply induction prerequisite sumList (double ys) = 2 * (sumList ys) on the left side of the equation
<=> (2 * y) + 2 * sumList ys       	= 2 * (sumList ys') -- -> apply definition of outer function on left side of the equation here it is summation of two factor - so apply law of distribution
<=> 2 * (y + sumList ys)          	= 2 * (sumList ys') -- -> apply definition of sumList from right to left on the left side of equation
<=> 2 * (sumList ys')               = 2 * (sumList ys') -- terms are obviously equal so induction hypothesis is true
-- P(xs) = 1



----the same with algebraic datatypes

map :: (a -> a) -> [a] -> [a] -- function uses type polymorphism
map f []        = []
map f (x:xs)    = (f x) : (map f xs)

data Tree a =  Nil | Node a Tree a Tree a -- data of type 'Tree' can have to forms either 'Nil' or 'Node a Tree a Tree a'

mapTree :: (a -> a) -> Tree a -> Tree a
mapTree f Nil                       = Nil
mapTree f (Node value1 tree1 tree2) = Node (f value1) (mapTree f tree1) (mapTree f tree2)

collapse :: Tree a -> [a]
collapse Nil                      = []
collapse Node value1 tree1 tree2  = collapse tree1 ++ [value1] ++ collapse tree2 

--what we are trying to prove a.k.a. induction hypothesis:
collapse (mapTree (tree)) <=> map f (collapse (tree)) -- round brackets mean that what is in between them is an argument on which the fucntion standing before it will be applied e.g. a (x) means function a is applied on x

-- induction beginning: x' = Nil 
-- P(a): Tree   -> {0, 1}
-- P(x') :: x'     -> collapse (mapTree f (x')) = map f (collapse (x'))
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
