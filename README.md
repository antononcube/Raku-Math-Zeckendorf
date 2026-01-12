NAME
====
Math::Zeckendorf

Given an `Int`, generate the Zeckendorf decomposition of that number,
I<or> the Dual Zeckendorf decomposition.

SYNOPSIS
========
[![Actions Status](https://github.com/coke/math-zeckendorf/actions/workflows/test.yml/badge.svg)](https://github.com/coke/math-zeckendorf/actions)

```raku
use Math::Zeckendorf;

say zeckendorf(27);
# OUTPUT: «[1 0 0 1 0 0 1]␤»

say zeckendorf(27, :numbers);
# OUTPUT: «[21 5 1]␤»

say dual-zeckendorf(27);
# OUTPUT: «[1 1 0 1 1 1]␤»

say dual-zeckendorf(27, :numbers);
# OUTPUT: «[13 8 3 2 1]␤»
```

DESCRIPTION
===========

Inspired by the ["Base Fibonacci" Numberphile video](https://www.youtube.com/watch?v=S5FTe5KP2Cw&sttick=0).

The binary digits returned from `zeckendorf` do not include any sequential fibonacci numbers.
See https://oeis.org/A014417.

Conversely, the binary digits returned from `dual-zeckendorf` do not contain any gaps of fibonacci numbers
greater than size 1.
See https://oeis.org/A104326

See also [Zeckendorf's theorem](https://en.wikipedia.org/wiki/Zeckendorf%27s_theorem) on wikipedia.

AUTHOR
======

Will Coleda <will@coleda.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2026 Will Coleda

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
