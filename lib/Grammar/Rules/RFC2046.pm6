role Grammar::Rules::RFC2046 {
    token boundry { <.bchars> 0**69 <.bcharnospace> }
    token bchars  { <.bcharsnospace> | ' ' }
    token bcharsnospace { <.DIGIT> || <.ALPHA> || < ( ) { } + _ , - . / : = ? ' > } #'

    # need to handle dash boundry and no delimiter in body
    token body-part       { <MIME-part-headers> [<.CRLF> <.OCTET>*]? }
    token close-delimiter { <delimiter> '--' }
    token dash-boundry    { '--' <boundry>   } # boundry in Content-Type

    token delimiter       { <.CRLF> <dash-boundry> }
    token discard-text    { [<.text>* <.CRLF>]* <.text>* }
    token encapsulation   { <delimiter> <transport-padding> <.CRLF> <body-part> }
    token epilogue        { <.discard-text> }
    token preamble        { <.discard-text> }
    token multipart-body  {
        [<preamble> <.CRLF>]?
        $<splitter>=['--' <boundry>]
        <transport-padding> <.CRLF>

        <body-part> <encapsulation>*

        [<.CRLF> $<splitter> '--']
        <transport-padding>
        [<.CRLF> <epilogue>]?
    }
    my token transport-padding { <.LWSP-char>* }
}