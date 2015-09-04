
mycd() {
	target=$1
	case $target in
		*embox)
			mkdir -p $target
			;;
	esac
	cd $1
}

alias cd=mycd
