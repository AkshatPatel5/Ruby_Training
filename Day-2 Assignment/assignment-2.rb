frozen_string_literal: true
*********************************************************************Q1**********************************************************

Q1. Write a program that prints from 1 to 100.

class Print100
    def print
        @i=1
        while 1
            puts @i
            @i+=1
            break if @i == 101
        end
    end
end
a = Print100.new
a.print

*********************************************************************Q2********************************************************

Q2. Write a program to check if a value exists in an array.
class ArrayOperations
    def check_existence(arr,i)
        if arr.include?(i)
            puts 'exists'
        else
            puts 'not exists'
        end
    end
end
arr=Array.new
arr.push(1,2,3,4,5,6,7,8)
i = gets.chomp.to_i
a=ArrayOperations.new.check_existence(arr,i)

*********************************************************************Q3********************************************************

Q3. Join two arrays without using inbuilt functions.
class ArrayOperations
    def merge(arr,arr2)
        arr3= arr+arr2
        puts arr3
    end
end
arr = Array[1,2,3]
arr2= Array[4,5,6,7,8]
ArrayOperations.new.merge(arr,arr2)

*********************************************************************Q4********************************************************
Q4. Write a method to double all the elements in an array.

class ArrayOperations
    def double(arr)
        @i=0
        while @i<arr.length
            arr[@i]=arr[@i]*2
            @i+=1;
        end
        return arr
    end
end
arr = Array[1,2,3]
puts ArrayOperations.new.double(arr)

*********************************************************************Q5********************************************************
Q5. Now for the previous question, write another method to double all the elements in the array. However, handle edge cases (like array can have a character) as well.

class ArrayOperations
    def double(arr)
        @i=0
        while @i<arr.length
            if arr[@i].is_a? Integer
                arr[@i]=arr[@i]*2
            end
            @i+=1;
        end
        return arr
    end
end
arr = Array[1,2,'a',3]
puts ArrayOperations.new.double(arr)

*********************************************************************Q6********************************************************
Q6. Using a hash table, print the frequency of occurrence of each character inside an array.

class ArrayOperations
    def count_occurence(arr)
        @arrayCount = Hash.new
        arr.each do |i|
            if @arrayCount[i]
                @arrayCount[i]+=1
            else
                @arrayCount[i]=1
            end
        end
        return @arrayCount
    end
end
arr = Array[1,2,3,4,5,6,7,'','a','b','a',2,4,2,3,6,6,7,7,7,7]
puts ArrayOperations.new.count_occurence(arr)
*********************************************************************Q7********************************************************
Q7. Read from a CSV file, multiply two columns and then write back to the CSV file.

class FileOperations
    require('csv')
    def read(path)
        @table=CSV.read(path,headers:true)
    end
    def multiple
        @table.each{
            |row|
        @c1 = row[0].to_i
        @c2 = row[1].to_i
            row["Multiple"] = @c1*@c2
        }
    end
    def write(path)
        CSV.open(path,'w') do |f|
        f << @table.headers
        @table.each{ |row|
        f << row
        }
        end
    end
end
a=FileOperations.new
a.read('/home/deq/Book1.csv')
a.multiple
a.write('/home/deq/Book2.csv') #writing in a different file just for testing

****************************************************************Q8*****************************************************
Q8. Write a program to transpose a N*N matrix.

class Matrix
    def getInput
        puts "Enter the value of n"
        @n=gets.chomp().to_i
        @arr1 = Array.new(@n) { Array.new(@n){0}}
        @result = Array.new(@n) { Array.new(@n){0}}
        for i in 0..@n-1
            for j in 0..@n-1
                puts ("Enter value for matrix [" + i.to_s + "][" + j.to_s + "]")
                @arr1[i][j]=gets.chomp().to_i
            end
        end
        puts "Input array = " + @arr1.to_s
    end
    def transpose
        for i in 0..@n-1
            for j in 0..@n-1
                @result[j][i] = @arr1[i][j]
            end
        end
        puts "Transposed array = " + @result.to_s
    end
end
a=Matrix.new
a.getInput
a.transpose
