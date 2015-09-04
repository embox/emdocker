cat test.in | awk -f miwrapper.awk | diff -au test.out -
[ $? = 0 ] && echo "OK"
