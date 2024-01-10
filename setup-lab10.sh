#!/bin/bash

# 開始メッセージ
echo;
printf "\e[33;1m----- NECMP AZ305 Training / Lab11 Setup -----\e[m"
echo;
echo;
echo -n "あなたの <受講者番号> を入力してください = "
read num
echo;
echo "あなたが入力した <受講者番号> は" $num "です"
echo -n "セットアップを開始してよろしいですか？(y/n) = "
read yesno
case "$yesno" in [yY]*) ;; *) echo "終了します" ; exit ;; esac
echo;

#リージョンの指定
location="japaneast"

# リソースグループの作成
echo "リソースグループ" RG$num "を作成します..."
az group create \
  --name RG$num \
  --location $location \
  --output table

# ストレージアカウントの作成
storagename=storage$num$RANDOM
echo "ストレージアカウント" $storagename "を作成します..."
az storage account create \
  --name $storagename \
  --resource-group RG$num \
  --location $location \
  --output table

# 終了メッセージ
echo;
echo "セットアップが完了しました"
echo;