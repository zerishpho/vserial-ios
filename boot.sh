./ipwndfu -p
sleep 5
./ipwndfu --patch
sleep 2
./irecovery -f ibss.img4
sleep 5
./irecovery -f ibec.img4
sleep 4
echo "yeet the cable"
sleep 6
echo "un-yeet the cable"
sleep 5
./irecovery -s
