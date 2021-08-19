#!/usr/bin/env bash

cd "$(dirname "$0")"

HOSTS_PATH='/etc/hosts'

ADS_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'
ADS_SOCIAL_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts'
ADS_FAKENEWS_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts'
ADS_GAMBLING_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts'
ADS_PORN_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts'

ADS_FAKENEWS_GAMBLING_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts'
ADS_FAKENEWS_PORN_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-porn/hosts'
ADS_FAKENEWS_SOCIAL_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-social/hosts'

ADS_GAMBLING_PORN_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts'
ADS_GAMBLING_PORN_FAKENEWS_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts'
ADS_GAMBLING_PORN_FAKENEWS_SOCIAL_HOSTS='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts'

function block_ads_only() {
  curl $ADS_HOSTS > $HOSTS_PATH
}

function block_gambling() {
  curl $ADS_GAMBLING_HOSTS > $HOSTS_PATH
}

function block_social() {
  curl $ADS_SOCIAL_HOSTS > $HOSTS_PATH
}

function block_porn() {
  curl $ADS_PORN_HOSTS > $HOSTS_PATH
}

function block_fakenews() {
  curl $ADS_FAKENEWS_HOSTS > $HOSTS_PATH
}

function block_fakenews_gambling() {
  curl $ADS_FAKENEWS_GAMBLING_HOSTS > $HOSTS_PATH
}

function block_fakenews_porn() {
  curl $ADS_FAKENEWS_PORN_HOSTS > $HOSTS_PATH
}

function block_fakenews_social() {
  curl $ADS_FAKENEWS_SOCIAL_HOSTS > $HOSTS_PATH
}

function block_gambling_porn() {
  curl $ADS_GAMBLING_PORN_HOSTS > $HOSTS_PATH
}

function block_gambling_porn_fakenews() {
  curl $ADS_GAMBLING_PORN_FAKENEWS_HOSTS > $HOSTS_PATH
}

function block_gambling_porn_fakenews_social() {
  curl $ADS_GAMBLING_PORN_FAKENEWS_SOCIAL_HOSTS > $HOSTS_PATH
}

function append_hosts() {
  cat ./hosts >> $HOSTS_PATH
}

function install() {
  echo "Downloading hosts file..."
  
  if [ $1 -eq 1 ]; then
    block_ads_only
  elif [ $1 -eq 2 ]; then
    block_gambling
  elif [ $1 -eq 3 ]; then
    block_social
  elif [ $1 -eq 4 ]; then
    block_porn
  elif [ $1 -eq 5 ]; then
    block_fakenews
  elif [ $1 -eq 6 ]; then
    block_fakenews_gambling
  elif [ $1 -eq 7 ]; then
    block_fakenews_porn
  elif [ $1 -eq 8 ]; then
    block_fakenews_social
  elif [ $1 -eq 9 ]; then
    block_gambling_porn
  elif [ $1 -eq 10 ]; then
    block_gambling_porn_fakenews
  elif [ $1 -eq 11 ]; then
    block_gambling_porn_fakenews_social
  else
    echo "Invalid option"
    exit 1
  fi
}

function type_answer() {
  echo 'What do you want to block?'
  echo '1) Ads'
  echo '2) Ads and gambling'
  echo '3) Ads and social'
  echo '4) Ads and porn'
  echo '5) Ads and fakenews'
  echo '6) Ads, fakenews and gambling'
  echo '7) Ads, fakenews and porn'
  echo '8) Ads, fakenews and social'
  echo '9) Ads, gambling and porn'
  echo '10) Ads, gambling, porn and fakenews'
  echo '11) Ads, gambling, porn, fakenews and social'
  
  read choice
  install $choice
}

if [ -n "$1" ]; then
  install $1
else
  type_answer
fi

append_hosts
echo "New hosts file generated in: $HOSTS_PATH"
