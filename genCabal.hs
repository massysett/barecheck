-- Generates the Cabal file using Cartel.
-- Written for Cartel version 0.10.0.2
-- Cartel is available at
-- http://github.com/massysett/cartel

module Main where

import qualified Cartel as A

versionInts :: [Int]
versionInts = [0,2,0,0]

version :: A.Version
version = A.Version versionInts

properties :: A.Properties
properties = A.empty
  { A.prName = "barecheck"
  , A.prVersion = version
  , A.prCabalVersion = (1,14)
  , A.prBuildType = A.Simple
  , A.prLicense = A.BSD3
  , A.prLicenseFile = "LICENSE"
  , A.prCopyright = "Copyright 2014 Omari Norman"
  , A.prAuthor = "Omari Norman, omari@smileystation.com"
  , A.prMaintainer = "Omari Norman, omari@smileystation.com"
  , A.prStability = "Experimental"
  , A.prHomepage = "http://github.com/massysett/barecheck"
  , A.prBugReports = "http://github.com/massysett/barecheck/issues"
  , A.prSynopsis = "QuickCheck implementations for common types"
  , A.prDescription =
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
  , A.prCategory = "Testing"
  , A.prTestedWith =
    let ghc ints = (A.GHC, A.eq ints)
    in map ghc [[7,4,1], [7,6,3], [7,8,3]]
  , A.prExtraSourceFiles =
    [ "minimum-versions.txt"
    , "current-versions.txt"
    , "genCabal.hs"
    , "sunlight-test.hs"
    ]
  }

repo :: A.Repository
repo = A.empty
  { A.repoVcs = A.Git
  , A.repoKind = A.Head
  , A.repoLocation = "http://github.com/massysett/barecheck.git"
  }

quickcheck :: A.Package
quickcheck = A.nextBreaking "QuickCheck" [2,7]

base :: A.Package
base = A.closedOpen "base" [4,5,0,0] [4,8,0,0]

text :: A.Package
text = A.closedOpen "text" [0,11,0,0] [1,2]

containers :: A.Package
containers = A.closedOpen "containers" [0,4,2,1] [0,6]

library
  :: [String]
  -- ^ Library modules
  -> A.Library
library ms = A.Library
  [ A.LibExposedModules ms
  , A.buildDepends
    [ quickcheck
    , base
    , text
    , containers
    ]
  , A.hsSourceDirs [ "lib" ]
  , A.ghcOptions [ "-Wall" ]
  , A.defaultLanguage A.Haskell2010
  ]

cabal
  :: [String]
  -- ^ Library modules
  -> A.Cabal
cabal ms = A.empty
  { A.cProperties = properties
  , A.cRepositories = [repo]
  , A.cLibrary = Just $ library ms
  }

main :: IO ()
main = do
  ms <- A.modules "lib"
  A.render "genCabal.hs" $ cabal ms
