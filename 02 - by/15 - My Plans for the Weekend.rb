print scale :F3, :minor
melody = [[58, 0.5], [65, 0.5], [63, 0.5],
          [61, 0.25], [63, 0.25], [65, 0.5], [61, 0.5], [58, 0.5], [56, 1.0],
          [58, 0.5], [65, 0.5], [63, 0.5],
          [61, 0.25], [63, 0.25], [65, 0.5], [61, 0.5], [58, 0.5], [61, 1.0]]

set :glitch_div, 100

with_fx :distortion do |d|
  live_loop :melody do
    for note in melody
      glitch_div = get :glitch_div
      use_synth :beep
      use_synth :pnoise if one_in(glitch_div)
      
      control d, distort: 0.0
      control d, distort: 0.9 if one_in(glitch_div)
      
      play note[0], release: note[1] * 2
      play (chord note[0], :minor7), release: note[1] * 2 if one_in(glitch_div)
      play note[0]*1.5, release: note[1] * 2 if one_in(glitch_div)
      sample (choose sample_names :glitch) if one_in(glitch_div)
      
      if one_in(glitch_div)
        sleep 0.1
      else
        sleep note[1]
        sleep 1.0 if one_in(glitch_div)
      end
    end
  end
end

live_loop :glitch_div_setter do
  for i in range(30, 10, 5)
    set :glitch_div, i
    sleep 1
  end
  for i in range(10, 1)
    set :glitch_div, i
    sleep 10
  end
end