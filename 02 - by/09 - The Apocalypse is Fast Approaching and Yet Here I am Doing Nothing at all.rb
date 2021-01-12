with_fx :ixi_techno, phase: 8, mix: 0.7 do
  live_loop :bass do
    density (rrand_i 1, 4) do
      3.times do
        use_synth :chipbass
        play (chord :E3, :minor).tick
        sleep 0.5
      end
    end
  end
end

with_fx :ixi_techno, phase_offset: 0.5, phase: 8, mix: 0.7 do
  live_loop :main do
    use_synth :chiplead
    play (scale :E3, :minor).choose, amp: (rrand 0.6, 0.8)
    sleep 0.5
  end
end

live_loop :noise do
  use_synth :hollow
  play (chord :E2, :minor).choose, amp: 0.05, sustain: 2.0, norm: 1
  play (chord :E2, :minor).choose, amp: 0.1, sustain: 2.0, noise: 0, norm: 1
  sleep 2.0
end

live_loop :drums do
  sample [:perc_snap, :perc_snap2].choose, amp: 0.5, rpitch: (rrand -1, 1)
  sleep [0.25, 0.5, 0.5].choose
end