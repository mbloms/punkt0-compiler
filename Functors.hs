import Control.Applicative

data Kanske a = Keff | Najs a

instance Functor Kanske where
    fmap _ Keff = Keff
    fmap f (Najs a) = Najs (f a)

instance Applicative Kanske where
    pure = Najs

    Najs f <*> Najs a = Najs (f a)
    _ <*> _ = Keff

instance Alternative Kanske where
    empty = Keff

    Najs a <|> _ = Najs a
    _ <|> annat = annat

data Lista a = Tom | a :| Lista a
    deriving(Show)
infixr 3 :|

instance Functor Lista where
    fmap _ Tom = Tom
    fmap f (x:|xs) = f x :| fmap f xs

instance Monoid (Lista a) where
    mempty = Tom

    Tom `mappend` bs = bs
    (a :| as) `mappend` bs = a :| as `mappend` bs

instance Applicative Lista where
    pure x = x:|Tom

    (f:|fs) <*> xs = fmap f xs `mappend` (fs <*> xs)
    Tom <*> _ = Tom

instance Alternative Lista where
    empty = Tom

    lst@(_:|_) <|> _ = lst
    _ <|> lst = lst

instance Monad Lista where
    Tom >>= _ = Tom
    (x:|xs) >>= f = f x `mappend` (xs >>= f)

newtype Stream a = Stream (a,Stream a)
    deriving (Show)

instance Functor Stream where
    fmap f (Stream (a, rest)) = Stream (f a, fmap f rest)

instance Applicative Stream where
    pure x = Stream (x, pure x)

    (Stream (f, fs)) <*> (Stream (x, xs)) = Stream (f x, fs <*> xs)

interleave :: Stream a -> Stream a -> Stream a
interleave (Stream (a,as)) (Stream (b,bs)) = Stream (a,Stream (b,as `interleave` bs))


instance Monad Stream where
    xs >>= f = join (fmap f xs)
        where
            tail :: Stream a -> Stream a
            tail (Stream (a, as)) = as

            join :: Stream (Stream a) -> Stream a
            join (Stream (Stream(x, xs), yss)) = Stream (x, join (fmap tail yss))

-- main = do
--         x <- 2 :| 3 :| Tom

interate :: (a -> a) -> a -> Stream a
interate f x = Stream (x, interate f (f x))

list :: Lista Integer
list = 2 :| 3 :| Tom >>= \x ->
    x+1 :| x+2 :| Tom

readAndPrint :: IO ()
readAndPrint = getLine >>= pure >>= putStrLn

myStream :: Stream Integer
myStream = interate (+1) 0

main :: IO ()
main = print myStream
