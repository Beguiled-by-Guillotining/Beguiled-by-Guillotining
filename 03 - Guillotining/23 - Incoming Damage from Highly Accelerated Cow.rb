use_bpm 80

set :end, false

in_thread do
  sleep 19.9
  set :end, true
  sleep 0.1
  sample :vinyl_scratch, amp: 5.0
  
  with_fx :krush, gain: 10 do
    live_loop :bg_melody_new do
      use_synth :tri
      play (choose chord :C3, :major7), release: 0.5, amp: 0.8
      sleep 0.2
    end
    
    live_loop :bg_melody2_new do
      use_synth :beep
      play (choose chord :C4, :major7), release: 0.5, amp: 0.8
      sleep 0.2
    end
  end
  
  live_loop :drums_new do
    sample choose sample_names :bd
    sleep 0.2
  end
end

with_fx :reverb, room: 1.0 do
  live_loop :bg_melody do
    use_synth :mod_tri
    play :C3, release: 2.0, amp: 0.8, mod_range: tick + 1
    sleep 2.0
    stop if get :end
  end
  
  time_warp 1.0 do
    live_loop :bg_melody2 do
      use_synth :mod_sine
      play :C4, release: 2.0, amp: 0.8, mod_range: tick + 1
      sleep 2.0
      stop if get :end
    end
  end
  
  live_loop :noise do
    synth :pnoise, release: 0.0, sustain: 2.0, amp: 0.1
    sleep 2.0
    stop if get :end
  end
end
