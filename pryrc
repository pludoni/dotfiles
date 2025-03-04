def stacktrace
  begin; (raise RuntimeError); rescue Exception => e; e.backtrace.reject{|i|i["rvm"]}[1..20]; end
end

if Dir['tmp/']
  Pry.config.history_file = "tmp/pry_history"
else
  Pry.config.history_file = ".pry_history"
end

# vim: ft=ruby

