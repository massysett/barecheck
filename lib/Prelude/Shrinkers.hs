module Prelude.Shrinkers where

import Prelude hiding (maybe, either)

maybe :: (a -> [a]) -> Maybe a -> [Maybe a]
maybe f m = case m of
  Nothing -> []
  Just x -> Nothing : map Just (f x)

either :: (a -> [a]) -> (b -> [b]) -> Either a b -> [Either a b]
either fa fb ei = case ei of
  Left a -> map Left (fa a)
  Right b -> map Right (fb b)
