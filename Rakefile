#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.name = "test:unit"
  t.libs << "test"
  t.test_files = FileList['test/unit/*_test.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.name = "test:integration"
  t.libs << "test"
  t.test_files = FileList['test/integration/*_test.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task :default => :test
