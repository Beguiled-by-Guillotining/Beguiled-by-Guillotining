sleepTime = 0.4

with_fx :tremolo, phase: 50, wave: 3, depth: 1.0 do
  live_loop :drums do
    sample (choose sample_names :bd), amp: 0.5
    sleep sleepTime * [0.5, 0.5, 1.0].choose
  end
  
  live_loop :melody do
    use_synth :dark_ambience
    play (choose chord :C4, :minor), amp: 10.0
    sleep sleepTime / [1,1,2].choose
  end
end

live_loop :noise do
  use_synth :pnoise
  play :C4, amp: 0.1, sustain: 1.0, release: 0.0, cutoff: 80
  play :C4, amp: 0.05, sustain: 1.0, release: 0.0, cutoff: 100
  play :C4, amp: 0.03, sustain: 1.0, release: 0.0, cutoff: 130
  sleep 1.0
end