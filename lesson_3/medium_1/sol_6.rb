# the caller has changed
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
buffer = [1, 2, 3, 4]
p rolling_buffer1(buffer, 5, 5)
p rolling_buffer1(buffer, 5, 6)

# the input_array still the same
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
arr = [1, 2, 3, 4]
p rolling_buffer2(arr, 5, 5)
p rolling_buffer2(arr, 5, 6)
