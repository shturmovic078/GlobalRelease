while true do
  begin
    line = STDIN.gets
    # heavy processing
  rescue Exception => e
    puts "caught exception #{e}! ohnoes!"
  end
end