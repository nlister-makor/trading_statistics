
tokenTime=0.2
echo $tokenTime

thread=()
tokenObj="{\"token\":\"$tokenTime\"},{\"data\":["
thread+=$tokenObj

echo $thread




types=("FOK" "MKT" "RFQ") 
sides=("BUY" "SELL")
quantitiesArray=(1 2 3 4 5)

counter=0
for type in ${types[@]}; 
  do
   for side in ${sides[@]};
    do
      for qty in ${quantitiesArray[@]}
       do
       if [ $counter = 0 ]
        then 
        trade="{\"name\":\"BTC\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+="$trade"
        else
        trade="{\"name\":\"BTC\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+=",$trade"
        fi
        ((counter++))
       done
    done
  done


printf "[$thread]}]" > thread.json
