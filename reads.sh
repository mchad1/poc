proc=28
#for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 ; do
#for i in 1 2 3 4 ; do
for i in 1 2 ; do
#for i in 1 ; do
     for dir in /nfsv3/reads; do 
        taskset -c $proc dd if=${dir}/file$i of=/dev/null count=2097152 bs=256k &
        (( proc = proc + 1 ))
     done
done
