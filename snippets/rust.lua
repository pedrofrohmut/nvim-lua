local ls  = require("luasnip")

return {
    ls.parser.parse_snippet("strf", 'String::from("$1")'),
}
