RSpec.describe HanamiUtilsEscape do
  TEST_ENCODINGS = Encoding.name_list.each_with_object(['UTF-8']) do |encoding, result|
    test_string = '<script>'.encode(Encoding::UTF_8)

    string = begin
              test_string.encode(encoding)
            rescue
              nil
            end

    result << encoding if !string.nil? && string != test_string
  end

  describe '.html' do
    TEST_ENCODINGS.each do |encoding|
      describe encoding.to_s do
        it 'escapes nil' do
          result = described_class.html(nil)
          expect(result).to eq ''
        end

        it "escapes 'test'" do
          result = described_class.html('test'.encode(encoding))
          expect(result).to eq 'test'
        end

        it "escapes '&'" do
          result = described_class.html('&'.encode(encoding))
          expect(result).to eq '&amp;'
        end

        it "escapes '<'" do
          result = described_class.html('<'.encode(encoding))
          expect(result).to eq '&lt;'
        end

        it "escapes '>'" do
          result = described_class.html('>'.encode(encoding))
          expect(result).to eq '&gt;'
        end

        it %(escapes '"') do
          result = described_class.html('"'.encode(encoding))
          expect(result).to eq '&quot;'
        end

        it %(escapes "'") do
          result = described_class.html("'".encode(encoding))
          expect(result).to eq '&apos;'
        end

        it "escapes '/'" do
          result = described_class.html('/'.encode(encoding))
          expect(result).to eq '&#x2F;'
        end

        it "escapes '<script>'" do
          result = described_class.html('<script>'.encode(encoding))
          expect(result).to eq '&lt;script&gt;'
        end

        it "escapes '<scr<script>ipt>'" do
          result = described_class.html('<scr<script>ipt>'.encode(encoding))
          expect(result).to eq '&lt;scr&lt;script&gt;ipt&gt;'
        end

        it "escapes '&lt;script&gt;'" do
          result = described_class.html('&lt;script&gt;'.encode(encoding))
          expect(result).to eq '&amp;lt;script&amp;gt;'
        end

        it %(escapes '""><script>xss(5)</script>') do
          result = described_class.html('""><script>xss(5)</script>'.encode(encoding))
          expect(result).to eq '&quot;&quot;&gt;&lt;script&gt;xss(5)&lt;&#x2F;script&gt;'
        end

        it %(escapes '><script>xss(6)</script>') do
          result = described_class.html('><script>xss(6)</script>'.encode(encoding))
          expect(result).to eq '&gt;&lt;script&gt;xss(6)&lt;&#x2F;script&gt;'
        end

        it %(escapes '# onmouseover="xss(7)" ') do
          result = described_class.html('# onmouseover="xss(7)" '.encode(encoding))
          expect(result).to eq '# onmouseover=&quot;xss(7)&quot; '
        end

        it %(escapes '/" onerror="xss(9)">') do
          result = described_class.html('/" onerror="xss(9)">'.encode(encoding))
          expect(result).to eq '&#x2F;&quot; onerror=&quot;xss(9)&quot;&gt;'
        end

        it %(escapes '/ onerror="xss(10)"') do
          result = described_class.html('/ onerror="xss(10)"'.encode(encoding))
          expect(result).to eq '&#x2F; onerror=&quot;xss(10)&quot;'
        end

        it %(escapes '<<script>xss(14);//<</script>') do
          result = described_class.html('<<script>xss(14);//<</script>'.encode(encoding))
          expect(result).to eq '&lt;&lt;script&gt;xss(14);&#x2F;&#x2F;&lt;&lt;&#x2F;script&gt;'
        end
      end
    end

    it 'escapes word with different encoding' do
      skip 'There is no ASCII-8BIT encoding' unless Encoding.name_list.include?('ASCII-8BIT')

      # rubocop:disable Style/AsciiComments
      # 'тест' means test in russian
      string   = 'тест'.force_encoding('ASCII-8BIT')
      encoding = string.encoding

      result = described_class.html(string)
      expect(result).to eq 'тест'
      expect(result.encoding).to eq Encoding::UTF_8

      expect(string.encoding).to eq encoding
    end
  end
end
