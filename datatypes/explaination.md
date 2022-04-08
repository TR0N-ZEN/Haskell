# basic datatypes

## booleans
```haskell
	True
	False
```
with their opertions of the bolean algebra  
**&&** for *and*,  
**||** for *or*,  
**not** for *not*.
```haskell
	True && False
	False || True
```
Boolean values are the result of any operation on other types with the operational signs **==**, **<**, **>**, **<=** and **>=**

---
## numbers
### integers
```haskell
	1
	33
```
with their operations **+**, **-**, __*__,  __^__, **div**, **mod**, **abs**, **negate**, **<**, **>**, **<=**, **>=** and **==**
 ```haskell
	1 + 5
	33 * (-2)
	33^2
	div 33 5
	abs (-3)
	...
```
### floats
 ```haskell
	1.23 + 5
	33.31 * (-2)
	...
```
**+ - * / == /= < > <= >= abs sin cos ceiling floor round fromInt read show signum**

---

## characters
```haskell
"A"
"v"
"z"
```

## strings
```haskell
"Abcd"
"vertex"
"zebra"
```
with operations **++** and **fromEnum**:Char -> Int
>```haskell
>"A" ++ "D"
>"v" ++ "ertex"
>"ze" ++ "tta"
>``` 

---


# composit datatypes

## arrays
hold data of the same type, so there can be an array of integers
```haskell
[2,3,5]
```
or of characters
```haskell
["a","d","B"]
```
or any other arbitrary type.

---

## algebraic datatypes
which are built by using the keyword **data** at the beginning
```haskell
data typename = value_1 | value_2 | ... value_n
```
for example
>```haskell
>data Season = Spring | Summer | Autumn | Winter
>data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
>```
>```haskell
>data Expression = Literal Int | Add Expression Expression | Sub Expression Expression --recursive data constructor
>```
> The last example has a recursive definition and this definition has at max a binary constructor and so could be represented in a binary tree.  
> For example the code
> ```haskell
> Add Add Literal 3 Literal 2 3
>```
>represents a valid term of the composit datatype Expression which might be more obvious if written with braces:
>```haskell
> Add( Add( (Literal 3) (Literal 2)) 3)
>```
> or even represented as a tree  
>![tree](.\1.jpg)
>  
>possible operations on these types can be defined by functions e.g.
>```haskell
>eval :: Expression -> Int
>eval (Literal n)        = n
>eval (Add e1 e2)        = eval e1 + eval e2
>eval (Sub e1 e2)        = eval e1 - eval e2
>
>height :: Expression -> Int
>height (Literal _)      = 1
>height (Add e1 e2)      = 1 + max (height e1) (height e2)
>height (Sub e1 e2)      = 1 + max (height e1) (height e2)
>```

---
## tupel
hold data of arbitrarily different types in one instance
```haskell
(3.2, "a", 33, "AzH")
```
---
## custom datatypes
define kinds of tuples which hold a fixed number of elements with defined datatypes
```haskell
type Ct = (Float, Char, Int, Expression)
```
> so
>```haskell
> (5.9, "W", 99, (Add Lit 4 Lit 3))
>```
> is avalid term of type *Ct*