-- the maybe monad

type Person = String 

father :: Person -> Maybe Person
father "Lorenz" = Just "Karsten"
father "Gabriel" = Just "Karsten"
father "Theo" = Just "Wilfried"
father "Monika" = Just "Klaus"
father "Susanne" = Just "Klaus"
father "Regina" = Just "Siegfried"
father _ = Nothing

mother :: Person -> Maybe Person
mother "Lorenz" = Just "Monika"
mother "Gabriel" = Just "Monika"
mother "Alisa" = Just "Monika"
mother "Theo" = Just "Monika"
mother "Monika" = Just "Regina"
mother "Susanne" = Just "Regina"
mother "Regina" = Just "Gerda"
mother "Wilfried" = Just "Ilse"
mother _ = Nothing

grossmuttervs :: Person -> Maybe Person
grossmuttervs p = case father p of
 Nothing -> Nothing
 Just v -> mother v
 
urgrossmuttergvvs :: Person -> Maybe Person
urgrossmuttergvvs p = case father p of
 Nothing -> Nothing
 Just v -> case father v of
  Nothing -> Nothing
  Just gv -> mother gv


------------------------------------------------------------------------------

----
-- it follows the definition of functions of the so called 'maybe monad'
-- the notation with braces around the funtionname means the functionname is used in infix notation so between the operands
(>==) :: Maybe a -> (a -> Maybe b) -> Maybe b
Nothing >== f = Nothing
(Just w) >== f = f w

return :: a -> Maybe a

----

urgrossmuttervgvs' :: Person -> Maybe Person
urgrossmuttervgvs' p = return p >== father >== father >== mother -- left associative, so: (((return p) >== father) >== father) >== mother

-- (>==) is left associative, thats the reason why we dont have to write
-- urgrossmuttervgvs' p = (((return p) >== father) >== father) >== mother

-- return is defined in Prelude like so:
{-
 return :: a -> Maybe a
 return a = Just a
-}

eltern :: Person -> [Person]
eltern p = maybeToList (father p) ++ maybeToList (mother p)
 where
  maybeToList :: Maybe a -> [a]
  maybeToList Nothing = []
  maybeToList (Just p) = [p]

grosseltern :: Person -> [Person]
grosseltern p = case eltern p of
 [] -> []
 e -> elternVon e
 where
  elternVon :: [Person] -> [Person]
  elternVon [] = []
  elternVon (e:es) = eltern e ++ elternVon es

-- it follows a monad
(>===) :: [a] -> (a ->  [b]) -> [b]
[] >=== f = []
(x:xs) >=== f = f x ++ (xs >=== f)

grosseltern' :: Person -> [Person]
grosseltern' p = [p] >=== eltern >=== eltern

urgrosseltern :: Person -> [Person]
urgrosseltern p = [p] >=== eltern >=== eltern >=== eltern

{-

the monad in it's real abstract form

class Monad m where
 (>>=) :: m a -> (a -> m b) -> m b
 (>>) :: m a -> m b -> m b
 return :: a -> m a
 fail :: String -> m a

-}