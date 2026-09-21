return {
	cpp = {
		cursor = { 7, 4 }, -- Line 7, column 4 (empty line inside main)
		code = {
			"#include <bits/stdc++.h>",
			"using namespace std;",
			"",
			"int main(int argc, char **argv) {",
			"    ios::sync_with_stdio(false);",
			"    cin.tie(nullptr);",
			"",
			"    return 0;",
			"}",
		},
	},
	c = {
		cursor = { 5, 12 }, -- Inside printf("")
		code = {
			"#include <stdio.h>",
			"#include <stdlib.h>",
			"",
			"int main(int argc, char **argv) {",
			"    ",
			"    return 0;",
			"}",
		},
	},
	html = {
		cursor = { 8, 4 }, -- Inside body tags
		code = {
			"<!DOCTYPE html>",
			'<html lang="en">',
			"<head>",
			'    <meta charset="UTF-8">',
			"    <title>Document</title>",
			"</head>",
			"<body>",
			"    ",
			"</body>",
			"</html>",
		},
	},
	py = {
		cursor = { 2, 4 }, -- Right after main
		code = {
			"def main():",
			"    ",
			"if __name__ == '__main__':",
			"    main()",
		},
	},
}
