define :melody do
  cur_sample = choose sample_names :loop
  cur_rate = rrand 0.1, 5.0
  sd = sample_duration cur_sample, rate: cur_rate
  print cur_sample, cur_rate
  5.times do
    sample cur_sample, rate: cur_rate
    sleep sd
  end
end

50.times do |i|
  live_loop (("loop" + i.to_s).to_sym) do
    melody
  end
  sleep 0.1
end
