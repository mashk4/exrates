require_relative '../lib/exrates'

cad = Money.new('1_50', 'CAD')

result = ExRates.new.exchange(cad, 'USD')

puts "1.5 USD -> CAD: #{result.format}"
