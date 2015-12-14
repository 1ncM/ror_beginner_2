ary = ('a'..'z').to_a
o = ['a','e','i','o','u','y']
hash = {}
ary.each {|i| hash[i] = ary.index(i) + 1 if o.include?(i) }