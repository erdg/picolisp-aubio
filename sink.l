[de new-aubio-sink (Uri Smpl-rate)
  (native "libaubio.so" "new_aubio_sink" 'N
    Uri
    Smpl-rate ]

[de aubio-sink-get-samplerate (Sink)
  (native "libaubio.so" "aubio_sink_get_samplerate" 'I
    Sink ]
    
[de aubio-sink-get-channels (Sink)
  (native "libaubio.so" "aubio_sink_get_channels" 'I
    Sink ]
