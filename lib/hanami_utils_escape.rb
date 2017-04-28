require "helix_runtime"

begin
  require "hanami_utils_escape/native"
rescue LoadError
  warn "Unable to load hanami_utils_escape/native. Please run `rake build`"
end

class HanamiUtilsEscape
  require "hanami_utils_escape/version"

  # Lookup table for HTML escape
  #
  # @since 0.4.0
  # @api private
  #
  # @see Hanami::Utils::Escape.html
  HTML_CHARS = {
    '&' => '&amp;',
    '<' => '&lt;',
    '>' => '&gt;',
    '"' => '&quot;',
    "'" => '&apos;',
    '/' => '&#x2F;'
  }.freeze

  private_constant(:HTML_CHARS)

  # Escape HTML contents
  #
  # This MUST be used only for tag contents.
  # Please use `html_attribute` for escaping HTML attributes.
  #
  # @param input [String] the input
  #
  # @return [String] the escaped string
  #
  # @since 0.4.0
  #
  # @see https://www.owasp.org/index.php/XSS_%28Cross_Site_Scripting%29_Prevention_Cheat_Sheet OWASP XSS Cheat Sheet Rule #1
  #
  # @example Good practice
  #   <div><%= Hanami::Utils::Escape.html('<script>alert(1);</script>') %></div>
  #   <div>&lt;script&gt;alert(1);&lt;&#x2F;script&gt;</div>
  #
  # @example Bad practice
  #   # WRONG Use Escape.html_attribute instead
  #   <a title="<%= Hanami::Utils::Escape.html('...') %>">link</a>
  def self.html(input)
    input  = encode(input)
    result = ""

    input.each_char do |chr|
      result << HTML_CHARS.fetch(chr, chr)
    end

    result
  end

  # Encode the given string into UTF-8
  #
  # @param input [String] the input
  #
  # @return [String] an UTF-8 encoded string
  #
  # @since 0.4.0
  # @api private
  def self.encode(input)
    return "" if input.nil?
    input.to_s.encode(Encoding::UTF_8)
  rescue Encoding::UndefinedConversionError
    input.dup.force_encoding(Encoding::UTF_8)
  end

  private_class_method :encode
end
