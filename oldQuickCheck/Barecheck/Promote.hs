-- | This module allows for the 'promote' function to be imported
-- correctly from different QuickCheck versions.  QuickCheck 2.6 used
-- Test.QuickCheck.Gen.promote; QuickCheck 2.7 uses
-- Test.QuickCheck.Gen.Unsafe.promote.

module Barecheck.Promote (promote) where

import Test.QuickCheck.Gen (promote)
