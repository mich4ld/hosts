cd "$(dirname "$0")"
ADS_GAMBLING_PORN_HOSTS = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts'
ADS_GAMBLING_HOSTS = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts'
ADS_HOSTS = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'

function block_gambling_porn() {
  sudo curl $ADS_GAMBLING_PORN_HOSTS >> /etc/hosts
}

function block_gambling() {
  sudo curl $ADS_GAMBLING_HOSTS >> /etc/hosts
}

function block_ads_only() {
  sudo curl $ADS_HOSTS >> /etc/hosts
}

function append_hosts() {
  sudo cat ./hosts >> /etc/hosts
}

function main() {
  echo 'What do you want to block?'
  echo '1) Ads'
  echo '2) Ads and gambling'
  echo '3) Ads, gambling and porn'
  
  read $choice
  
  if [ $choice -eq 1 ]; then
    block_ads_only
  fi
  
  if [ $choice -eq 2 ]; then
    block_gambling
  fi
  
  if [ $choice -eq 3 ]; then
    block_gambling_porn
  fi
  
  append_hosts
}
