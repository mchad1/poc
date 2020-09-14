for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
     for dir in /nfsv3/reads; do 
       mkdir -p /nfsv3/reads
       taskset dd if=/dev/zero of=${dir}/file$i count=4194304 bs=64k &
     done
done
