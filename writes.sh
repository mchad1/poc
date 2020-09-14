proc=30
#for i in 1 2 3 4 5 6 7 8; do
for i in 1 2; do
#for i in 1 ; do
     for dir in /nfsv3/writes; do 
       taskset -c $proc dd if=/dev/zero of=${dir}/file$i count=2097152 bs=64k conv=notrunc &
      (( proc = proc + 1 ))
     done
done
