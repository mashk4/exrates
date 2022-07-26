# ExRates

ExRates is a Ruby gem, that fethes exchange rates from National Bank of Ukraine (bank.gov.ua) and perform currency conversion. With the help of this gem, you can easily find out the exchange rate for a certain date in relation to the hryvnia and convert one currency to another. This gem also uses another gem, called 'Money'. The documentation for this gem you can read [here](https://github.com/RubyMoney/money).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exrates'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install exrates

## Usage

**Find out the exchange rate in relation to the hryvnia for a certain currency:**
```ruby
currency = ExRate.new

puts currency.rate('USD')
```


**Find out the exchange rate for a specific date:**
```ruby
currency = ExRate.new('22.02.2022')

puts currency.rate('USD')
```

**Convertion currency to hryvna:**
```ruby
usd = Money.new('1_00', 'USD')

result = ExRates.new.exchange(usd, 'UAH')

puts "1.00 USD -> UAH: #{result.format}"
```

**Convertion one currency to another:**
```ruby
usd = Money.new('1_50', 'USD')

result = ExRates.new.exchange(usd, 'CAD')

puts "1.50 USD -> CAD: #{result.format}"
```
*See the 'Money' gem's [documentation](https://github.com/RubyMoney/money) for how to handle the Money object.*

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mashk4/exrates.
