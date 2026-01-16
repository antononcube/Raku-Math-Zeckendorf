# Zeckendorf representation

***Give the 0-1 list that indicates the unique nonconsecutive Fibonacci numbers that sum to the non-negative integer input***

----

## Documentation

### Usage

| `zeckendor-representation(n)` |
|---|   
| Gives the 0-1 list that indicates the unique nonconsecutive Fibonacci numbers that sum to the non-negative integer $n$.|

### Details & Options

- The Fibonacci numbers here are considered to be $1, 2, 3, 5, ...$, not $1, 1, 2, 3, 5, ...$; otherwise, the representation would not be unique.

----

## Setup

```raku
use Math::NumberTheory;
use Math::Zeckendorf;

use Graph;
use Graph::Classes;
use Graphviz::DOT::Chessboard;

use Math::SparseMatrix;
use Math::DistanceFunctions;

use Data::Translators;
```

---

## Examples

### Basic examples

The first number whose representation takes three summands is 12:

```raku
zeckendorf-representation(12)
```

This corresponds to $8 + 3 + 1$:

```raku
[2,4,6]».&fibonacci 
```

<div style="width: 50%; border-top: 1px solid gray; margin: 0 auto;"></div>

The first number whose representation takes four summands is $33$:

```raku
zeckendorf-representation(33)
```

```raku
my @z = zeckendorf-representation(33);
([0, |@z.reverse] >>*<< ((1 ... @z.elems + 1)».&fibonacci)).sum
```

### Neat examples

There are $F_k$ Zeckendorf representations of length $k$; for example, here are the $13$ representations of length $7$:

```raku, results=asis
#%html
zeckendorf-representation(21 ... 33)
andthen Math::SparseMatrix.new(dense-matrix => $_, row-names => (21...33), column-names => (^$_.head.elems).reverse)
andthen my $mat = $_;

[
    matrix => $mat.to-html(),
    plot => dot-matrix-plot($mat.dense-matrix, row-names => $mat.row-names, column-names => $mat.column-names, :5size):svg
]
andthen to-html-table($_)
```

(Using a sparse matrix object made the visualizations easier.)

<div style="width: 50%; border-top: 1px solid gray; margin: 0 auto;"></div>

Make a plot of circle chords that correspond to pairs of integers that have Fibonacci representations with Hamming distance $1$. The chords in slate blue correspond to pairs differences that are prime numbers.

```raku
my @mat = (1 ... 250)».&zeckendorf-representation;
my $max-digits = @mat.tail.elems;
@mat .= map({ [|(0 xx ($max-digits - $_.elems)), |$_] });
my @edges = (^@mat.elems X ^@mat.elems).map({ $_ => hamming-distance(|@mat[$_]) }).grep({ $_.value == 1 })».key;
@edges .= map({ $_.head.Str => $_.tail.Str });
my $g = Graph.new(@edges, vertex-coordinates => Graph::Cycle.new(@mat.elems).vertex-coordinates);
```

```raku, results=asis
#% html
my @highlight = @edges.grep({ is-prime($_.value.Int - $_.key.Int) });
my $chord-plot = $g.dot(
    highlight => {slateblue => @highlight},
    vertex-shape => 'point', 
    vertex-width => 0, 
    vertex-height => 0, 
    edge-thickness => 0.3, 
    :4size,
    engine => 'neato', 
):svg;

my $file-name = './img/chord-plot.svg';
spurt($file-name, $chord-plot);

"![]($file-name)";
```
