#author : stream1080

# alias kd1='k8.sh daily1 '
# k daily1  podsname 

env=$1 
podsName=$2
echo $env
echo $podsName

if [ -z "$podsName" ] 
 then 
 cmdls=" kubectl get pods --namespace=$env  "
 $cmdls
 exit
fi
 

cmd=` kubectl get pods --namespace=$env | grep  $podsName | awk '{printf "%-10s\n", $1}' `
cmdCnt=` kubectl get pods --namespace=$env | grep  $podsName | awk '{print $1}' | wc -w `

pod=$cmd
cnt=$cmdCnt

if [ $cnt -eq 1 ] 
then
	echo "find"
elif  [ $cnt -gt 1 ] 
then
    echo "<==================POD List ===================>"
    cmdNo=` kubectl get pods --namespace=$env | grep  $podsName | awk '{printf "%-2s %-20s\n", NR,$1}' `
    printf "%-2s %-20s\n" "NO" "POD"
    echo "$cmdNo"
    # podsLs= (${podsLs//T/ }) 
    eval "podsLs=("$cmd")"

	echo "please input pod index NO:"
    read input
    index=input
    pod=${podsLs[$index-1]}
      
else 
 	exit
fi

#执行
  cmd=" kubectl exec -it  $pod --namespace=$env  -- bash "
  $cmd




