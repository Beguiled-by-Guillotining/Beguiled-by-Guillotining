# This uses my own samples. They are not included here. You can still look at the structure of the code or try it with your own samples

beats = 0.2

live_loop :drums do
  (rrand_i 1, 4).times do
    sample "...", onset: tick(:a), amp: 3.0 # Path to sample 1 here
    sample "...", onset: tick(:b), amp: 3.0 # Path to sample 2 here
    
    sample [:drum_tom_mid_soft, :drum_tom_mid_hard, :drum_tom_lo_soft,
            :drum_tom_lo_hard, :drum_tom_hi_soft, :drum_tom_hi_hard].choose, amp: 0.2
    sleep beats
  end
end