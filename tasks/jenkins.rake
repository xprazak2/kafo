begin
  testtool = 'minitest'
  require "ci/reporter/rake/#{testtool}"
  namespace :jenkins do
    task :unit => ["jenkins:setup:#{testtool}", 'rake:test']

    namespace :setup do
      task :pre_ci do
        ENV["CI_REPORTS"] = 'jenkins/reports/unit/'
        gem 'ci_reporter'
      end
      task :minitest  => [:pre_ci, "ci:setup:minitest"]
      task :test_unit => [:pre_ci, "ci:setup:testunit"]
    end
  end
rescue LoadError
  # ci/reporter/rake/minitest not present, skipping this definition
end

