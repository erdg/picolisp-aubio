# buffer creation function
[de new-fvec (Length)  # fvec_t* 
  (native "libaubio.so" "new_fvec" 'N
    Lenght ]

# buffer deletion function
[de del-fvec (Vector)  # void
  (native "libaubio.so" "del_fvec" NIL
    Vector ]

# make a copy of a vector
[de fvec-copy (Src V)  # void
  (native "libaubio.so" "fvec_copy" NIL
    Src V ]

# read data from buffer 
[de fvec-get-data (V)
  (native "libaubio.so" "fvec_get_data" 'N
    V ]

# read sample value in buffer
[de fvec-get-sample (V Position)
  (native "libaubio.so" "fvec_get_sample" 'N
    V Position ]

# revert order of vector elements
[de fvec-rev (V)
  (native "libaubio.so" "fvec_rev" NIL
    V ]

# set all elements to a given value
[de fvec-set-all (V Value)
  (native "libaubio.so" "fvec_set_all" NIL
    V Value ]

# write sample value in a buffer
[de fvec-set-sample (V Data Position)  
  (native "libaubio.so" "fvec_set_sample" NIL
    V Data Position ]

# apply weight to a vector
[de fvec-weight (V Weight)
## If the weight vector is longer that V,
## only the first elements are used.
## If shorter, the last elements of V are not weighted.
  (native "libaubio.so" "fvec_weight" NIL
    V Weight ]

# set all elements to zero
[de fvec-zeros (V)
  (native "libaubio.so" "fvec_zeros" NIL
    V ]

# set all elements to ones
[de fvec-ones (V)
  (native "libaubio.so" "fvec_ones" NIL
    V ]

# print out fvec data 
[de fvec-print (V)
  (native "libaubio.so" "fvec_print" NIL
    V ]

# revert order of vector elements
[de fvec-rev (V)
  (native "libaubio.so" "fvec_rev" NIL
    V ]
