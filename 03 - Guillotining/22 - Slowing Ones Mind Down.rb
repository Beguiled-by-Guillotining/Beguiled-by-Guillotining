set :len, 0.2

fastest_len = 8

live_loop :drums do
  len = get :len
  at [0.1, 0.1] do
    samp = (choose sample_names :loop)
    step = [len / (sample_duration samp), 1.0].min
    startT = [(rrand 0, 1, step: step), 1.0 - step].min
    endT = startT + step
    sample samp, start: startT, finish: endT, norm: 1
  end
  sleep [len, 0.1].max
end

live_loop :drums2 do
  sync :faster
  (fastest_len / 0.1).times do
    len = get :len
    at [0.1, 0.1] do
      samp = (choose sample_names :loop)
      step = [len / (sample_duration samp), 1.0].min
      startT = [(rrand 0, 1, step: step), 1.0 - step].min
      endT = startT + step
      sample samp, start: startT, finish: endT, norm: 1
    end
    sleep [len, 0.1].max
  end
end

live_loop :len_controller do
  set :len, 0.2
  sleep 8
  set :len, 0.1
  sleep 8
  set :len, 0.05
  sleep 0.05
  cue :faster
  sleep fastest_len - 0.05
  set :len, 0.1
  sleep 8
  set :len, 0.2
  sleep 8
  set :len, 0.4
  sleep 8
  set :len, 0.8
  sleep 8
  set :len, 1.6
  sleep 8
  set :len, 16
  sleep 16
  sample :vinyl_rewind, amp: 2
end

live_loop :bg do
  synth :growl, note: (choose chord :C4, :minor7), sustain: 1.6, amp: 0.15
  synth :growl, note: (choose chord :C4, :minor7), sustain: 1.6, amp: 0.15
  sleep 1.6
end

live_loop :bg2 do
  synth :hollow, note: (choose chord :C3, :minor7), sustain: 1.6, amp: 0.25
  synth :hollow, note: (choose chord :C3, :minor7), sustain: 1.6, amp: 0.25
  sleep 1.6
end

