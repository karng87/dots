save "$0.gp"
set t push
set t png $1

set o "$0.png"
replot
set o
set t pop
