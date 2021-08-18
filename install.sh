#!/usr/bin/env bash

cd "$(dirname "$0")"
HOSTS_PATH='/etc/hosts'
ADS_GAMBLING_PORN_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts'
ADS_GAMBLING_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts'
ADS_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'

function block_gambling_porn() {
  curl $ADS_GAMBLING_PORN_HOSTS > $HOSTS_PATH
}

function block_gambling() {
  curl $ADS_GAMBLING_HOSTS > $HOSTS_PATH
}

function block_ads_only() {
  curl $ADS_HOSTS > $HOSTS_PATH
}

function append_hosts() {
  cat ./hosts >> $HOSTS_PATH
}

function main() {
  echo 'What do you want to block?'
  echo '1) Ads'
  echo '2) Ads and gambling'
  echo '3) Ads, gambling and porn'
  
  read choice
  
  if [ $choice -eq 1 ]; then
    block_ads_only
  elif [ $choice -eq 2 ]; then
    block_gambling
  elif [ $choice -eq 3 ]; then
    block_gambling_porn
  else
    echo "Invalid option"
  fi
  
  append_hosts
}

main
