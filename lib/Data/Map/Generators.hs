module Data.Map.Generators where

import Prelude hiding (map)
import Test.QuickCheck
import qualified Data.Map as M

map :: Ord k => Gen [(k, a)] -> Gen (M.Map k a)
map = fmap M.fromList
