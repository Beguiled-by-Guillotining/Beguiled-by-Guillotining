sleepTime = 0.4

with_fx :bitcrusher do
  live_loop :drums do
    sample (choose sample_names :bd), amp: 0.5
    sleep sleepTime / [1,2,2].choose
  end
  
  live_loop :melody do
    beat_pattern = (knit 0.5, [0,0,0,1].choose, 1, (rrand 1, 3), 2, (rrand 1, 3))
    (rrand_i 10, 20).times do
      use_synth :zawa
      play (choose chord :C3, :dim7), amp: (rrand 0.3, 0.5)
      sleep sleepTime / beat_pattern.choose
    end
  end
  
  choirAmp = 0.4
  live_loop :choir do
    c = sample :ambi_choir, amp: choirAmp, slide: 0.5
    choirAmp += (((rrand 0.2, 0.4) - choirAmp) <=> 0) * 0.02
    control c, amp: choirAmp
    sleep 0.5
  end
  
  live_loop :noise do
    use_synth :pnoise
    play :C4, amp: 0.1, sustain: 1.0, release: 0.0, cutoff: 80
    play :C4, amp: 0.05, sustain: 1.0, release: 0.0, cutoff: 100
    play :C4, amp: 0.03, sustain: 1.0, release: 0.0, cutoff: 130
    sleep 1.0
  end
end