#!/usr/bin/env ruby

IO.popen("wget \"#{ARGV*'" "'}\" 2>&1") do |p|
  length = while buf = (p.readpartial 1024  rescue nil)
    (data||="") << buf
    break $1  if data =~ /Length: ([\d,]+)/
  end.delete(',')
  file_name = data.scan(/=> `(.+?)'\r?\n/m).last

  system("dd of=\"#{file_name}\" seek=#{length} bs=1 count=0 if=/dev/null")

  print data
  print buf  while buf = (p.readpartial 1024  rescue nil)
end
