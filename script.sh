calcTradesTime(){
  

TIMEFORMAT=%R

token=$(curl -s  --location --request  PUT 'https://sb20.rest-api.enigma-securities.io/auth' \
--header 'Content-Type: application/json' \
--data-raw '{
"username": "client_test_2",
 "password": "Test123!"
}' | jq -r '.key') 


data=$(curl --location --request GET 'https://sb20.rest-api.enigma-securities.io/product' \
--header "Authorization: Bearer $token"  )





arrayLength=$(echo $data | jq length-1)
mkdir coins_performence
for i in $(seq 0 $arrayLength)
 do
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
   mkdir ./coins_performence/$type"_"$side"_"$product_name
    if [ $type = "FOK" ]
      then
       if [ $side = "BUY" ]           
        then
          for qty in ${quantitiesArray[@]}
          do
            ##! move to dynamicly function
            { time quoteReciever $token $side $product_id $quantity 
              
           curl -s --location --request POST 'https://sb20.rest-api.enigma-securities.io/trade' \
           --header "Authorization: Bearer $token" \
           --form "type=$type" \
           --form "side=$side" \
           --form "product_id=$product_id" \
           --form "quantity=$qty" \
           --form "price=$buy_price";} 2> time.txt
           time=$(cat time.txt) 
           array+=("{"":}")
           "./coins_performence/$type"_"$side"_"$product_name/$side'_'$product_id'_'$qty'_'$price'.txt"

          done
        else
        ##! move to dynamicly function  
          for qty in ${quantitiesArray[@]}
          do
           { time quoteSellReciever $token $side $product_id $quantity
              # quote_id=$(echo $quote | jq -r ".quote_id")
            curl -s --location --request POST 'https://sb20.rest-api.enigma-securities.io/trade' \
            --header "Authorization: Bearer $token" \
            --form "type=$type" \
            --form "side=$side" \
            --form "product_id=$product_id" \
            --form "quantity=$qty" \
            --form "price=$sell_price";} 2>> "./coins_performence/$type"_"$side"_"$product_name/$side'_'$product_id'_'$qty'_'$price'.txt"
          done
        fi
      elif [ $type = "MKT" ]
        then
          for qty in ${quantitiesArray[@]}
          do
            { time curl -s --location --request POST 'https://sb20.rest-api.enigma-securities.io/trade' \
            --header "Authorization: Bearer $token" \
            --form "type=$type" \
            --form "side=$side" \
            --form "product_id=$product_id" \
            --form "quantity=$qty";} 2>> "./coins_performence/$type"_"$side"_"$product_name/$side'_'$product_id'_'$qty'_'$price'.txt"
          done
      else ## when RFQ
        for qty in ${quantitiesArray[@]}
        do
         ##! move to dynamicly function
          { time quote=$(curl -s --location --request POST 'https://sb20.rest-api.enigma-securities.io/quote' \
            --header "Authorization: Bearer $token" \
            --form "side=$side" \
            --form "product_id=$product_id" \
            --form "quantity=$qty")
          price=$(echo $quote | jq -r ".price")
          quote_id=$(echo $quote | jq -r ".quote_id")

          curl -s --location --request POST 'https://sb20.rest-api.enigma-securities.io/trade' \
            --header "Authorization: Bearer $token" \
            --form "type=$type" \
            --form "side=$side" \
            --form "product_id=$product_id" \
            --form "quantity=$qty" \
            --form "price=$price" \
            --form "quote_id=$quote_id";} 2>> "./coins_performence/$type"_"$side"_"$product_name/$side'_'$product_id'_'$qty'_'$price'.txt"
     
        done
      fi
    done
  done
done

}
calcTradesTime 



