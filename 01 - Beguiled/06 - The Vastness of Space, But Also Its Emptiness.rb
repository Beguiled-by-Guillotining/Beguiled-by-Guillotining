# This uses the distortedGuitar synth from https://github.com/SCLOrkHub/SCLOrkSynths
# To run this, you need to download and compile the SynthDef and specify the folder below

load_synthdefs '...' # Path to folder which contains distortedGuitar.scsyndef here

live_loop :bg do
  use_synth :gnoise
  time = (rrand 0.8, 1.0)
  play 30, amp: 0.2, sustain: time, cutoff: 90, release: 0
  play 130, amp: 0.1, sustain: time, cutoff: 130, release: 0
  sleep time
end

define :backing_guitar do |note|
  set :backing, true
  in_thread do
    use_synth 'distortedGuitar'
    play freq: (midi_to_hz note), rel: 10.0, muteSus: 6.0, coef: 0.5, amp: 0.05
    sleep 3.0
    set :backing, false
  end
end

set :backing, false
live_loop :main_guitar do
  use_synth 'distortedGuitar'
  len = choose [2.0, 1.0, 1.0, 0.5, 0.5, 0.5, 0.25]
  cur_note = choose chord :C4, :minor
  play freq: (midi_to_hz cur_note), rel: 20 * len, muteSus: 20 * len, coef: 0.5
  sleep len
  if not get :backing
    backing_guitar cur_note - 24 #2 octaves down
  end
end