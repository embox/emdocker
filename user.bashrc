export EMBOX_DIR=/embox
export AUTOQEMU_KVM_ARG=""

for a in microblaze mips powerpc sparc; do
	PATH="$PATH:/opt/$a-elf-toolchain/bin"
done
export PATH

cd $EMBOX_DIR
