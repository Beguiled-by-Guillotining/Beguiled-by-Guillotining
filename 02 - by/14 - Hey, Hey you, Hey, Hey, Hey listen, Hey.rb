live_loop :drums do
  with_swing 0.1 do
    sample choose sample_names :tabla
  end
  sleep 0.2
end


live_loop :main do
  use_synth :square
  with_fx :krush, gain: 2 do
    with_swing 0.1, 8 do
      play (choose chord :C4, :madd2), amp: 0.6 if !(factor? tick, 16)
    end
    sleep 0.2
  end
end

live_loop :main2 do
  use_synth :fm
  play (choose chord :C4, :madd2, invert: -5), amp: 2.0
  sleep [0.4, 0.4, 0.4, 0.6].tick
end

live_loop :bg do
  note = (choose chord :C4, :madd2, invert: -5)
  synth :hollow, note: note, amp: 2.0, sustain: 2.0
  synth :growl, note: note, amp: 1.5, sustain: 2.0, res: 0.99
  sleep 2.0
end