require 'bundler/setup'
require 'rspec/core/rake_task'
import 'lib/tasks/helix_runtime.rake'

namespace :spec do
  RSpec::Core::RakeTask.new(unit: :build) do |task|
    task.pattern = FileList['spec/**/*_spec.rb']
  end
end

task default: 'spec:unit'
