touch /home/lg/Desktop/temp.txt
exec 1> >(tee -a /home/lg/Desktop/temp.txt) 2>&1
tcpdump -A -c 1 -i enp0s3 'port 45678'
rawdump=$(egrep -o '\,[0-9]+\.[0-9]+|\,\-[0-9]+\.[0-9]+' /home/lg/Desktop/temp.txt)
rm temp.txt
touch temp.txt
echo "$rawdump" > temp.txt
latdump=$(sed '1q;d' temp.txt | cut -d "," -f 2)
londump=$(sed '2q;d' temp.txt | cut -d "," -f 2)
altdump=$(sed '3q;d' temp.txt | cut -d "," -f 2)
touch /home/lg/Desktop/LocationPoint.txt
echo "Latitude: $latdump" > LocationPoint.txt
echo "Longitude: $londump" >> LocationPoint.txt
echo "Altitude: $altdump" >> LocationPoint.txt
rm temp.txt
