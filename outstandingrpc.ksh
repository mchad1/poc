!/usr/bin/ksh

mountpoint="$1"

while true; do
    grep -A 20 $mountpoint /proc/self/mountstats | grep "xprt:"  | awk '{print $9,$11,$12,$8}' | tail -1 | while read i; do
       divisor=`echo $i | awk '{print $1}'`
       avg_flight=`echo $i | awk '{print $2}'`
       backlog=`echo $i | awk '{print $3}'`
       cur_flight=`echo $i | awk '{print $4}'`
       aif=0 ; bl=0; cf=0
       (( aif = avg_flight / divisor ))
       (( bl = backlog / divisor ))
       (( cf = cur_flight  - divisor ))
       echo "Avg_RPC_In_Filght: $aif, Avg_Backlog: $bl,  Current_in_flight: $cf"
       sleep 1
    done
done
