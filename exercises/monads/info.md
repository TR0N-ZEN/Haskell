The monad is a class 

```
class Monad m where
 (>>=) :: m a -> (a -> m b) -> m b
 (>>) :: m a -> m b -> m b
 return :: a -> m a
 fail :: String -> m a
```

-- ob das stimmt?