#!/bin/ksh
for connect in 1 2 4 8 12 16; do
    umount /nfsv3
    mount 10.0.1.4:/nfsv31 /nfsv3 -o rsize=262144,wsize=262144,nconnect=$connect
    for queue in 0 1 2 3 ; do
        ./set_irq_affinity_bynode.sh  $queue eth1;  for work in 0 100; do
             if [[ $work == 0 ]]; then
                direction=Write
             else
                direction=Read
             fi;
             mkdir /nfsv3/poc/fio-platform-results/l32
             for try in 1 ; do
                 for iodepth in 1 2 4 8 16 24 48 96 128; do                
                     for bs in 4 64 128 256 512; do
                         taskset -c 31 fio /nfsv3/poc/fio.ini --rwmixread=$work --iodepth=${iodepth} --nrfiles=$1 --bs=${bs}K -o /nfsv3/poc/fio-platform-results/l32/l32v2-irq${queue}-nconnect${connect}-vm1-${bs}${direction}-${1}files-iodpeth${iodepth}-try${try};
                 done
             done
         done;
     done
done
done
