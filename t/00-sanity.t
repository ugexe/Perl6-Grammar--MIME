use v6;
use Test;
plan 3;


subtest {
    plan 1;

    use-ok 'Grammar::Rules::RFC4234',
        '4234: Augmented BNF for Syntax Specifications: ABNF';
}, 'ABNF Grammars';


subtest {
    plan 3;

    use-ok 'Grammar::Rules::RFC2045',
        '2045: MIME Part One: Format of Internet Message Bodies';
    use-ok 'Grammar::Rules::RFC2046',
        '2046: MIME Part Two: Media Types';
    use-ok 'Grammar::Rules::RFC5322',
        '5322: Internet Message Format';
}, 'MIME related RFC definitions';


use-ok 'Grammar::MIME';
