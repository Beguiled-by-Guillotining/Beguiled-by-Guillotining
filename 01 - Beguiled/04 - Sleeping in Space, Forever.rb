set :bpm, 60
use_bpm get :bpm

live_loop :main do
  use_bpm get :bpm
  use_synth :zawa
  use_synth_defaults amp: 1.0, range: 12, phase: 0.4, wave: 3,
    release: 4.0, res: 0.0, cutoff: 75
  
  notes = shuffle (chord :A3, :minor7)
  play notes[0]
  play notes[1], invert_wave: 1
  sleep 2.0
end

with_fx :reverb, room: 1.0, mix: 0.9 do
  live_loop :bg_melody do
    use_bpm get :bpm
    params = [[:mod_sine, 0.8], [:mod_tri, 0.2], [:mod_fm, 0.5]].choose
    use_synth params[0]
    play (choose chord :A3, :minor), amp: params[1] + (rrand 0.0, 0.1),
      mod_phase: [0.3,0.5].choose, release: 2.0
    sleep [1.0, 2.0].choose
  end
end

live_loop :bpm_setter do
  if current_bpm <= 1
    set :bpm, Float(get :bpm) / 2
  else
    set :bpm, (get :bpm) - 1
  end
  use_bpm get :bpm
  sleep 2.0
end