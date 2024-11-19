#!/usr/bin/env bash
Green='\033[0;32m'
Yellow='\033[0;33m'
Red='\033[0;31m'
NC='\033[0m' # No Color
TIMER=2s
LOG="log/strace.log"
CLOG="log/c.log"
PYLOG="log/py.log"
JSLOG="log/js.log"
LUALOG="log/lua.log"

mkdir log/
touch log/c.log
touch log/py.log
touch log/js.log
touch log/lua.log

# WARN: flush the filesystem page cache
echo -e "\n${Red} flushing filesystem page cache...${NC}\n"
sleep $TIMER
sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'

# NOTE: C
echo -e "\n${Red} Testing C ...${NC}\n"
sleep $TIMER
gcc ./write.c -o ./write

echo -e "\n ====== C ====== \n" >>$CLOG
sudo strace -c ./write 10 2>>$CLOG
echo >>$CLOG
sudo strace -c ./write 100 2>>$CLOG
echo >>$CLOG
sudo strace -c ./write 1000 2>>$CLOG
echo >>$CLOG
sudo strace -c ./write 10000 2>>$CLOG
echo >>$CLOG
sudo strace -c ./write 100000 2>>$CLOG
echo >>$CLOG
sudo strace -c ./write 1000000 2>>$CLOG
echo >>$CLOG

# NOTE: Python
echo -e "\n${Red} Pesting Python ...${NC}\n"
sleep $TIMER

echo -e "\n ====== Python ====== \n" >>$PYLOG
sudo strace -c python3 write.py 10 2>>$PYLOG
echo >>$PYLOG
sudo strace -c python3 write.py 100 2>>$PYLOG
echo >>$PYLOG
sudo strace -c python3 write.py 1000 2>>$PYLOG
echo >>$PYLOG
sudo strace -c python3 write.py 10000 2>>$PYLOG
echo >>$PYLOG
sudo strace -c python3 write.py 100000 2>>$PYLOG
echo >>$PYLOG
sudo strace -c python3 write.py 1000000 2>>$PYLOG
echo >>$PYLOG

# NOTE: Javascript
echo -e "\n${Red} testing javascript ...${NC}\n"
sleep $TIMER

echo -e "\n ====== Javascript ====== \n" >>$JSLOG
sudo strace -c node-22 ./write.mjs 10 2>>$JSLOG
echo >>$JSLOG
sudo strace -c node-22 ./write.mjs 100 2>>$JSLOG
echo >>$JSLOG
sudo strace -c node-22 ./write.mjs 1000 2>>$JSLOG
echo >>$JSLOG
sudo strace -c node-22 ./write.mjs 10000 2>>$JSLOG
echo >>$JSLOG
sudo strace -c node-22 ./write.mjs 100000 2>>$JSLOG
echo >>$JSLOG
sudo strace -c node-22 ./write.mjs 1000000 2>>$JSLOG
echo >>$JSLOG

# NOTE: Lua
echo -e "\n${Red} Testing Lua ...${NC}\n"
sleep $TIMER

echo -e "\n ====== Lua ====== \n" >>$LUALOG
sudo strace -c lua ./write.lua 10 2>>$LUALOG
echo >>$LUALOG
sudo strace -c lua ./write.lua 100 2>>$LUALOG
echo >>$LUALOG
sudo strace -c lua ./write.lua 1000 2>>$LUALOG
echo >>$LUALOG
sudo strace -c lua ./write.lua 10000 2>>$LUALOG
echo >>$LUALOG
sudo strace -c lua ./write.lua 100000 2>>$LUALOG
echo >>$LUALOG
sudo strace -c lua ./write.lua 1000000 2>>$LUALOG
echo >>$LUALOG
