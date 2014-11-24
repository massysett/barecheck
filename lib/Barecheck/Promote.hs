-- | This module allows for the 'promote' function to be imported
-- correctly from different QuickCheck versions.  QuickCheck 2.6 used
-- Test.QuickCheck.Gen.promote; QuickCheck 2.7 uses
-- Test.QuickCheck.Gen.Unsafe.promote.  For use with old versions of
-- QuickCheck, Cabal will import a different version of this module
-- from the oldQuickCheck directory.

module Barecheck.Promote (promote) where

import Test.QuickCheck.Gen.Unsafe (promote)
