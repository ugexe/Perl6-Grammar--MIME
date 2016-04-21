role Grammar::Rules::RFC2045 {
    token attribute      { <.token> }
    token composite-type { 'message' || 'multipart' || 'extension-token' }
    token content        { 'Content-Type:' <type> '/' <subtype> [<.OWS> ';' <.OWS> <parameter>]* }
    token description    { 'Content-Description:' <.text>* }
    token discrete-type  { 
        || < text image audio video application >
        || <extension-token>
    }
    token encoding { 'Content-Transfer-Encoding:' <mechanism> }
    token entity-headers {
        [ <content>      <.CRLF> ]?
        [ <encoding>     <.CRLF> ]?
        [ <id>           <.CRLF> ]?
        [ <description>  <.CRLF> ]?
        [ <MIME-extension-field> <.CRLF> ]*
    }
    token extension-token { <ietf-token> || <x-token> }
    token hex-octet { '=' 2 [<.DIGIT> || < A B C D E F >] }
    token iana-token { <.token> } # TODO
    token ietf-token { <.token> } # TODO
    token id { 'Content-ID:' <.msg-id> }
    token mechanism {
        || < 7bit 8bit binary quoted-printable base64 >
        || <etf-token>
        || <x-token>
    }

    token MIME-extension-field { $<field>=['Content-' <.field-name>] ':' $<value>=<.unstructured> <.CRLF> }
    token MIME-message-headers { 
        || [<entity-headers> <fields> <version> <.CRLF>]
        || [<entity-headers> <version> <fields> <.CRLF>]
        || [<version> <fields> <entity-headers> <.CRLF>]
        || [<version> <entity-headers> <fields> <.CRLF>]
        || [<fields> <version> <entity-headers> <.CRLF>]
        || [<fields> <entity-headers> <version> <.CRLF>]
    }

    token MIME-part-headers { <entity-headers> <fields>? }

    token parameter     { <attribute> '=' <value>      }
    token ptext         { <.hex-octet> || <.safe-char> }
    token qp-part       { <qp-section>                 } # Maximum length of 76 characters
    token qp-line       {
        [<qp-segment> <transport-padding> <.CRLF>]*
        <qp-part>
        <transport-padding>
    }
    token qp-section    {
        [
            [ <.ptext> || <.SP> || <.HTAB> ]* 
            <.ptext>
        ]?
    }
 
    token qp-segment        { <qp-section> [<.SP> || <.HTAB>]* '=' } # Maximum length of 76 characters
    token quoted-printable  { <qp-line> [<.CRLF> <qp-line>]*       }

    token safe-char { <[\c[33]..\c[60]\c[62]..\c[126]]>   }
    token subtype   { <.extension-token> || <.iana-token> }

    token transport-padding { <.LWSP-char>* }

    token tspecials { [< ( ) @ , ; : \ " / [ ] ? = > || '<' || '>'] } #"#
    token type      { <discrete-type> || <composite-type> }
    token value     { <.token> || <.quoted-string> }
    token version   { 'MIME-Version:' <.DIGIT> '.' <.DIGIT> }
    token x-token   { [:i 'x-'] <.token> }
}