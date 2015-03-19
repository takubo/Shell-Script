function zeros() {
	yes 0 | head -n `expr ${1:-1} '*' ${2:-1}` | xargs -n ${1:-1}
}

function ones() {
	yes 1 | head -n `expr ${1:-1} '*' ${2:-1}` | xargs -n ${1:-1}
}

function eyes() {
	# yes 0 | head -n `expr ${1:-1} '*' ${1:-1}` | xargs -n ${1:-1} | awk '$NR = 1'
	yes 0 | head -n `expr ${1:-1} '*' ${1:-1}` | xargs -n ${1:-1} | awk '{$NR = 1; print}'
}





function minus() {
#sed 's/\(^\|[ \t]*\)\(\)/\1-\2' "$@"
	awk '
		{ for (i = 1; i <= NF; i++) $i = -$i; print }
	' "$@"
}

function add() {
	awk '
		{ for (i = 1; i <= NF; i++) s[FNR, i] += $i }
		END { for (i = 1; i <= FNR; i++) {
			for (j = 1; j <= NF; j++)
				printf s[i, j] OFS
			print ""
			}
		}
	' "$@"
}



function flatten() {
	awk '
		BEGIN { ORS = "" }
		FNR == 1 { print; next }
		{ print "", $0 }
		END { print "\n" }
	' "$@"
}

