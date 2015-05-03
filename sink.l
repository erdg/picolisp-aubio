[de new-aubio-sink (Uri SampleRate)
  (native 
    "libaubio.so" "new_aubio_sink" 'N
    Uri SampleRate ]

[de del-aubio-sink (Sink)
  (native 
    "libaubio.so" "del_aubio_sink" NIL
    Sink ]

[de aubio-sink-get-samplerate (Sink)
  (native 
    "libaubio.so" "aubio_sink_get_samplerate" 'I
    Sink ]
    
[de aubio-sink-get-channels (Sink)
  (native 
    "libaubio.so" "aubio_sink_get_channels" 'I
    Sink ]
