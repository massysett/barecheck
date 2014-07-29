module Data.Tree.Generators where

import Data.Tree
import Test.QuickCheck
import Control.Monad

tree
  :: (Int -> Int)
  -- ^ This function is applied to the size parameter.  It determines
  -- the length of the list in child forests, to prevent this function
  -- from generating trees that are infinitely large.  Here, supply a
  -- function that reduces the size parameter by some amount; using
  -- @(\`div\` 2)@ is typical, though if you want to restrict the size
  -- of trees produced even more you might try something like
  -- @(\`div\` 5)@.
  -> Gen a
  -- ^ Generates a root label.
  -> Gen (Tree a)
tree f g = liftM2 Node g (sized $ \s -> resize (f s) (listOf (tree f g)))

