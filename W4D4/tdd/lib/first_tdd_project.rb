# Remove dups

# Array has a uniq method that removes duplicates from an array. It returns the unique
# elements in the order in which they first appeared:

def my_uniq(array)
    result = []
    array.each { |ele| result << ele unless result.include?(ele) }
    result
end



# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in an Array and
# return a new array.

# Two sum

# Write a new Array#two_sum method that finds all pairs of positions where the elements
# at those positions sum to zero.

def two_sum(array)
    pairs = []
    array.each_with_index do |num1, idx1|
        array.each_with_index do |num2, idx2|
            pairs << [idx1, idx2] if idx2 > idx1 && num1 + num2 == 0
        end
    end
    pairs
end

# NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger
# index. We want the array of pairs to be sorted "dictionary-wise":

# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)


# My Transpose

# To represent a matrix, or two-dimensional grid of numbers, we can write an array
# containing arrays which represent rows:

# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]

# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# We could equivalently have stored the matrix as an array of columns:

# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# Write a method, my_transpose, which will convert between the row-oriented and
# column-oriented representations. You may assume square matrices for simplicity's
# sake. Usage will look like the following:

def my_transpose(matrix)
    transposed = []
    matrix.each_with_index do |row, i|
        new_row = []
        row.each_with_index do |ele, j|
            new_row << matrix[j][i]
        end
        transposed << new_row
    end
    transposed
end

# my_transpose([
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]


# Stock Picker

# Write a method that takes an array of stock prices (prices on days 0, 1, ...),
# and outputs the most profitable pair of days on which to first buy the stock
# and then sell the stock. Remember, you can't sell stock before you buy it!



def pick_stocks(prices)
    profits = []
    pairs = []
    prices.each_with_index do |price_b, buy_date|
        prices.each_with_index do |price_s, sell_date|
            if sell_date > buy_date
                profits << price_s - price_b
                pairs << [buy_date, sell_date]
            end
        end
    end
    pairs[profits.index(profits.max)]
end

p pick_stocks([1, 45, 5, 8, 9]) #[0,1]
p pick_stocks([1, 45, 5, 8, 9, 100]) #[0,5]



