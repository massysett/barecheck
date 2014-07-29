module Data.Tree.Coarbitrary where

import Data.Tree
import Test.QuickCheck
import Prelude.Coarbitrary

tree
  :: (a -> Gen b -> Gen b)
  -> Tree a
  -> Gen b
  -> Gen b
tree f (Node a as) = f a . list (tree f) as
