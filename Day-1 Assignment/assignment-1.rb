frozen_string_literal: true

*********************************************************************Q1**********************************************************
i=1
while 1
   puts i
   i+=1
   break if i == 101
end

*********************************************************************Q2********************************************************

arr=Array.new
arr.push(1,2,3,4,5,6,7,8)
i=gets.chomp.to_i
if arr.include?(i)
    puts 'exists'
# end
else
    puts 'not exists'
end

*********************************************************************Q3********************************************************

arr = Array[1,2,3]
arr2= Array[4,5,6,7,8]
arr3= arr+arr2
puts arr3

*********************************************************************Q4********************************************************

i=0
arr = Array[1,2,3]
while i<arr.length
    arr[i]=arr[i]*2
    i+=1;
end
puts arr

*********************************************************************Q5********************************************************

i=0
arr = Array[1,2,'a',3]
while i<arr.length
    if arr[i].is_a? Integer
        arr[i]=arr[i]*2
    end
    i+=1;
end
puts arr

*********************************************************************Q6********************************************************

arr = Array[1,2,3,4,5,6,7,'','a','b','a',2,4,2,3,6,6,7,7,7,7]
arrayCount = Hash.new
arr.each do |i|
    if arrayCount[i]
        arrayCount[i]+=1
    else
        arrayCount[i]=1
    end
end
puts arrayCount

*********************************************************************Q7********************************************************
require('csv')
table=CSV.read('/home/deq/Book1.csv',headers:true)
table.each{
    |row|
   c1 = row[0].to_i
   c2 = row[1].to_i
    row["Multiple"] = c1*c2
   }

   CSV.open('/home/deq/Book1.csv','w') do |f|
  f << table.headers
  table.each{ |row|
   f << row
  }
end

puts "Enter the value of n"
n=gets.chomp().to_i
arr1 = Array.new(n) { Array.new(n)}
for i in 0..n-1
    for j in 0..n-1
    puts "Enter value for matrix ",i,j
    arr1[i][j]=gets.chomp().to_i
    end
end
puts "Input array =",arr1

****************************************************************Q8*****************************************************
puts "Enter the value of n"
n=gets.chomp().to_i
arr1 = Array.new(n) { Array.new(n){0}}
result = Array.new(n) { Array.new(n){0}}
for i in 0..n-1
    for j in 0..n-1
        puts ("Enter value for matrix [" + i.to_s + "][" + j.to_s + "]")
        arr1[i][j]=gets.chomp().to_i
    end
end
puts "Input array = " + arr1.to_s
for i in 0..n-1
    for j in 0..n-1
        result[j][i] = arr1[i][j]
    end
end
puts "Transposed array = " + result.to_s
