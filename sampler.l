[de new-aubio-sampler (SampleRate HopSize)
  (native 
    "libaubio.so" "new_aubio_sampler" 'N
    SampleRate HopSize ]

[de del-aubio-sampler (Sampler)
  (native
    "libaubio.so" "del_aubio_sampler" NIL
    Sampler ]

[de aubio-sampler-load (Sampler Uri)
  (native
    "libaubio.so" "aubio_sampler_load" 'I
    Sampler Uri ]

[de aubio-sampler-do (Sampler In Out)
  (native
    "libaubio.so" "aubio_sampler_do" NIL
    Sampler In Out ]

[de aubio-sampler-do-multi (Sampler In Out)
  (native
    "libaubio.so" "aubio_sampler_do_multi" NIL
    Sampler In Out ]

[de aubio-sampler-play (Sampler)
  (native
    "libaubio.so" "aubio_sampler_play" 'I
    Sampler ]

# 0 for not playing, 1 for playing
[de aubio-sampler-set-playing (Sampler Playing)
  (native
    "libaubio.so" "aubio_sampler_set_playing" 'I
    Sampler Playing ]

# 0 if not playing, 1 if playing    
[de aubio-sampler-get-playing (Sampler)
  (native
    "libaubio.so" "aubio_sampler_get_playing" 'I
    Sampler ]

[de aubio-sampler-stop (Sampler)
  (native
    "libaubio.so" "aubio_sampler_stop" 'I
    Sampler ]

