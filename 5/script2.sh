cat file1.csv file2.csv > target_file.csv

echo "Age,workclass,fnlwgt,education,education-num,marital-status,occupation,relationship,rac
e,sex,capital-gain,capital-loss,native-country,class" > header.csv

cat header.csv target_file.csv > temp.txt 
mv temp.txt target_file.csv

sed -i 's/?/2018101071/g' target_file.csv