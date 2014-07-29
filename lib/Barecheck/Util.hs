module Barecheck.Util where

import Test.QuickCheck

-- | 'variant' monomorphised to 'Int'; eliminates type defaulting
-- compiler warnings.
varInt :: Int -> Gen b -> Gen b
varInt = variant
