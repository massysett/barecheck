module Data.Time.Coarbitrary where

import Data.Time
import Test.QuickCheck

day :: Day -> Gen b -> Gen b
day (ModifiedJulianDay i) = variant i

diffTime :: DiffTime -> Gen b -> Gen b
diffTime d = coarbitrary (toRational d)

uTCTime :: UTCTime -> Gen b -> Gen b
uTCTime (UTCTime d t) = day d . diffTime t
