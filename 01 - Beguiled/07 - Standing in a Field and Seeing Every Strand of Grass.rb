live_loop :main do
  synth :chiplead, note: (choose chord :C4, :minor7), amp: 0.4
  synth :chiplead, note: (choose chord :C4, :minor7), amp: 0.4
  sleep [0.2, 0.4].choose
end

live_loop :main2 do
  synth :chipbass, note: (choose chord :C3, :minor7), amp: 0.3
  synth :chipbass, note: (choose chord :C3, :minor7), amp: 0.3
  sleep 0.8
end

live_loop :bg do
  synth :growl, note: (choose chord :C4, :minor7), sustain: 1.6, amp: 0.3
  synth :growl, note: (choose chord :C4, :minor7), sustain: 1.6, amp: 0.3
  sleep 1.6
end

live_loop :bg2 do
  synth :hollow, note: (choose chord :C3, :minor7), sustain: 1.6, amp: 0.5
  synth :hollow, note: (choose chord :C3, :minor7), sustain: 1.6, amp: 0.5
  sleep 1.6
end