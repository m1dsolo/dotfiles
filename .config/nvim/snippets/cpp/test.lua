local function copy_previous(args)
    -- return sn(nil, {i(1, args[1])})
    return sn(nil, {t(args[1])})
end

return {
	s({ trig = "read_vec", priority = 100000 }, {
		-- t("vector<"), i(1, "int"), t("> read_vec(int n) {"),
		t("vector<"), i(1), t("> read_vec(int n) {"),
		t({"", "    vector<"}), d(2, copy_previous, {1}), t("> v(n);"),
		t({"", "    for (int i = 0; i < n; i++)"}),
		t({"", '        cin >> v[i];'}),
		t({"", '    return v;'}),
		t({"", "}"}), i(3),
	}),
	s({ trig = "print_vec", priority = 100000 }, {
		t("void print_vec(vector<"), i(1), t("> &v) {"),
		t({"", "    for (auto &val : v)"}),
		t({"", '        cout << val << " ";'}),
		t({"", "    cout << endl;"}),
		t({"", "}"}), i(2),
	}),
}
