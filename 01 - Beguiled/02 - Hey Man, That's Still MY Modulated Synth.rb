
with_debug false do
  live_loop :drums do
    sample choose sample_names :perc
    sleep [1.0, 0.5].choose
  end
  
  live_loop :bg_melody do
    use_synth :hoover
    play (choose chord :C3, :minor), amp: 0.6, slide: 0.5
    control note: (choose chord :C3, :minor)
    sleep 0.5
  end
end

with_fx :reverb, room: 1.0 do
  live_loop :melody do
    use_synth [:mod_sine, :mod_tri, :mod_saw, :mod_pulse, :mod_fm, :mod_dsaw, :mod_beep].choose
    play (choose chord :C4, :minor), amp: 0.8, mod_phase: 0.5, release: 2.0
    sleep [1.0, 2.0].choose
  end
end