all: rickascii.frames rickascii.c

rickascii.frames:
	[[ -f "rickascii.frames.bz2" ]] && bunzip2 rickascii.frames.bz2 || true

rickacii.c:
	x86_64-w64-mingw32-g++ rickexe.c -static-libgcc -static-libstdc++ -o rickascii.exe
