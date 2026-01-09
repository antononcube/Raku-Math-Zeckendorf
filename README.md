NAME
====
+[![Actions Status](https://github.com/coke/math-zeckendorf/actions/workflows/test.yml/badge.svg)](https://github.com/coke/math-zeckendorf/actions)

Math::Zeckendorf

Given an `Int`, generate the Zeckendorf decomposition of that number.

SYNOPSIS
========

```raku
use Math::Zeckendorf;

say zeckendorf(72);
# OUTPUT: «[1 0 0 1 0 0 1]␤»

say zeckendorf(72, :numbers);
# OUTPUT: «[21 5 1]␤»
```

DESCRIPTION
===========

Inspired by the ["Base Fibonacci" Numberphile video](https://www.youtube.com/watch?v=S5FTe5KP2Cw&sttick=0).

See also [Zeckendorf's theorem](https://en.wikipedia.org/wiki/Zeckendorf%27s_theorem) on wikipedia.

AUTHOR
======

Will Coleda <will@coleda.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2026 Will Coleda

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
