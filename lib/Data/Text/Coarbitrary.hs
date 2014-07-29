module Data.Text.Coarbitrary where

import Test.QuickCheck
import Data.Text (Text)
import qualified Data.Text as X

text :: Text -> Gen b -> Gen b
text t = case X.uncons t of
  Nothing -> variant (0 :: Int)
  Just (x, xs) -> variant (1 :: Int) . coarbitrary x . text xs
