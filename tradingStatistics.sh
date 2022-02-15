TIMEFORMAT=%R
{ time token=$(curl -s --location --request PUT 'https://sb20.rest-api.enigma-securities.io/auth' \
	        --header 'Content-Type: application/x-www-form-urlencoded' \
	        --data-urlencode 'username=client_test_2' \								                --data-urlencode 'password=Test123!'| jq -r '.key') ; } 2> authTime.txt
