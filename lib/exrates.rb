require_relative 'exrates/version'
require 'open-uri'
require 'json'
require 'money'

Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
Money.locale_backend = :currency

class ExRates
  attr_reader :refreshed_at

  def initialize(date = Date.today)
    @refreshed_at = Time.now

    parse!(date)
  end

  def rate(currency_code)
    @rates[currency_code.upcase]
  end

  def exchange(money, currency_to)
    currency_from = money.currency.iso_code

    money.with_currency(currency_to) * rate(currency_from) / rate(currency_to)
  end

  private

  def parse!(date)
    date = (date.is_a? Date) ? date : Date.parse(date)

    date_string = date.strftime('%d%m%Y')
    url = "https://bank.gov.ua/NBU_Exchange/exchange?date=#{date_string}&json"
    response = URI.open(url).read
    json_doc = JSON.parse(response)

    result = json_doc.map do |node|
        [node['CurrencyCodeL'], node['Amount'] / node['Units']]
    end

    result.push(['UAH', 1])

    @rates = result.to_h
  end

end
