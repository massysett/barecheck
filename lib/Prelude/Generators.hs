module Prelude.Generators where

import Test.QuickCheck
import Prelude hiding (maybe, either)
import Test.QuickCheck.Gen.Unsafe
import Control.Monad

maybe :: Gen a -> Gen (Maybe a)
maybe g = frequency [(3, fmap Just g), (1, return Nothing)]

either :: Gen a -> Gen b -> Gen (Either a b)
either a b = oneof [ fmap Left a, fmap Right b ]

function1
  :: (a -> Gen b -> Gen b)
  -> Gen b
  -> Gen (a -> b)
function1 perturb gen = promote (`perturb` gen)

function2
  :: (a -> Gen r -> Gen r)
  -> (b -> Gen r -> Gen r)
  -> Gen r
  -> Gen (a -> b -> r)
function2 p1 p2 = fmap f . function1 p'
  where
    p' (a, b) = p1 a . p2 b
    f g = \a b -> g (a, b)

function3
  :: (a -> Gen r -> Gen r)
  -> (b -> Gen r -> Gen r)
  -> (c -> Gen r -> Gen r)
  -> Gen r
  -> Gen (a -> b -> c -> r)
function3 p1 p2 p3 = fmap f . function1 p'
  where
    p' (a, b, c) = p1 a . p2 b . p3 c
    f g = \a b c -> g (a, b, c)

function4
  :: (a -> Gen r -> Gen r)
  -> (b -> Gen r -> Gen r)
  -> (c -> Gen r -> Gen r)
  -> (d -> Gen r -> Gen r)
  -> Gen r
  -> Gen (a -> b -> c -> d -> r)
function4 p1 p2 p3 p4 = fmap f . function1 p'
  where
    p' (a, b, c, d) = p1 a . p2 b . p3 c . p4 d
    f g = \a b c d -> g (a, b, c, d)

function5
  :: (a -> Gen r -> Gen r)
  -> (b -> Gen r -> Gen r)
  -> (c -> Gen r -> Gen r)
  -> (d -> Gen r -> Gen r)
  -> (e -> Gen r -> Gen r)
  -> Gen r
  -> Gen (a -> b -> c -> d -> e -> r)
function5 p1 p2 p3 p4 p5 = fmap f . function1 p'
  where
    p' (a, b, c, d, e) = p1 a . p2 b . p3 c . p4 d . p5 e
    f g = \a b c d e -> g (a, b, c, d, e)


tuple2 :: Gen a -> Gen b -> Gen (a, b)
tuple2 a b = liftM2 (,) a b

tuple3 :: Gen a -> Gen b -> Gen c -> Gen (a, b, c)
tuple3 a b c = liftM3 (,,) a b c

tuple4 :: Gen a -> Gen b -> Gen c -> Gen d -> Gen (a, b, c, d)
tuple4 a b c d = liftM4 (,,,) a b c d

tuple5 :: Gen a -> Gen b -> Gen c -> Gen d -> Gen e -> Gen (a, b, c, d, e)
tuple5 a b c d e = liftM5 (,,,,) a b c d e
