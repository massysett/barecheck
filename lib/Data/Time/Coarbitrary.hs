module Data.Time.Coarbitrary where

import Data.Time
import Test.QuickCheck

day :: Day -> Gen b -> Gen b
day (ModifiedJulianDay i) = variant i
