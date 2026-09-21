ASM = nasm
QEMU = qemu-system-x86_64

all: FalconOS.img
FalconOS.img: boot.ASM
	 $(ASM) -f bin boot.asm -o FalconOS.img
run: FalconOS.img
	$(QEMU) -drive format=raw,file=FalconOS.img

clean:
	del FalconOS.img