seq 0 3 100 | sed '1d;s/^/\n\nFizz/' > f
seq 0 5 100 | sed '1d;s/^/\n\n\n\nBuzz/' > b
seq 100 > a | paste f b a | sed 's/\s//g;/z/s/[0-9]//g'
