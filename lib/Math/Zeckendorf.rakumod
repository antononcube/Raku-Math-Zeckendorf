unit class Math::Zeckendorf;

my $fibs := 1, 1, * + * ... *;

our sub zeckendorf(Int $num, :$numbers=False) is export {
    my $index=0;
    while $num >= $fibs[$index] {
        $index++;
    }
    $index--; 

    my $remainder = $num; 
    my @digits;
    my @numbers;

    while $index > 0 {
        my $number = $fibs[$index];

        if $remainder >= $number {
            @digits.push: 1;
            $remainder -= $number;
            @numbers.push: $number; 
        } else {
            @digits.push: 0;
        }
        $index--;
    }

    return @numbers if $numbers;
    return @digits;
}
