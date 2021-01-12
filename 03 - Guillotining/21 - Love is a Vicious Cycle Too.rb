# Welcome to Sonic Pi

live_loop :drums do
  sample :loop_amen, rate: (rrand 0.125, 1.5), amp: (rrand 0.5, 0.8)
  sleep rrand(0.5, 0.8)
end

live_loop :choir do
  # play choose([:C, :D, :E, :F, :G, :A, :B])
  sample :ambi_choir, rate: (rrand 0.3, 1.0), amp: (rrand 0.8, 1.0)
  sleep rrand(0.1, 0.5)
end

i = 0.001
live_loop :choir2 do
  # play choose([:C, :D, :E, :F, :G, :A, :B])
  sample :ambi_drone, rate: i, amp: 0.8 - (i / 4.0)
  i = (i + (rrand 0.01, 0.1)) % 2.0
  sleep 0.1
end

