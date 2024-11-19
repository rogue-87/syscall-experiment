#!/usr/bin/env bash
Green='\033[0;32m'
Yellow='\033[0;33m'
Red='\033[0;31m'
NC='\033[0m' # No Color
TIMER=2s
LOG="log/strace.log"

mkdir log/

# WARN: flush the filesystem page cache
echo -e "\n${Red} flushing filesystem page cache...${NC}\n"
sleep $TIMER
sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'

# NOTE: c
echo -e "\n${Red} testing c...${NC}\n"
sleep $TIMER
gcc ./read.c -o ./read

echo -e "\n ====== C ====== \n" >>$LOG
sudo strace -c ./read 2>>$LOG
echo >>$LOG

# NOTE: python
echo -e "\n${Red} testing python ...${NC}\n"
sleep $TIMER

echo -e "\n ====== python ====== \n" >>$LOG
sudo strace -c python3 read.py 2>>$LOG
echo >>$LOG

# NOTE: javascript
echo -e "\n${Red} testing javascript ...${NC}\n"
sleep $TIMER

echo -e "\n ====== javascript ====== \n" >>$LOG
sudo strace -c node-22 ./read.mjs 2>>$LOG

# NOTE: lua
echo -e "\n${Red} testing lua ...${NC}\n"
sleep $TIMER

echo -e "\ ====== nlua ====== \n" >>$LOG
sudo strace -c lua ./read.lua 2>>$LOG
