module Data.Map.Shrinkers where

import Prelude hiding (map)
import Test.QuickCheck.Arbitrary (shrinkList)
import qualified Data.Map as M

map :: Ord k => ((k, a) -> [(k, a)]) -> M.Map k a -> [M.Map k a]
map s = fmap M.fromList . shrinkList s . M.toList
