return {
	s({
		trig = "rus",
		snippetType = "autosnippet",
		condition = function(line_to_cursor)
			return line_to_cursor:match("%s*")
		end,
	}, {
		t("const ["),
		i(1, "foo"),
		t(", "),
		f(function(args)
			return "set" .. args[1][1]:gsub("^%l", string.upper)
		end, { 1 }, {}),
		t("] = useState("),
		i(2, "val"),
		t(");"),
		i(0),
	}),
	s({
		trig = "cN",
		snippetType = "autosnippet",
	}, {
		t('className="'),
		i(0),
		t('"'),
	}),
	parse("ruc", "const $1 = React.useCallback(($2) => {\n$3\n}, [$4]);$0"),
	parse("rum", "const $1 = React.useMemo(() => $2, [$3]);$0"),
},
	nil
