ary = ('a'..'z').to_a
o = ['a','e','i','o','u','y']
hash = {}
ary.each_with_index {|i,index| hash[i] = index + 1 if o.include?(i)}