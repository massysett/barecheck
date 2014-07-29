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

tuple2 :: (a -> [a]) -> (b -> [b]) -> (a, b) -> [(a, b)]
tuple2 fa fb (a, b) =
     [ (a', b) | a' <- fa a ]
  ++ [ (a, b') | b' <- fb b ]

tuple3
  :: (a -> [a])
  -> (b -> [b])
  -> (c -> [c])
  -> (a, b, c)
  -> [(a, b, c)]
tuple3 fa fb fc (a, b, c) =
  [ (a', b', c') | (a', (b', c'))
    <- tuple2 fa (tuple2 fb fc) (a, (b, c)) ]

tuple4
  :: (a -> [a])
  -> (b -> [b])
  -> (c -> [c])
  -> (d -> [d])
  -> (a, b, c, d)
  -> [(a, b, c, d)]
tuple4 fa fb fc fd (a, b, c, d) =
  [ (a', b', c', d') | (a', (b', (c', d')))
    <- tuple2 fa (tuple2 fb (tuple2 fc fd)) (a, (b, (c, d))) ]

tuple5
  :: (a -> [a])
  -> (b -> [b])
  -> (c -> [c])
  -> (d -> [d])
  -> (e -> [e])
  -> (a, b, c, d, e)
  -> [(a, b, c, d, e)]
tuple5 fa fb fc fd fe (a, b, c, d, e) =
  [ (a', b', c', d', e') | (a', (b', (c', (d', e'))))
    <- tuple2 fa (tuple2 fb (tuple2 fc (tuple2 fd fe)))
                  (a, (b, (c, (d, e)))) ]


