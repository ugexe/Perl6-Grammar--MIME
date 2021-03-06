role Grammar::Rules::RFC4234 {
    token ALPHA  { <[ \x[41]..\x[5A] ]> || <[ \x[61]..\x[7A] ]> }
    token BIT    { 0 || 1                                       }
    token CHAR   { <[ \x[01]..\x[7F] ]>                         }
    token CR     { \x[0D]                                       }
    #token CRLF  { \x[0D]  \x[0A]                               }
    token CRLF   { \x[0D]? \x[0A]                               }
    token CTL    { <[ \x[00]..\x[1F] ]> || \x[7F]               }
    token DIGIT  { <[\x[30]..\x[39]]>                           }
    token DQUOTE { \x[22]                                       }
    token HEXDIG { <.DIGIT> || <[ a..f A..F ]>                  }
    token HTAB   { \x[09]                                       }
    token LF     { \x[0A]                                       }
    regex LWSP   { [ <.WSP> || <.CRLF> <.WSP> ]*                }
    token OCTET  { <[ \x[00]..\x[FF] ]>                         }
    token SP     { \x[20]                                       }
    token VCHAR  { <[ \x[21]..\x[7E] ]>                         }
    token WSP    { <.SP> || <.HTAB>                             }
}