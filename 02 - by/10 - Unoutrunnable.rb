sleepTime = 0.5

with_fx :tanh do
  live_loop :hollow do
    synth :hollow, note: (choose scale :C3, :minor), amp: 2.0, sustain: sleepTime * 2.0, release: 0.0, noise: 0
    sleep sleepTime
  end
end

live_loop :drums do
  sample (choose sample_names :tabla), amp: 1.2
  sleep sleepTime / [1,2].choose
end

live_loop :tech_saws do
  synth :tech_saws, note: (choose scale :C4, :minor), release: sleepTime / 2, noise: 0, amp: 0.6
  sleep sleepTime / 2
  if one_in(20)
    synth :tech_saws, note: (choose scale :C3, :minor), release: sleepTime, noise: 0, amp: 0.6
    sleep sleepTime * (rrand_i 10, 20)
  end
end