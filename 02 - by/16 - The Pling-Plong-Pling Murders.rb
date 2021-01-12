sleepTime = 0.4

with_fx :whammy do
  live_loop :drums do
    sample (choose sample_names :bd), amp: 0.5
    sleep sleepTime * [0.5, 0.5, 1.0].choose
  end
  
  live_loop :melody do
    use_synth :sine
    play (choose chord :C3, :minor), amp: 0.5
    sleep sleepTime / [1,1,2].choose
  end
end

last_note = (choose chord :C3, :minor)
live_loop :bgmelody do
  use_synth :hoover
  c = play last_note, amp: 0.3, sustain: sleepTime * 10, slide: sleepTime / 2, release: 0.0
  
  5.times do
    sleep sleepTime * 2
    last_note = (choose chord :C3, :minor)
    control c, note: last_note
  end
end

live_loop :noise do
  use_synth :pnoise
  play :C4, amp: 0.1, sustain: 1.0, release: 0.0, cutoff: 80
  play :C4, amp: 0.05, sustain: 1.0, release: 0.0, cutoff: 100
  play :C4, amp: 0.03, sustain: 1.0, release: 0.0, cutoff: 130
  sleep 1.0
end