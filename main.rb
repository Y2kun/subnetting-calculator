puts " ____        _                _   _   _             "
puts "/ ___| _   _| |__  _ __   ___| |_| |_(_)_ __   __ _ "
puts "\\___ \\| | | | '_ \\| '_ \\ / _ \\ __| __| | '_ \\ / _` |"
puts " ___) | |_| | |_) | | | |  __/ |_| |_| | | | | (_| |"
puts "|____/ \\__,_|_.__/|_| |_|\\___|\\__|\\__|_|_| |_|\\__, |"
puts "                                              |___/ "
puts "  ____      _            _       _                  "
puts " / ___|__ _| | ___ _   _| | __ _| |_ ___  _ __      "
puts "| |   / _` | |/ __| | | | |/ _` | __/ _ \\| '__|     "
puts "| |__| (_| | | (__| |_| | | (_| | || (_) | |        "
puts " \\____\\__,_|_|\\___|\\__,_|_|\\__,_|\\__\\___/|_|        "
puts ""

def ip_to_binary(input)
  input.split(".").map {|i| i.to_i.to_s(2).rjust(8, '0')}.join.to_i(2)
end

def binary_to_decimal_ip(input)
  input.to_s(2).chars.each_slice(8).map(&:join).map { |i| i.to_i(2) }.join('.')
end

puts "Input the Decimal IP Address:"
puts "You can also add an /{SUBNETMASK}"
input_ip = gets.chomp()

if input_ip.include?("/")
  split = input_ip.split("/")
  ip_Binary = ip_to_binary(split[0])
  netmask = "1" * (split[1].to_i()) + "0" * (32 - split[1].to_i())
else
  puts "Input the Subnetmask"
  netmask = ip_to_binary(gets.chomp()).to_s(2)
  ip_Binary = ip_to_binary(input_ip)
end

network_address = ip_Binary & netmask.to_i(2)
broadcast_address = ip_Binary | netmask.reverse().to_i(2)

# puts "IP         Address: #{binary_to_decimal_ip(ip_Binary)}"
# puts "Subnetmask Address: #{binary_to_decimal_ip(netmask.to_i(2))}"
puts ""
puts "Network    Address: #{binary_to_decimal_ip(network_address)}"
puts "Broadcast  Address: #{binary_to_decimal_ip(broadcast_address)}"
puts "First      Address: #{binary_to_decimal_ip(network_address+1)}"
puts "Last       Address: #{binary_to_decimal_ip(broadcast_address-1)}"
