module Data.Tree.Shrinkers where

import Data.Tree
import Prelude.Shrinkers
import Test.QuickCheck

tree
  :: (a -> [a])
  -> Tree a
  -> [Tree a]
tree f (Node a as) = as ++
  [ Node n cs | (n, cs) <- tuple2 f (shrinkList (tree f)) (a, as) ]
