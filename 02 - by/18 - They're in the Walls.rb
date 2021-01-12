# This uses microphone input. To record some comment this code back in and comment it out again, once you like what you recorded.

##| with_fx :record, buffer: :b do
##|   synth :sound_in, sustain: 5.0, release: 0.0, amp: 5
##|   sleep 5.0
##| end

with_fx :reverb, room: 1.0 do
  live_loop :loop do
    sample buffer(:b), amp: 5, onset: pick
    sleep 0.2
  end
end

live_loop :notes do
  synth :beep, note: (choose chord :A3, :minor7)
  synth :growl, note: (choose chord :A3, :minor7)
  sleep 0.2
end

live_loop :samp do
  sample choose sample_names :ambi
  sleep 0.2 * (rrand_i 5, 20)
end