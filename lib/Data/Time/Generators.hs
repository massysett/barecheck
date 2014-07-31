module Data.Time.Generators where

import Test.QuickCheck
import Data.Time

day :: Gen Day
day = fmap ModifiedJulianDay arbitrarySizedIntegral
