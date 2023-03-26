local ls  = require("luasnip")

return {
    ls.parser.parse_snippet("strf", 'String::from("$1")'),
    ls.parser.parse_snippet("lam",  '|$1| { $2 }'),
}
