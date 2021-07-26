#!/bin/ash

cloudflare_auth_email=$CF_EMAIL
cloudflare_auth_key=$CF_AUTH_KEY
zoneid=$CF_ZONE_ID
dnsrecord=$CF_HOST


# Get the current external IP address
ip=$(curl -s -X GET https://ifconfig.me)

echo "Current IP is $ip"

if host $dnsrecord 1.1.1.1 | grep "has address" | grep "$ip"; then
  echo "$dnsrecord is currently set to $ip; no changes needed"
  exit
fi


echo "Zoneid for $zone is $zoneid"


for domain in $dnsrecord
do
  # get the dns record id
  dnsrecordid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records?type=A&name=$domain" \
    -H "X-Auth-Email: $cloudflare_auth_email" \
    -H "X-Auth-Key: $cloudflare_auth_key" \
    -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0] | .id')

  echo "DNSrecordid for $domain is $dnsrecordid"
  echo "updaing dns of $domain"
  # update the record
  response=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records/$dnsrecordid" \
    -H "X-Auth-Email: $cloudflare_auth_email" \
    -H "X-Auth-Key: $cloudflare_auth_key" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"$domain\",\"content\":\"$ip\",\"ttl\":1,\"proxied\":false}" | jq -r '.result | .content' )

  if [ "$response" == "$ip" ]; then
    echo "A record updated successfully"
  else
    echo "Failed to update: $response"
  fi

done
