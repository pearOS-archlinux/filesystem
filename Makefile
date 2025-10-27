build:
	makepkg --skipchecksums --skippgpcheck -sr --nosign
clean:
	rm -rf filesystem-* pkg/ src/
