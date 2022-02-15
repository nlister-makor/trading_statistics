calcTradesTime(){


TIMEFORMAT=%R

{ time token=$(curl -s  --location --request  PUT 'https://sb20.rest-api.enigma-securities.io/auth' \
--header 'Content-Type: application/json' \
--data-raw '{
"username": "client_test_2",
 "password": "Test123!"
}' | jq -r '.key');} 2> time.txt

tokenTime=$(cat time.txt)

thread=()
tokenObj="{\"token\":\"$tokenTime\"},{\"data\":["
thread+=$tokenObj


data=$(curl -s --location --request GET 'https://sb20.rest-api.enigma-securities.io/product' \
--header "Authorization: Bearer $token"  )


types=("FOK" "MKT" "RFQ") 
sides=("BUY" "SELL")

arrayLength=$(echo $data | jq length-1)
dataCounter=0
for i in $(seq 0 $arrayLength)
 do
  counter=0
  product_id=$(echo $data | jq -r ".[$i].product_id")
  product_name=$(echo $data | jq -r ".[$i].product_name")
  max_quantity=$(echo $data | jq -r ".[$i].max_quantity")
  min_quantity=$(echo $data | jq -r ".[$i].min_quantity")
  quantities=$(seq $min_quantity $max_quantity | shuf | head -n5)
  quantitiesArray=($quantities)

  types=("FOK" "MKT" "RFQ") 
  sides=("BUY" "SELL")
 for type in ${types[@]}; 
  do
  for side in ${sides[@]};
   do
    if [ $type = "FOK" ]
      then
       if [ $side = "BUY" ]           
        then
          for qty in ${quantitiesArray[@]}
          do
          if [ $counter = 0 ]
        then 
        trade="{\"name\":\"$product_name"_"$product_id\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+="$trade"
        else
        trade="{\"name\":\"$product_name"_"$product_id\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+=",$trade"
        fi
        ((counter++))
          done
        else
        ##! move to dynamicly function  
          for qty in ${quantitiesArray[@]}
          do
          if [ $counter = 0 ]
        then 
        trade="{\"name\":\"$product_name"_"$product_id\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+="$trade"
        else
        trade="{\"name\":\"$product_name"_"$product_id\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+=",$trade"
        fi
        ((counter++))
          done
        fi
      elif [ $type = "MKT" ]
        then
          for qty in ${quantitiesArray[@]}
          do
          if [ $counter = 0 ]
        then 
        trade="{\"name\":\"$product_name"_"$product_id\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+="$trade"
        else
        trade="{\"name\":\"$product_name"_"$product_id\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+=",$trade"
        fi
        ((counter++))
          done
      else ## when RFQ
        for qty in ${quantitiesArray[@]}
        do
        if [ $counter = 0 ]
        then 
        trade="{\"name\":\"$product_name"_"$product_id\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+="$trade"
        else
        trade="{\"name\":\"$product_name"_"$product_id\",\"type\":\"$type\",\"side\":\"$side\",\"qty\":\"$qty\",\"price\":\"10000\"}"
        thread+=",$trade"
        fi
        ((counter++))
     
        done
      fi
    done
  done
  if [ $dataCounter != $arrayLength ]
  then
  ((dataCounter++))
  thread+=","
  fi
done

printf "[$thread]}]" > thread.json
}

calcTradesTime 
