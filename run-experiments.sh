Datasets="twitter"
# Datasets="twitter epinions wiki"
Programs="reach"
# Programs="reach cc sssp"

# args: prog, query, data
function runbd ()
{
	./bin/run-example datalog.Experiments --program=99 --file=redir_$1.txt --queryform="$2" --baserelation_arc=../data/$3/$3$Sfx.csv 2> log 
	return 0
}

function qry ()
{
	case "$1" in
		"reach") Query="reach(A)."; Sfx="" ;;
		"cc") Query="cc(X,Y)."; Sfx="" ;;
		"sssp") Query="sssp(X,Y)."; Sfx="-w" ;;
		*) echo "bad program";;
	esac
	return 0
}

for P in $Programs
do
	for D in $Datasets
		do
			echo " BENCHMARKING $P on $D" ;
			qry $P &&
			runbd $P-opt $Query $D &&
			runbd $P $Query $D 
		done
done
