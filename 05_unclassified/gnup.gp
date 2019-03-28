#!/usr/bin/gnuplot
set style data histogram
set style fill solid border
# Give the bars a plain fill pattern, and draw a solid line around them
set terminal png
# Make x axis labels easier to read
set xtics rotate out
set output "../img/gnup.png"
plot 'gnup.dat' using 2:xticlabels(1) title "File size"
