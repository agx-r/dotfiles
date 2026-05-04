export def upl [
	file?: any
] {
	let target = if ($file | is-empty) { $in } else { $file }
	if ($target | is-empty) {
		return "nothing to upload"
	}
	let data_type = ($target | describe)
	let link = if ($data_type | str starts-with "string") or ($data_type | str starts-with "path") {
		let expanded = (try { $target | path expand } catch { "" })

		if ($expanded != "" and ($expanded | path exists)) {
			^curl -F $"files[]=@($expanded)" "https://uguu.se/upload?output=text"
		} else {
			$target | ^curl -F "files[]=@-;filename=text.txt" "https://uguu.se/upload?output=text"
		}
	} else if ($data_type | str starts-with "binary") {
		$target | ^curl -F "files[]=@-;filename=data.bin" "https://uguu.se/upload?output=text"
	} else {
		$target | to json | ^curl -F "files[]=@-;filename=data.json" "https://uguu.se/upload?output=text"
	}

	let clean = ($link | str trim)
	if (which wl-copy | is-not-empty) { $clean | wl-copy }
	$clean
}
