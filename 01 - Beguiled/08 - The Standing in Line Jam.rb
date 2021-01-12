with_fx :echo, phase: 0.8, decay: 20 do
  live_loop :notes do
    play (choose scale :C3, :major)
    sleep 10
  end
  
  live_loop :ambi do
    sleep (rrand 5, 10)
    sample (choose sample_names :ambi)
    sleep 10
  end
  
  live_loop :noise do
    use_synth [:pnoise, :gnoise].choose
    play (choose scale :C3, :major), amp: 0.3, release: 2.0
    sleep (rrand 0.8, 1.2)
  end
end
