module Lexer where
import Control.Applicative
import Control.Arrow (second)
import Data.Char(isLower, isUpper, isDigit, isAlpha, isAlphaNum)
import Data.Monoid

newtype Edges token = Edges [(Char -> Bool, Lexer (Char -> token))]
data State token = NonTerminal | Ignore | Terminal token
data Lexer token = Lexer (State token) (Edges token)

instance Functor State where
    fmap _ NonTerminal = NonTerminal
    fmap _ Ignore = Ignore
    fmap f (Terminal token) = Terminal (f token)

instance Applicative State where
    pure = Terminal

    Terminal f <*> Terminal a = Terminal (f a)
    _ <*> _ = NonTerminal

instance Alternative State where
    empty = NonTerminal

    Terminal a <|> _ = Terminal a
    _ <|> Terminal a = Terminal a
    Ignore <|> _ = Ignore
    _ <|> Ignore = Ignore
    _ <|> _ = NonTerminal

instance Functor Edges where
    fmap f (Edges edges) = Edges $ map (second (fmap (f.))) edges

instance Monoid (Edges a) where
    mempty = Edges []

    (Edges as) `mappend` (Edges bs) = Edges (as <> bs)

instance Functor Lexer where
    fmap f (Lexer state edges) = Lexer (fmap f state) (fmap f edges)

applyToEdges :: Edges (a -> b) -> Lexer a -> Edges b
applyToEdges (Edges edges) xs = Edges $ map (second (\next -> fmap flip next <*> xs)) edges

instance Applicative Lexer where
    pure token = Lexer (pure token) (Edges [])

    Lexer NonTerminal edges <*> xs =
        Lexer NonTerminal (applyToEdges edges xs)
    Lexer Ignore edges <*> xs =
        Lexer Ignore (applyToEdges edges xs)
    --Map all functions from fs onto all values from xs
    Lexer (Terminal f) fedges <*> xs@(Lexer xstate xedges) =
        Lexer (pure f <*> xstate) (fmap f xedges <> applyToEdges fedges xs)

instance Alternative Lexer where
    empty = Lexer NonTerminal (Edges [])

    Lexer state edges <|> Lexer state' edges' =
        Lexer (state <|> state') (edges <> edges')

satisfy :: (Char -> Bool) -> Lexer Char
satisfy predicate = Lexer NonTerminal (Edges [(predicate, pure id)])

char :: Char -> Lexer Char
char c = satisfy (==c)

string :: String -> Lexer String
string "" = pure ""
string (c:cs) = fmap (:) (char c) <*> string cs

pair :: Lexer a -> Lexer b -> Lexer (a,b)
pair a b = fmap (,) a <*> b

pairWith :: (a -> b -> c) -> Lexer a -> Lexer b -> Lexer c
pairWith f a b = fmap f a <*> b

data Token = If
    | Else
    | While
    | LeftParen
    | Identifier String
    | Number Integer

leftParen :: Lexer Token
leftParen = char '(' *> pure LeftParen

digit :: Lexer Char
digit = satisfy isDigit

upper :: Lexer Char
upper = satisfy isUpper

lower :: Lexer Char
lower = satisfy isLower

letter :: Lexer Char
letter = satisfy isAlpha

alphanumeric :: Lexer Char
alphanumeric = satisfy isAlphaNum

identifier :: Lexer Token
identifier = fmap Identifier $ fmap (:) letter <*> many alphanumeric

