define :melody do
  cur_sample = choose sample_names :loop
  cur_rate = rrand 0.1, 5.0
  sd = sample_duration cur_sample, rate: cur_rate
  print cur_sample, cur_rate
  5.times do
    sample cur_sample, rate: cur_rate, amp: 0.3
    sleep sd
  end
end

i = 1
5.times do
  live_loop (("loop" + i.to_s).to_sym) do
    melody
  end
  i += 1
end

live_loop :music do
  sample (choose sample_names :elec), rate: (rrand 0.5, 2.0)
  sleep rrand 0.1, 0.2
end
