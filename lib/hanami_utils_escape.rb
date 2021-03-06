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

  # Pure Ruby implementation of HTML escape
  #
  # @param input [String] the input
  # @return [String] an UTF-8 encoded string
  #
  # @since 0.0.1
  def self.html(input)
    input  = encode(input)
    result = ""

    input.each_char do |chr|
      result << HTML_CHARS.fetch(chr, chr)
    end

    result
  end

  class << self
    # @since 0.0.1
    # @api private
    alias html_ruby html
  end

  # Encode the given string into UTF-8
  #
  # @param input [String] the input
  # @return [String] an UTF-8 encoded string
  #
  # @since 0.0.1
  # @api private
  def self.encode(input)
    return "" if input.nil?
    input.to_s.encode(Encoding::UTF_8)
  rescue Encoding::UndefinedConversionError
    input.dup.force_encoding(Encoding::UTF_8)
  end

  private_class_method :encode
end

require "helix_runtime"

begin
  require "hanami_utils_escape/native"
rescue LoadError
  warn "Unable to load hanami_utils_escape/native. Please run `rake build`"
end
