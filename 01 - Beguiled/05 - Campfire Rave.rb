beatSleepTime = 0.125
melodySleepTime = 0.25

load_samples :bd
load_samples :tabla

time_warp 0.5 do #This time warp tries to prevent timing getting behind
  live_loop :euclid_beat do
    beatLength = rrand_i 50, 60
    atTimes = range 0, beatLength * beatSleepTime, step: beatSleepTime
    
    (rrand_i 3,5).times do
      samp = (choose sample_names [:tabla, :bd].choose)
      amp = (rrand 0.5, 0.8)
      timing = (spread (rrand_i 2, 4), (rrand_i 4, 11))
      
      at atTimes do |t, idx|
        sample samp, amp: amp if timing[idx]
      end
    end
    
    sleep beatLength * beatSleepTime
  end
  
  live_loop :melody do
    beatLength = rrand_i 20, 30
    atTimes = range 0, beatLength * melodySleepTime, step: melodySleepTime
    
    (rrand_i 3,5).times do
      note = (chord :C3, :minor7).choose
      amp = (rrand 0.8, 1.0)
      timing = (spread (rrand_i 2, 4), (rrand_i 4, 11))
      coef = (rrand 0.1, 0.5)
      
      at atTimes do |t, idx|
        synth :pluck, note: note, amp: amp, coef: coef if timing[idx]
      end
    end
    
    sleep beatLength * melodySleepTime
  end
end