[de new-fvec (Length)  # fvec_t* 
# buffer creation function
  (native "libaubio.so" "new_fvec" 'N
    Lenght ) ]

[de del-fvec (Vector)  # void
# buffer deletion function
  (native "libaubio.so" "del_fvec" NIL
    Vector ) ]

[de fvec-copy (Src V)  # void
### make a copy of a vector
# Src - source vector
# V - vector to copy to
  (native "libaubio.so" "fvec_copy" NIL
    Src V ) ]

[de fvec-get-data (V)  # source vector
# read data from buffer 
  (native "libaubio.so" "fvec_get_data" 'N
    V ) ]

[de fvec-get-sample (V Pos)  # vector, position
# read sample value in buffer
  (native "libaubio.so" "fvec_get_sample" 'N
    V Pos ) ]

[de fvec-rev (V)
# revert order of vector elements
  (native "libaubio.so" "fvec_rev" NIL
    V ) ]

[de fvec-set-all (V Value)
# set all elements to a given value
  (native "libaubio.so" "fvec_set_all" NIL
    V Value) ]

[de fvec-set-sample  # void 
# write sample value in a buffer
  ( V  # vector to write to
    Data  # value to write in V->Data[Pos]
    Pos )  # sample position to write to 
  (native "libaubio.so" "fvec_set_sample" NIL
    V Data Pos ) ]

[de fvec-weight (V Weight)
# apply weight to a vector
## If the weight vector is longer that V,
## only the first elements are used.
## If shorter, the last elements of V are not weighted.
  (native "libaubio.so" "fvec_weight" NIL
    V Weight ) ]

[de fvec-zeros (V)
# set all elements to zero
  (native "libaubio.so" "fvec_zeros" NIL
    V ) ]

[de fvec-ones (V)
# set all elements to ones
  (native "libaubio.so" "fvec_ones" NIL
    V ) ]

[de fvec-print (V)
# print out fvec data 
  (native "libaubio.so" "fvec_print" NIL
    V ) ]

[de fvec-rev 
