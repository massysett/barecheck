module Data.Time.Generators where

import Test.QuickCheck
import Data.Time
import Control.Monad

day :: Gen Day
day = fmap ModifiedJulianDay arbitrarySizedIntegral

diffTime :: Gen DiffTime
diffTime = fmap (picosecondsToDiffTime . abs) arbitrary

uTCTime :: Gen UTCTime
uTCTime = liftM2 UTCTime day diffTime
