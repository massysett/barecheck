module Prelude.Coarbitrary where

import Test.QuickCheck
import Prelude hiding (maybe, either)
import Barecheck.Util

maybe :: (a -> Gen b -> Gen b) -> Maybe a -> Gen b -> Gen b
maybe f m = case m of
  Nothing -> varInt 0
  Just x -> varInt 1 . f x

either
  :: (a -> Gen c -> Gen c)
  -> (b -> Gen c -> Gen c)
  -> Either a b
  -> Gen c
  -> Gen c
either fa fb ei = case ei of
  Left a -> varInt 0 . fa a
  Right b -> varInt 1 . fb b
