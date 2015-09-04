BEGIN {
	cd = "[0-9]*-environment-cd"
	srcbase = ""
	dstbase = "/embox"
}

{
	if ($1 ~ cd) {
		srcbase = $2
	}

	if (srcbase) {
		gsub(srcbase, dstbase)
	}

	print $0
	fflush()
}
