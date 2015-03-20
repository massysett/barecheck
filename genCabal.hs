-- Generates the Cabal file using Cartel.
-- Written for Cartel version 0.14-series.
-- Cartel is available at
-- http://github.com/massysett/cartel

module Main where

import Cartel

versionInts :: [Word]
versionInts = [0,2,0,8]

properties :: Properties
properties = blank
  { name = "barecheck"
  , version = versionInts
  , cabalVersion = Just (1,14)
  , buildType = Just simple
  , license = Just bsd3
  , licenseFile = "LICENSE"
  , copyright = "Copyright 2014 Omari Norman"
  , author = "Omari Norman, omari@smileystation.com"
  , maintainer = "Omari Norman, omari@smileystation.com"
  , stability = "Experimental"
  , homepage = "http://github.com/massysett/barecheck"
  , bugReports = "http://github.com/massysett/barecheck/issues"
  , synopsis = "QuickCheck implementations for common types"
  , description =
    [ "Provides QuickCheck implementations for common types distributed"
    , "with GHC and in the Haskell Platform.  The implementations"
    , "are NOT provided through the QuickCheck Arbitrary and"
    , "CoArbitrary typeclasses; instead, they are provided through"
    , "ordinary, non-overloaded functions.  This avoids problems"
    , "with orphan instances."
    , ""
    , "Implementations are provided through child modules of the"
    , "module that provides the original type.  For example, for"
    , "\"Data.Map\", look under \"Data.Map.Generators\","
    , "\"Data.Map.Shrinkers\", and \"Data.Map.Coarbitrary\"."
    , "For instance, a function that generates a Map is at"
    , "\'Data.Map.Generators.map', while a function providing"
    , "a coarbitrary implementation is at \'Data.Map.Coarbitrary.map\'."
    , "Obviously this can lead to name conflicts, both between"
    , "modules provided in this package and with other standard"
    , "modules, so keep this in mind when you do your imports."
    ]
  , category = "Testing"
  , testedWith =
    let mkGhc ints = (ghc, eq ints)
    in map mkGhc [[7,6,3], [7,8,3]]
  , extraSourceFiles =
    [ "genCabal.hs"
    ]
  }

quickcheck :: Package
quickcheck = closedOpen "QuickCheck" [2,7] [2,9]

base :: Package
base = closedOpen "base" [4,5,0,0] [4,8,0,0]

text :: Package
text = closedOpen "text" [0,11,3,1] [1,3]

containers :: Package
containers = closedOpen "containers" [0,4,2,1] [0,6]

time :: Package
time = closedOpen "time" [1,4] [1,6]

main :: IO ()
main = defaultMain $ do
  libMods <- modules "lib"
  return
    ( properties
    , [ exposedModules libMods
      , buildDepends
          [ quickcheck
          , base
          , text
          , containers
          , time
          ]
      , ghcOptions ["-Wall"]
      , haskell2010
      , hsSourceDirs ["lib"]
      ]
    , [ githubHead "massysett" "barecheck"
      ]
    )
