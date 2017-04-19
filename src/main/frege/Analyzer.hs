import Data.Map.Lazy hiding (foldl', filter)
import qualified Data.Set as Set
import Prelude hiding (lookup)
import Data.Monoid(Alt(..))
import Data.Foldable
type ClassName = String

type Extends = Map ClassName ClassName
type Inheritance = Map ClassName [ClassName]

inheritance :: Extends -> Inheritance
inheritance extMap = result
    where
        result = fromList (extend <$> assocs extMap)
        extend (c, super) = (c, supers super)
        supers super = maybe [] (super :) (lookup super result)

type FirstCycle a = Alt Maybe (Set.Set a)

cycleChecks :: Inheritance -> Inheritance
cycleChecks map = fromList [(c, cs) | (c, cs) <- assocs map, not $ c `Set.member` withCycles]
    where
        withCycles = foldl' findCycles Set.empty (assocs map)
        findCycles cycles (c, supers)
            = if c `Set.member` cycles
                then cycles
                else cycles `Set.union` cycleCheck Set.empty (c:supers)
        cycleCheck _ [] = Set.empty
        cycleCheck visited (c:cs)
            = if Set.member c visited
                then visited
                else cycleCheck (Set.insert c visited) cs

main = do
    let extends = fromList [("a", "b"), ("b", "c"), ("c", "a"), ("d", "a"), ("e", "Any")]
    let is = inheritance extends
    let oks = cycleChecks is
    mapM_ print (keys oks)
