find . -type f | while read -r line 
do
	ls -l $line | awk '{print $6, $7, $8, $9}'
done 

echo
touch 2018101071.txt

apropos -s 1,6,7,8 '' | grep '^lo' > 2018101071.txt

echo -n "Number of lines is: "
wc -l 2018101071.txt | cut -d " " -f 1

echo -n "Length of the longest line is: "
awk 'length > max_length { max_length = length; } END { print max_length }' 2018101071.txt 

sed -i 's/function/method/g' 2018101071.txt

cp 2018101071.txt backup.txt
echo