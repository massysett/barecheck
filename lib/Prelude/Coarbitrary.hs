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

list
  :: (a -> Gen b -> Gen b)
  -> [a]
  -> Gen b
  -> Gen b
list f xs = case xs of
  [] -> varInt 0
  a:as -> varInt 1 . f a . list f as

tuple2
  :: (a -> Gen r -> Gen r)
  -> (b -> Gen r -> Gen r)
  -> (a, b)
  -> Gen r
  -> Gen r
tuple2 fa fb (a, b) = fa a . fb b

tuple3
  :: (a -> Gen r -> Gen r)
  -> (b -> Gen r -> Gen r)
  -> (c -> Gen r -> Gen r)
  -> (a, b, c)
  -> Gen r
  -> Gen r
tuple3 fa fb fc (a, b, c) = fa a . fb b . fc c

tuple4
  :: (a -> Gen r -> Gen r)
  -> (b -> Gen r -> Gen r)
  -> (c -> Gen r -> Gen r)
  -> (d -> Gen r -> Gen r)
  -> (a, b, c, d)
  -> Gen r
  -> Gen r
tuple4 fa fb fc fd (a, b, c, d) = fa a . fb b . fc c . fd d

tuple5
  :: (a -> Gen r -> Gen r)
  -> (b -> Gen r -> Gen r)
  -> (c -> Gen r -> Gen r)
  -> (d -> Gen r -> Gen r)
  -> (e -> Gen r -> Gen r)
  -> (a, b, c, d, e)
  -> Gen r
  -> Gen r
tuple5 fa fb fc fd fe (a, b, c, d, e) = fa a . fb b . fc c . fd d . fe e

