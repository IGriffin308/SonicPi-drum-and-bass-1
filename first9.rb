use_bpm 172

song = [0, 0, 1, 1, 2, 2, 2, 2]
songslp = 0.015625
a = [1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0]
b = [0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0]
c = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0]
d = [0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0]
e = [0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0]
f = [1,0,0,1,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,1,0,1,1,0,0,1,1,1,1,1]
g = [0.75,0,0,1,0,0.8,0,0,0.75,0,0,1.05,0,0.8,0,0,0.75,0,0,1.1,0,0.9,0,2,0.75,0,0,1.5,1.5,1.5,2,2]
h = [65,0,0,55,0,50,0,0,70,0,0,60,0,50,0,0,70,0,0,70,0,80,0,50,80,0,0,70,75,80,70,60]
l = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
m = [0.5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
n = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]



live_loop :drum1 do
  8.times do |s|
    32.times do |i|
      sample :bd_tek if a[i] == 1 && song[s] != 0
      sample :drum_heavy_kick, rate: 1.2 if a[i] == 1 && song[s] != 0
      sample :loop_amen, finish: 0.12, rate: 1.5 if a[i] == 1
      sample :elec_hi_snare, rate: 1.2 if b[i] == 1 && song[s] != 0
      sample :perc_snap, rate: 1.2 if b[i] == 1 && song[s] != 0
      sample :loop_amen, start: 0.25, finish: 0.35, rate: 1.5 if b[i] == 1
      sample :drum_cymbal_closed, rate: 1.5 if c[i] == 1
      sample :drum_cymbal_open, amp: 0.3, rate: 1.2, finish: 0.1 if d[i] == 1
      sample :loop_amen, start: 0.42, finish: 0.55, rate: 1.5 if e[i] == 1
      with_fx :distortion, amp: 0.8 - (a[i] / 2), distort: 0.5 do
        with_fx :rlpf, cutoff: h[i], res: 0.5 do
          sample :bass_dnb_f, rate: g[i], finish: 0.45 if f[i] == 1 && song[s] == 2
        end
      end
      sample :ambi_glass_hum, rate: m[i] * (1 + s / 2), finish: 1 - m[i] + song[s] / 3, amp: 0.6 if l[i] == 1 && song[s] != 2 && song[s] !=3
      sample :ambi_lunar_land, amp: 0.2 if n[i] == 1 && s % 2 == 0 && song[s] % 2 == 0
      sample :ambi_lunar_land, amp: 0.2, rate: -1, start: 0.1, finish: 0.8 if n[i] == 1 && s % 2 == 1 && song[s] % 2 == 1
      sleep 0.5
    end
    sleep 0.0078125
  end
end