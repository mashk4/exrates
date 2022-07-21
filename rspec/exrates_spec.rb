require_relative '../lib/exrates'
require 'money'

RSpec.describe ExRates do
  let (:rates) do
    date = '21/07/2022'
    ExRates.new(date)
  end

  describe '#rate' do
      it "returns currency's rate for certain date" do
          expect(rates.rate('USD')).to eq 36.5686
      end
  end
  
  describe '#exchange' do
      it 'converts other currency into hryvnia' do
      usd = Money.new('1_00', 'USD')

      result = rates.exchange(usd, 'UAH')

      expect(result).to eq Money.new(36_57, 'UAH')
      end

      it 'converts one currency to another currency' do
      aud = Money.new('1_50', 'AUD')

      result = rates.exchange(aud, 'USD')
        
      expect(result).to eq Money.new(83, 'USD')
      end
  end
end