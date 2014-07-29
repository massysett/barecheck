# Barecheck

This library provides generators, shrinkers, and coarbitrary
QuickCheck implementations for several data types that are distributed
with GHC and in the Haskell Platform.

The library does not provide implementations through the QuickCheck
Arbitrary and CoArbitrary classes.  Instead, they are provided through
ordinary, non-overloaded functions.  This avoids problems with orphan
instances.

This library has no association with the QuickCheck library or its
authors or maintainers.  Any bugs are my fault and may be reported at

http://github.com/massysett/barecheck/issues

# License

This library is licensed through the BSD license; please see the
LICENSE file.

# Pull requests

I have implemented generators, shrinkers, and coarbitrary
implementations for things that I have found useful so far.  If you
have additional ones you would like included (and they are for types
that are in the Haskell Platform), please feel free to submit a pull
request:

http://github.com/massysett/barecheck
