unit class Math::Zeckendorf;

my $fibs := 1, 1, * + * ... *;

#| Given an array of binary digits, return the list of fibonacci numbers
sub get-numbers(@digits) {
    my @result;
    for @digits.kv -> $index, $value {
        next unless +$value;
        @result.push($fibs[@digits.elems - $index]);
    }
    @result
}

#| Zeckendorf representation of an integer.
our sub zeckendorf-representation(Int $num, :$numbers=False) is export {
    my $index=0;
    while $num >= $fibs[$index] {
        $index++;
    }
    $index--;

    my $remainder = $num;
    my @digits;

    while $index > 0 {
        my $number = $fibs[$index];

        if $remainder >= $number {
            @digits.push: 1;
            $remainder -= $number;
        } else {
            @digits.push: 0;
        }
        $index--;
    }

    return get-numbers(@digits) if $numbers;
    return @digits;
}

#| Synonym of &zeckendorf-representation.
our &zeckendorf is export = &zeckendorf-representation;

#| Dual Zeckendorf representation of an integer.
our sub dual-zeckendorf-representation(Int $num, :$numbers=False) is export {
    # compute the Zeckendorf representation as a string
    my $zeck = zeckendorf($num).join('');

    # convert any sequences of 100 to 011 (e.g. decompose a single 13 to 8 and 5)
    # do so repeatedly as each substitution may create new opportunities

    while $zeck.contains('100') {
        $zeck ~~ s/100/011/;
    }

    # Remove any leading 0s
    $zeck ~~ s/^0+//;

    my @digits = $zeck.comb;

    return get-numbers(@digits) if $numbers;
    return @digits;
}

#| Synonym of &dual-zeckendorf-representation.
our &dual-zeckendorf is export = &dual-zeckendorf-representation;
