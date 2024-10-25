# regex_spec.rb
RSpec.describe 'Regular Expression for C++ Integer Literal' do
  # Base patterns
  let(:nonzero_decimal_digit) { /[1-9]/ }
  let(:decimal_digit) { /[0-9]/ }
  let(:octal_digit) { /[0-7]/ }
  let(:hex_digit) { /[0-9A-Fa-f]/ }
  let(:binary_digit) { /[01]/ }

  # Pattern for decimal literals + optional negative sign
  let(:decimal) { /-?#{nonzero_decimal_digit}('?#{decimal_digit}+)*/ }

  # Pattern for octal literals
  let(:octal) { /0('?#{octal_digit}+)*/ }

  # Pattern for hexadecimal literals
  let(:hex) { /0[xX]#{hex_digit}('?#{hex_digit})*/ }

  # Pattern for binary literals
  let(:binary) { /0[bB]#{binary_digit}('?#{binary_digit})*/ }

  # Optional suffix
  let(:size) { /[uU]?[lL]{0,2}/ }

  # Main pattern
  let(:pattern) { /^(#{decimal}|#{octal}|#{hex}|#{binary})#{size}$/ }

  # Test cases
  let(:should_pass) { ["1", "-33'000", "0", "0755", "0x1A3F", "0b1011", "10'080", "123'456'789", "1ul", "0XABCDEF", "0b1'0'1", "1u", "1ll"] }
  let(:should_fail) { ["'1'", "1'''3", "afed", "+33", "ul", "lll", "3lll", "3uuull", "0b2", "0xGHI", "-0x123", "00x123"] }

  describe 'should pass' do
    it 'matches all expected strings' do
      should_pass.each do |str|
        expect(str).to match(pattern)
      end
    end
  end

  describe 'should fail' do
    it 'does not match any of the strings' do
      should_fail.each do |str|
        expect(str).not_to match(pattern)
      end
    end
  end
end
