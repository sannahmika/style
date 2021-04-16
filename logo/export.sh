#!/bin/bash
rm -rf png* ps eps pdf
for infile in *.svg; do
	title=${infile%%.svg}
	file="$title"
	for dpi in 90 300 1200; do
		echo "./png${dpi}/${folder}/${file} ${dpi}dpi.png"
		mkdir -p "./png${dpi}/${folder}/"
		inkscape --without-gui --export-dpi=$dpi --export-area-page --export-png="./png${dpi}/${folder}/${file} ${dpi}dpi.png" "$infile"
	done
	echo "./ps/${folder}/${file}.ps"
	mkdir -p "./ps/${folder}"
	inkscape --without-gui --export-text-to-path --export-area-page --export-ps="./ps/${folder}/${file}.ps" "$infile"
	echo "./eps/${folder}/${file}.eps"
	mkdir -p "./eps/${folder}"
	inkscape --without-gui --export-text-to-path --export-area-page --export-eps="./eps/${folder}/${file}.eps" "$infile"
	echo "./pdf/${folder}/${file}.pdf"
	mkdir -p "./pdf/${folder}"
	inkscape --without-gui --export-text-to-path --export-area-page --export-pdf="./pdf/${folder}/${file}.pdf" "$infile"
done
