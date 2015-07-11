# aubio.l 
#
# The MIT License (MIT)
#
# Copyright (c) 2015, Erik Gustafson


(symbols 'aubio 'pico)

# syms local to namespace
(local *Aubio)
(local
  ffi-table
  chop-ffi
  ffi )

#[load (pack (car (file)) "module.l"]


[setq 
  *Aubio  "libaubio.so" ]


# ffi-bindings, courtesy of Alex Williams 
[de chop-ffi (Name)
  (glue "_" (split (chop Name) "-") ]

[de ffi (Fun . @)
  (let Rule (assoc Fun ffi-table)
    (pass native `*Aubio (chop-ffi (car Rule)) (eval (cadr Rule))) ]

[de ffi-table
  
### data structures

## cvec_t -- vector of complex data, stored in polar coordinates.
#
# typedef struct {
#   uint_t length;
#   smpl_t *norm;
#   smpl_t *phas;
# } cvec_t;
                              ## args
  (new-cvec             'N)   # uint_t length
  (del-cvec             NIL)  # cvec_t *vec
  (cvec-norm-set-sample NIL)  # cvec_t *vec, smpl_t val, uint_t position
  (cvec-phas-set-sample NIL) 
  (cvec-norm-get-sample -1.0) # cvec_t *vec, uint_t position
  (cvec-phas-get-sample -1.0) 

# need helper fn to extract struct vals
  (cvec-norm-get-data   'N)   # cvec_t *vec
  (cvec-phas-get-data   'N)   
  
  (cvec-print           NIL)  # cvec_t *vec
  (cvec-copy            NIL)  # cvec_t *source, cvec_t *target
  (cvec-norm-zeros      NIL)  # cvec_t *vec
  (cvec-phas-zeros      NIL)  # cvec_t *vec
  (cvec-norm-ones       NIL)  # cvec_t *vec
  (cvec-phas-ones       NIL)  # cvec_t *vec
  (cvec-zeros           NIL)  # cvec_t *vec
  (cvec-norm-set-all    NIL)  # cvec_t *vec, smpl_t val
  (cvec-phas-set-all    NIL)


## fmat_t -- buffer for real data
#
# typedef struct {
#   uint_t length;
#   uint_t height;
#   smpl_t **data;  // data array of size [length] * [height]
# } fmat_t;   
  
  (new-fmat             'N)   # uint_t height, uint_t length
  (del-fmat             NIL)  # fmat_t *matrix
  (fmat-get-sample      -1.0) # fmat_t *matrix, uint_t channel, uint_t position
  (fmat-set-sample      NIL)  # fmat_t *matrix, smpl_t data, uint_t channel, uint_t position
  (fmat-get-channel     NIL)  # fmat_t *matrix, uint_t channel, fvec_t *output

# need helper fn to extract struct vals
  (fmat-get-channel-data  'N) # fmat_t *matrix, uint_t channel
  (fmat-get-data          'N) # fmat_t *matrix

  (fmat-set             NIL)  # fmat_t *matrix, smpl_t value
  (fmat-zeros           NIL)  # fmat_t *matrix
  (fmat-ones            NIL)  # fmat_t *matrix
  (fmat-rev             NIL)  # fmat_t *matrix
  (fmat-weight          NIL)  # fmat_t *matrix, fmat_t *weight
  (fmat-print           NIL)  # fmat_t *matrix
  (fmat-copy            NIL)  # fmat_t *source, fmat_t *target


## fvec_t -- vector of real-valued data
#
# typedef struct {
#   uint_t length;
#   smpl_t *data;
# } fvec_t;

  (new-fvec             'N)   # uint_t length
  (del-fvec             NIL)  # fvec_t *vector
  (fvec-get-sample      -1.0) # fvec_t *vector, uint_t position
  (fvec-set-sample      NIL)  # fvec_t *vector, smpl_t data, uint_t position

# need helper fn to extract struct vals
  (fvec-get-data        'N)   # fvec_t *vector

  (fvec-print           NIL)  # fvec_t *vector
  (fvec-set-all         NIL)  # fvec_t *vector, smpl_t value
  (fvec-zeros           NIL)  # fvec_t *vector
  (fvec-ones            NIL)  # fvec_t *vector 
  (fvec-rev             NIL)  # fvec_t *vector
  (fvec-weight          NIL)  # fvec_t *vector, fvec_t *weight
  (fvec-copy            NIL)  # fvec_t *source, fvec_t *target


## lvec_t -- vector of real-valued data in double precision
#
# typedef struct {
#   uint_t length;
#   lsmp_t *data;
# } lvec_t;
  
  (new-lvec             'N)   # uint_t length
  (del-lvec             NIL)  # lvec_t *vector
  (lvec-get-sample      1.0)  # lvec_t *vector, uint_t position
  (lvec-set-sample      NIL)  # lvec_t *vector, lsmp_t data, uint_t position

# need helper fn to extract struct vals
  (lvec-get-data        'N)   # lvec_t *vector

  (lvec-print           NIL)  # lvec_t *vector
  (lvec-set-all         NIL)  # lvec_t *vector, smpl_t value
  (lvec-zeros           NIL)  # lvec_t *vector
  (lvec-ones            NIL)  # lvec_t *vector


## aubio_fft_t -- fast fourier transform object
  (new-aubio-fft            'N)   # uint_t size
  (del-aubio-fft            NIL)  # aubio_fft_t *fft
  (aubio-fft-do             NIL)  # aubio_fft_t *fft, fvec_t *input, cvec_t *spectrum
  (aubio-fft-rdo            NIL)  # aubio_fft_t *fft, cvec_t *spectrum, fvec_t *output
  (aubio-fft-do-complex     NIL)  # aubio_fft_t *fft, fvec_t *input, fvec_t *compspec
  (aubio-fft-rdo-complex    NIL)  # aubio_fft_t *fft, fvec_t *compspec, fvec_t *output
  (aubio-fft-get-spectrum   NIL)  # fvec_t *compspec, cvec_t *spectrum
  (aubio-fft-get-realimag   NIL)  # cvec_t *spectrum, fvec_t *compspec
  (aubio-fft-get-phas       NIL)  # fvec_t *compspec, cvec_t *spectrum
  (aubio-fft-get-imag       NIL)  # cvec_t *spectrum, fvec_t *compspec
  (aubio-fft-get-norm       NIL)  # fvec_t *compspec, cvec_t *spectrum
  (aubio-fft-get-real       NIL)  # cvec_t *spectrum, fvec_t *compspec

## aubio_source_t -- media source to read blocks of consecutive audio samples from file
  (new-aubio-source             'N)   # char_t *uri, uint_t samplerate, uint_t hop_size
  (del-aubio-source             NIL)  # aubio_source_t *source
  (aubio-source-do              NIL)  # aubio_source_t *source, fvec_t *read_to, uint_t frames_read
  (aubio-source-do-multi        NIL)  # aubio_source_t *source, fmat_t *read_to, uint_t frames_read
  (aubio-source-get-samplerate  'I)   # aubio_source_t *source
  (aubio-source-get-channels    'I)   # aubio_source_t *source
  (aubio-source-seek            'I)   # aubio_source_t *source, uint_t position
  (aubio-source-close           NIL)  # aubio_source_t *source 
]



