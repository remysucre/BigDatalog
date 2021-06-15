Datasets="wiki"
# Datasets="twitter epinions wiki"
Programs="reach"
# Programs="tc cc sssp"

for P in $Programs
do
	for D in $Datasets
		do
			# ./bin/run-example datalog.Experiments --program=99 --file=redir_$P-opt.txt --queryform="reach(A)." --baserelation_arc=../data/$D.csv 2> log &&
			./bin/run-example datalog.Experiments --program=99 --file=redir_$P.txt --queryform="reach(A)." --baserelation_arc=../data/$D/$D.csv 2> log
		done
done
