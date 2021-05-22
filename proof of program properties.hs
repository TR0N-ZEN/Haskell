-- proof of program properties through induction
--(deutsch: 'sei' : english: 'let')

sumList :: [Int] -> Int
sumList []      = 0
sumList (x:xs)  = x + sumList xs

double :: [Int] -> [Int]
double []       = []
double (x:xs)   = (2 * x) : double xs

--what we want to proove a.k.a. induction hypothesis:
sumList (double xs) = 2 * sumList xs


-- P(a): [Int]  -> { 0, 1 } --P is a verfing function that checks if the hypthesis is true (1) or false (0) for a given term in this case a single argument a which is a list of integers
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

map :: (a -> a) -> [a] -> [a] -- function uses type polymorphism -- map takes as arguments a (a -> a) meaning  function depiciting from a to a and [a] meaning a list with elements of type a and returns [a] again meaning a list with elements of type a
map f []        = []
map f (x:xs)    = (f x) : (map f xs)

data Tree a =  Nil | Node a Tree a Tree a -- data of type 'Tree' can have to forms either 'Nil' or 'Node a Tree a Tree a'

mapTree :: (a -> a) -> Tree a -> Tree a -- since mapTree takes data of algebraic datatype Tree as an argument it needs to define behavior for all shapes of Tree which is two either 'Nil' or 'Node a Tree a Tree a'
mapTree f Nil                       					= Nil
mapTree f (Node value Tree tree1 Tree tree2) 	= Node (f value) Tree (mapTree f tree1) Tree (mapTree f tree2)

collapse :: Tree a -> [a]
collapse Nil                      					= []
collapse Node value Tree tree1 Tree tree2  	= collapse tree1 ++ [value] ++ collapse tree2

--what we are trying to prove a.k.a. induction hypothesis: let Tree::a
collapse (mapTree (f) (a)) <=> map f (collapse a) -- round brackets mean that what is in between them is an argument on which the fucntion standing before it will be applied e.g. a (x) means function a is applied on x

-- P(a): Tree   -> {0, 1}
-- P(a): a     	-> collapse (mapTree f (a)) = map f (collapse (a))

-- induction beginning: a = y = Nil
-- P(y): y 			-> collapse(mapTree f y) = map f (collapse y)
    collapse (mapTree (f) (y))       	= map f (collapse y) -- since f can only be applied to a and not [a] it doesn't need to be put in round bracktes on the right side of the equation
<=> collapse (mapTree (f) Nil)        = map f (collapse Nil) -- -> apply defintion of mapTree on left side of the equation and defintion of collpse on right side of equation
<=> collapse Nil                      = map f [] -- -> apply definition of of collapse on left side of the equation and definition of map on the right side of the equation
<=> []                                = []
-- P(y) = 1
-- P(Nil) = 1

--induction prerequisites:
-- P(y): y      -> collapse (mapTree f (y)) = map f (collapse (y))
-- P(y) = 1

--induction step: let T = Node T_value Tree t1 Tree t2
    collapse (mapTree f T)            	            = map f (collapse T) -- -> apply definition of T so T = Node T_value Tree t1 Tree t2

<=> 																				  			= map f (collapse (Node T_value Tree t1 Tree t2)) -- -> apply inner function here it is collapse on right side

<=>                                                 = map f (collapse t1 ++ [T_value] ++ collapse t2) -- -> apply definition of outer function map and not f since f can only be applied on data of type a and not of type [a] a list with elemnts of type a

<=>                                                 = map f (collapse t1) ++ map f [T_value] ++ map f (collapse t2) -- -> 

<=>                                                 = collapse (mapTree t1) ++ [f T_value] ++ collapse (mapTree t2) -- -> apply definition of outer function collapse from right to left on the left side of the equation
<=>                                                 = collapse (Node (f T_value) (mapTree t1) (mapTree t2))
<=>                                                 = collapse (mapTree f (Node T_value t1 t2))
