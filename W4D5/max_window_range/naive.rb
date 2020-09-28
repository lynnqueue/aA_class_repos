def windowed_max_range(array, w)
    current_max = nil 
    windows = []

    while array.length >= w
        windows << array.take!(w)
    end 

    windows.each do |window|
        diff = window.max - window.min
        current_max = diff if current_max.nil? || current_max < diff
    end 

    current_max
end 

p windowed_max_range([1, 0, 2, 5, 4, 8], 2)