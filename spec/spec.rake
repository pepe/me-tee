require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.spec_opts  = %w(-fs --color)
end
