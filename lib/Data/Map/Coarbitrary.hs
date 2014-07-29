module Data.Map.Coarbitrary where

import Prelude hiding (map)
import qualified Data.Map as M
import Test.QuickCheck

map
  :: Ord k
  => ((k, a) -> Gen r -> Gen r)
  -> M.Map k a
  -> Gen r
  -> Gen r
map f m = go $ M.toList m
  where
    go ls = case ls of
      [] -> variant (0 :: Int)
      x:xs -> variant (1 :: Int) . f x . go xs
