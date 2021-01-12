with_debug false do
  live_loop :bg do
    use_synth :gnoise
    time = (rrand 0.8, 1.0)
    play 30, amp: 0.2, sustain: time, cutoff: 90, release: 0
    play 130, amp: 0.1, sustain: time, cutoff: 130, release: 0
    sleep time
  end
  
  live_loop :ambience_notes do
    use_synth :dark_ambience
    time = (rrand 1.0, 4.0)
    play (rrand_i 80, 160), amp: 10.0, attack: time, release: time
    sleep 2*time + (rrand_i 0.1, 2.0)
  end
  
  live_loop :hoover_notes do
    use_synth :hoover
    note = rrand_i 30, 60
    time = rrand 8.0, 16.0
    s = play note, amp: 1.0, attack: time / 2, release: time / 2,
      note_slide: time, note_slide_shape: 4
    note += rrand_i -10, 10
    control s, note: note
    sleep time / 2
  end
  
  live_loop :bg_supersaw_notes do
    use_synth :supersaw
    note = rrand_i 30, 60
    time = rrand 8.0, 16.0
    s = play note, amp: 1.0, attack: time / 2, release: time / 2
    sleep time / 2
  end
end

live_loop :melody do
  cur_scale = scale :C5, :minor, num_octaves: 1.5
  note_index = 8
  notes_in_melody = (rrand_i 5, 20)
  i = 0
  notes_in_melody.times do
    use_synth :supersaw
    if i >= notes_in_melody - 1
      length = (rrand_i 6, 8) / 2.0
    else
      length = (rrand_i 1, 8) / 2.0
    end
    
    play cur_scale[note_index], release: length, amp: (rrand 0.7, 1.3)
    
    if one_in(4)
      note_index += [-1, 1].choose * (rrand_i 3, 5)
    else
      note_index += rrand_i -1, 1
    end
    
    sleep length / 2
    sleep 1.0 if length >= 2.0 and one_in(6)
    i = i + 1
  end
  sleep 2.0
end

