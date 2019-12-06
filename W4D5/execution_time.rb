#Phase I

# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(list)

    (0...list.length).each do |i|
        (i...list.length).each do |j|
            if list[i] > list[j]
                list[i], list[j] = list[j], list[i]
            end
        end
    end
    list.first
end

# O(n ^ 2)

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

# #Phase II
# Now rewrite the function to iterate through the list just once while 
# keeping track of the minimum. What is the time complexity?

def my_min(list)
    smallest = list[0]

    (0...list.length).each do |i|
        if list[i] < smallest
            smallest = list[i]
        end
    end
    smallest
end

# O(n)

# Phase I
# Write a function that iterates through the array and finds all sub-arrays 
# using nested loops. First make an array to hold all sub-arrays. Then find the 
# sums of each sub-array and return the max.

Discuss the time complexity of this solution.

def largest_contiguous_subsum(list)

end

list = [5, 3, -7]
largest_contiguous_subsum(list) # => 8

    # possible sub-sums
p[5]           # => 5
p[5, 3]        # => 8 --> we want this one
p[5, 3, -7]    # => 1
p[3]           # => 3
p[3, -7]       # => -4
p[-7]          # => -7
