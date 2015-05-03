
# If 0 passed as SampleRate, the sample rate of the original file is used.
[de new-aubio-source (Uri SampleRate HopSize)  # aubio_source_t*
  (native 
    "libaubio.so" "new_aubio_source" 'N
    Uri SampleRate HopSize ]

[de aubio-source-close (Src)
  (native 
    "libaubio.so" "aubio_source_close" 'I
    Src ]

[de aubio-source-do (Src ReadTo Read)
  (native 
    "libaubio.so" "aubio_source_do" NIL
    Src ReadTo Read ] 

[de aubio-source-do-multi (Src ReadTo Read)
  (native
    "libaubio.so" "aubio_source_do_multi" NIL
    Src ReadTo Read ]

[de aubio-source-get-channels (Src)
  (native 
    "libaubio.so" "aubio_source_get_channels" 'I
    Src ]

[de aubio-source-get-samplerate (Src)
  (native
    "libaubio.so" "aubio_source_get_samplerate" 'I
    Src ]

[de aubio-source-seek (Src Position) 
  (native
    "libaubio.so" "aubio_source_seek" 'I
    Src Position ]
