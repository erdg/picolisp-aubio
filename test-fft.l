(load "@lib/math.l")

(de test-fft ()
  (let [WindowSize 8
        In       (ffi 'new-fvec WindowSize)
        FFTgrain (ffi 'new-cvec WindowSize)
        Out      (ffi 'new-fvec WindowSize)
        FFT      (ffi 'new-aubio-fft WindowSize) ]

    (for (N 0 (< N WindowSize) (inc N))
      (ffi 'fvec-set-sample In (cons (rand 1000000 9000000) -1.0) N) )
    (ffi 'aubio-fft-do FFT In FFTgrain)
    (ffi 'cvec-print FFTgrain)
    (ffi 'aubio-fft-rdo FFT FFTgrain Out)
    (ffi 'fvec-print Out)

    (ffi 'del-aubio-fft FFT)
    (ffi 'del-fvec In)
    (ffi 'del-cvec FFTgrain)
    (ffi 'del-fvec Out) ) )

        
