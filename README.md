# This library is not maintained

I wrote this library to eliminate the need to write orphan instances
when using QuickCheck.  However, I have reluctantly concluded that
orphan instances, though evil, are the lesser of other evils in this
situation.  Idiomatic QuickCheck code uses Arbitrary instances, and
trying to go without them introduces an enormous amount of
boilerplate.  QuickCheck is designed around the assumption that
interesting types will have Arbitrary instances, so some
features become very difficult to use without Arbitrary instances.
Examples include Test.QuickCheck.Function, as well as generation of
functions even if you aren't using Test.QuickCheck.Function.

I would never release a library with orphan instances, so another
reason I wrote this library was to facilitate reuse: I wouldn't post a
library with orphan QuickCheck instances, but I would post a library
with non-overloaded generators.  This allowed me to post libraries
that had reusable generators that other packages can use.  This turned
out to be a maintenance headache though.  It's simpler to just write
modules with the orphan instances, include them in the source code for
a library, and then cut and paste the orphan instances into downstream
libraries that want to use them.

Currently I simply write the orphan instances but I keep them in a
separate test executable so that they're not in the library, which
also avoids adding a QuickCheck dependency to the library (which was
another objective of Barecheck.)

If you want the rights to upload future Barecheck packages to Hackage,
let me know.  Alternatively, of course you can always fork it :)


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
