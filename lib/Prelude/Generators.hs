module Prelude.Generators where

import Test.QuickCheck
import Prelude hiding (maybe, either)

maybe :: Gen a -> Gen (Maybe a)
maybe g = frequency [(3, fmap Just g), (1, return Nothing)]

either :: Gen a -> Gen b -> Gen (Either a b)
either a b = oneof [ fmap Left a, fmap Right b ]
