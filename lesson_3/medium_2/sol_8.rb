def foo(param = 'no')
  "yes"
end

def bar(param = 'no')
  param == 'no' ? 'yes': 'no'
end
puts bar()    # => yes
puts bar('no')    # => yes
puts bar('yes')   # => no
puts bar('anything') # => no
puts bar(foo)     # => no