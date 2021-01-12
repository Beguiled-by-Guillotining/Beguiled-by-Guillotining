synths = synth_names.to_a
synths.delete(:sound_in)
synths.delete(:sound_in_stereo)

base_time = 0.1
max_sample_time = 0.1

set :bpm, 30

with_debug false do
  live_loop :drums do
    use_bpm get(:bpm)
    samp = (choose all_sample_names)
    if (sample_duration samp) < max_sample_time
      sample samp
    else
      sample samp, beat_stretch: max_sample_time, pan: -0.3
    end
    sleep base_time * [1,1,1,2].choose
  end
  
  live_loop :drums2 do
    use_bpm get(:bpm)
    samp = (choose all_sample_names)
    if (sample_duration samp) < max_sample_time
      sample samp
    else
      sample samp, beat_stretch: max_sample_time, pan: 0.3
    end
    sleep base_time * [1,1,1,2].choose
  end
  
  live_loop :noise do
    use_bpm get(:bpm)
    synth :pnoise, sustain: 10.0, release: 0.0, amp: 0.2
    synth :gnoise, sustain: 10.0, release: 0.0, amp: 0.1
    sleep 10.0
  end
  
  live_loop :bass do
    use_bpm get(:bpm)
    samp = :bass_hard_c
    rpitch = (choose scale :minor) + 26.0
    sample samp, rpitch: rpitch, pitch: -26.0, window_size: 0.01, amp: (rrand 0.7, 0.9)
    sleep base_time * [1,1,2].choose
  end
end


live_loop :bpm_changer do
  set :bpm, 30
  print "slow"
  sleep 15.0
  
  set :bpm, 60
  print "fast"
  sleep 10.0
  
  set :bpm, 30
  print "slow"
  sleep 10.0
  
  set :bpm, 10
  print "very slow"
  sleep 10.0
end