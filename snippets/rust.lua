local ls  = require("luasnip")

return {
    ls.parser.parse_snippet("strf", "String::from(\"$1\")"),

    -- Lambda with body
    ls.parser.parse_snippet("lam",  "|$1| { $2 }"),

    -- Lambda expression
    ls.parser.parse_snippet("lex", "|$1| $2"),
}
