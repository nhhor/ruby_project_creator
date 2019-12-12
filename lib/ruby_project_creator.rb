# class COIN_COUNTER
#
#   # attr_reader(:)
#   # attr_writer(:)
#   attr_accessor(:cents)
#
#   def initialize(cents)
#     @cents = cents
#     @new_value = 0
#     @coin_array = []
#     @result = []
#   end
#
#   def converter()
#
#     value_array = [10000, 2000, 1000, 500, 100, 25, 10, 5, 1]
#     name_array = ["hundo", "twenty", "ten", "fiver", "dollar", "quarter", "dime", "nickle", "penny"]
#     @@new_vaule = cents
#
#     value_array.each_with_index do |value, index|
#       while @@new_vaule >= value do
#         @coin_array.push(name_array[index])
#         @@new_vaule -= value
#       end
#     end
#
#     name_array.each_with_index do |value, index|
#       if @coin_array.count(value) > 0
#         plural = (@coin_array.count(value) > 1 ? "#{value}s, " : "#{value}, ")
#         result = ("#{@coin_array.count(value)} #{plural}")
#         @result.push(result)
#       end
#       result
#     end
#
#     @result.join("").gsub(/,\s+\z/, "").gsub(/(ys)/, "ies")
#
#   end
# end

# puts "how many pennies do you have?"
# user_input = gets.chomp.to_i
# test = COIN_COUNTER.new(user_input)
# puts "Thats: "
# puts test.converter()
