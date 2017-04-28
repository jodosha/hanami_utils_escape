require 'bundler/setup'
require 'benchmark/ips'
require 'hanami_utils_escape'

INPUT = ('<<script>xss(14);//<</script>' * 100).freeze

Benchmark.ips do |x|
  x.report('Ruby') { HanamiUtilsEscape.html_ruby(INPUT) }
  x.report('Rust') { HanamiUtilsEscape.html(INPUT) }
  x.compare!
end
