
TIMEFORMAT=%R
{ time token=$(curl -s --location --request PUT 'https://sb20.rest-api.enigma-securities.io/auth' \
	--header 'Content-Type: application/x-www-form-urlencoded' \
	--data-urlencode 'username=client_test_2' \
	--data-urlencode 'password=Test123!'| jq -r '.key') ; } 2> authTime.txt
authTime= cat authTime.txt
jq -n --arg "{"authTimes:$authTime"}" > authTimes.json

{ time res=$(curl -s --location --request POST 'https://sb20.rest-api.enigma-securities.io/trade' \
	--header "Authorization: Bearer $token"\
	--form 'type="ZZ$MKT"' \
	--form 'side="BUY"' \
	--form 'product_id="2"' \
	--form 'quantity="1"') ; } 2>> tradeTime.txt
