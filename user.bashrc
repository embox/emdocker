export EMBOX_DIR=/embox
export AUTOQEMU_KVM_ARG=""

PATH="$PATH:/opt/gcc-arm-none-eabi-6-2017-q2-update/bin"
PATH="$PATH:/opt/gcc-arm-8.3-2019.03-x86_64-aarch64-elf/bin"
for a in microblaze mips powerpc sparc; do
	PATH="$PATH:/opt/$a-elf-toolchain/bin"
done
export PATH

cd $EMBOX_DIR
