module Data.Time.Shrinkers where

import Data.Time
import Test.QuickCheck
import Prelude.Shrinkers

day :: Day -> [Day]
day = fmap ModifiedJulianDay . shrinkIntegral . toModifiedJulianDay

diffTime :: DiffTime -> [DiffTime]
diffTime _ = []

uTCTime :: UTCTime -> [UTCTime]
uTCTime (UTCTime a t) =
  [ UTCTime a' t' | (a', t') <- tuple2 day diffTime (a, t) ]
