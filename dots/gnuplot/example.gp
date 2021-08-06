#!/usr/bin/env gnuplot
set t postscript "enhanced"
set output "example.eps"
set label 1 "{/Symbol f}(x) = e^{-x^2/2} / {/Symbol 2 p}" at 1.2, 0.25
set label 2 "{/Symbol f}(x) = {/Symbol @_{-}}^x &{i} {/Symbol f}(t) dt" at 1.2, 0.8

set key top left

unset xtics
set xtics (-{/Symbol p}/2" -1.57080, "0" 0.00000, "{/symbol p}/2" 1.57080)

plot [-3:3] exp(-0.5**2)/sqrt(2*pi) t "{/Symbol f}(x)", norm(x) t "{/Symbol F}(x)"

# ##
#   3 (1 + 0.1) 
#      (3 (1 + 0.1))(1 +  0.1)
# 
# x ( x + 0.1)^1
# x ( x + 0.1)^2
# x ( x + 0.1)^3
# 
# 
# x r
# x(1 + r/2)  = x + x * r/2
# x( 1+ r/2)^2 = x(1 + r/2)(1 + r/2)
#   cf) (1+r) < (1+r/2)^2 < (1 + r/3)^3
# 
# a^f(x) prime 
#     ==> a^f(x) * f(x)' * ln_{e}a
# 
# log_{a}f(x) prme
#     ==> 1/f(x) * f(x)' * 1/ln_{e}a
