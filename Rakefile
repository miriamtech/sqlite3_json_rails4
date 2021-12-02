require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
  t.warning = false
end

task default: :test

namespace :rubocop do
  desc 'Lint Ruby code with RuboCop'
  task :lint do
    require 'rubocop/rake_task'
    RuboCop::RakeTask.new(:rubocop)
    Rake::Task['rubocop'].invoke
  end

  desc 'Fix Ruby code with RuboCop'
  task :fix do
    require 'rubocop/rake_task'
    RuboCop::RakeTask.new(:rubocop)
    Rake::Task['rubocop:auto_correct'].invoke
  end
end

task static: ['rubocop:lint']

if ENV['GENERATE_REPORTS'] == 'true'
  require 'ci/reporter/rake/minitest'
  task test: 'ci:setup:minitest'
end
