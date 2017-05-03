require "bundler/setup"
require "benchmark/ips"
require "hanami_utils_escape"

INPUT_1     = "<".freeze
INPUT_10    = "<<script/>".freeze
INPUT_100   = (INPUT_10 * 10).freeze
INPUT_1000  = (INPUT_100 * 10).freeze
INPUT_10000 = (INPUT_1000 * 10).freeze

Benchmark.ips do |x|
  x.report("Ruby 1") { HanamiUtilsEscape.html_ruby(INPUT_1) }
  x.report("Rust 1") { HanamiUtilsEscape.html(INPUT_1) }

  x.report("Ruby 10") { HanamiUtilsEscape.html_ruby(INPUT_10) }
  x.report("Rust 10") { HanamiUtilsEscape.html(INPUT_10) }

  x.report("Ruby 100") { HanamiUtilsEscape.html_ruby(INPUT_100) }
  x.report("Rust 100") { HanamiUtilsEscape.html(INPUT_100) }

  x.report("Ruby 1000") { HanamiUtilsEscape.html_ruby(INPUT_1000) }
  x.report("Rust 1000") { HanamiUtilsEscape.html(INPUT_1000) }

  x.report("Ruby 10000") { HanamiUtilsEscape.html_ruby(INPUT_10000) }
  x.report("Rust 10000") { HanamiUtilsEscape.html(INPUT_10000) }
end
