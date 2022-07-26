require_relative '../lib/exrates'
require 'money'

RSpec.describe ExRates do
  let (:rates) do
    date = '21/07/2022'
    ExRates.new(date)
  end

  describe '#rate' do
      it "returns currency rate of USD for certain date" do
          expect(rates.rate('USD')).to eq 36.5686
      end

      it "returns currency rate of IRR for certain date" do
        expect(rates.rate('IRR')).to eq 0.00069655
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
