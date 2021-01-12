sleepTime = 0.5

with_fx :tanh do
  live_loop :hollow do
    synth :hollow, note: (choose scale :C2, :major), sustain: sleepTime * 2.0, release: 0.0, noise: 0
    sleep sleepTime
  end
end

live_loop :drums do
  sample (choose sample_names :bd)
  sleep sleepTime / [1,2,4,4].choose
end

live_loop :tech_saws do
  use_synth :supersaw
  play (choose chord :C3, :major), amp: 0.5
  sleep sleepTime / [1,2,2,2,2,4,4].choose
  sleep sleepTime * (rrand_i 1, 2) if one_in(20)
end