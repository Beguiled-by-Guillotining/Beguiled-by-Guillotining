fxs = fx_names.to_a
fxs.delete(:record)
fxs.delete(:sound_out)
fxs.delete(:sound_out_stereo)

synths = synth_names.to_a
synths.delete(:sound_in)
synths.delete(:sound_in_stereo)

fight_phase = 60.0
base_time = 0.15
bat_swarms = 50

with_fx :tremolo, depth: 1.0, phase: fight_phase, wave: 4 do
  live_loop :bats do
    multi = [0.5, 2.0].choose
    at (range 0, bat_swarms * base_time, base_time) do
      with_fx choose fxs do
        sleep base_time
        synth (choose synths), note: :C4, sustain: 0.0, release: base_time * multi, amp: 2.0
      end
    end
    sleep bat_swarms * base_time
  end
end

with_fx :tremolo, phase_offset: 1.0, depth: 1.0, phase: fight_phase, wave: 4 do
  live_loop :bastion do
    use_synth :fm
    play [:C5, (choose chord :C5, :minor)].choose, release: 4.0, amp: 0.3, divisor: 8, depth: 4
    sleep base_time * [4, 8, 8].choose
  end
end

live_loop :bg2 do
  use_synth :growl
  play (choose chord :C3, :minor), amp: 0.5, release: 4.0
  sleep base_time * 16
end

live_loop :bg do
  use_synth :pulse
  play (choose chord :C3, :minor), amp: 0.1, pulse_width: 0.1, release: 4.0
  sleep base_time * [8, 16].choose
end