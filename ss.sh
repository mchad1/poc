while true; do 
  echo '#########' 
  date  
  tc -s qdisc show dev eth1:
  echo  
  echo '-------' 
  echo 
  #ss -tep -o state established 
  ss -tep -o state established '( dport = :nfs or sport = :nfs )'
  echo "#######" 
  sleep 2
done
