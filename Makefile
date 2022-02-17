build:
	makepkg -sr --sign
clean:
	rm -rf filesystem-2022.02.17-2-x86_64.pkg.tar.zst* pkg/ src/
