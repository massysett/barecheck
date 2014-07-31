module Data.Time.Shrinkers where

import Data.Time
import Test.QuickCheck

day :: Day -> [Day]
day = fmap ModifiedJulianDay . shrinkIntegral . toModifiedJulianDay
