# functions
in haskell get declared like
```haskell
f :: datatype -> datatype
```
Definitions can differ in many ways and in fact there is an endless amount of functions that can be defined  
so here some examples for the fundamental basics:

> **declaration**
> ```haskell
> f :: Int -> Int -> Int
>```
> This means *f* is a function taking two arguments/parameters both of type *Int* and returns a value of type *Int*.

> **pattern matching for arguments/parameters**
>```haskell
>swap :: (Int,Int) -> (Int,Int)
>swap (a,b) = (b,a)
>```
>The function *swap* takes one parameter of type *(Int,Int)* and returns a value of type *(Int,Int)*.  
>If the argument matches the pattern (a,b), the first entry of the tupel is bound to a and the second entry to b.  
>Now we can describe what should be done with the input using the variables a and b
>In this function *swap* we take a and set it as the second entry and take b to set it as first entry in the tupel which will be returned.  
>```haskell
>isEmpty :: [Int] -> Bool
>isEmpty [] = True
>isEmpty xs = False
>```
>*isEmpty* returns *True* if the argument is *[ ]* (the empty list) otherwise the third line with *isEmpty xs* will be matched and it's evaluation called so it returns *False*. This is somewhat of a case differentiation but there is another, better and more versatile way to do so.
>```haskell
>isEmpty' :: [Int] -> Bool
>isEmpty' list = case list of
> [] -> True
> xs -> False
>```
>Does the same as *isEmpty* just with the case differentiation on the right side.

> **case differentiation**
>```haskell
>max' :: Int -> Int -> Int
>max' x y
> | x < y = y -- means: if x is bigger than y  then return y
> | otherwise x -- else return x
>```
> **|** is used for case differentiation and is equivalent to the '*if*' and '*else*' statement logic of other programming languagues like *C*

> **recursion**
>```haskell
>maxOfList :: [Int] -> Int
> maxOfList [] = 0 --if maxOfList is called with an empty list as argument, the maxOfList will return 0
>maxOfList (x:xs) --decomposition of the argument/list into a first element x and the remaining list xs
> | x > maxOfList xs = x
> | otherwise maxOfList xs
>```

> **inline definitions**
>```haskell
>maxSquare :: Int -> Int -> Int
>maxSquare n m
> | sqN > sqM = sqN
> | otherwise = sqM
> where
>  sqN = square n
>  sqM = square m
>  square :: Int -> Int
>  square z = z * z
>```
> Keyword **where** used for local afterwards definitions. Thats why "sqN" and "sqM" are both values which are used before they have been defined.
>
>```haskell
>maxSquare' :: Int -> Int -> Int
>maxSquare' n m =
> let square' z = z * z in
>  if square' n > square' m
>   then n
>   else m
>```
>Keyword **let** is used for predefinition of functions for blocks of code preceeded by the keyword **in**.