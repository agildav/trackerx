# frozen_string_literal: true

def display_application_info
  message = 'trackerx api'.upcase
  version = '1.0'
  decorators_times = 21

  print "\n"
  puts ('#' * decorators_times).yellow
  print '#'.yellow
  print " #{message} "
  print "v#{version} ".cyan
  puts '#'.yellow
  puts ('#' * decorators_times).yellow
  print "\n"
end

display_application_info
