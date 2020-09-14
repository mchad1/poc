#proc=30
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
#for i in 1 ; do
     #for dir in /nfsv3/writes; do 
     for dir in /nfsv3/reads; do 
       #taskset -c $proc dd if=/dev/zero of=${dir}/file$i count=2097152 bs=64k conv=notrunc &
       taskset dd if=/dev/zero of=${dir}/file$i count=4194304 bs=64k &
#      (( proc = proc + 1 ))
     done
done
