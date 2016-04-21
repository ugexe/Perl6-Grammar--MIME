use Grammar::Rules::RFC2045;   # MIME Part One: Format of Internet Message Bodies
use Grammar::Rules::RFC2046;   # MIME Part Two: Media Types
use Grammar::Rules::RFC4234;   # Augmented BNF for Syntax Specifications: ABNF (alias some tokens for brevity)
use Grammar::Rules::RFC5322;   # Internet Message Format

grammar Grammar::MIME {
    also does Grammar::Rules::RFC4234;
    also does Grammar::Rules::RFC2045;
    also does Grammar::Rules::RFC2046;
    also does Grammar::Rules::RFC5322;

    token TOP { <message> }
}
