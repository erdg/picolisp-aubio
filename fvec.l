# fvec.l
#
# The MIT License (MIT)
#
# copyright (c) 2015 Erik Gustafson


# fvec -- vector of real-valued data
#
# typedef struct {
#   uint_t length;  // length of vector
#   smpl_t *data;   // data vector of length ::fvec_t.length
# } fvec_t; 

(setq *Aubio "libaubio.so")

(class +Fvec +Entity)
  (rel vec (+Number))   # pointer to struct

#
# new fvec of length Len
#
[dm T (Len)
  (=: vec
      (native `*Aubio "new_fvec" 'N 
        Len ]

[dm del> ()
  (native `*Aubio "del_fvec" NIL
    (: vec) )
  (zap This) ]

#
# get length of buffer
#
[dm length> ()
  (car (struct (: vec) '(I) ]

#
# get sample at position Pos
#
[dm get-sample> (Pos)
  (native `*Aubio "fvec_get_sample" -1.0
    (: vec) Pos ]

#
# return contents of *data as a list
#
[dm get-data> ()
  (let @Len (length> This)   # get length of buffer
    (struct
      (native `*Aubio "fvec_get_data" 'N  # pointer to struct
        (: vec) )
      (fill '(-1.0 . @Len)) ]

#
# set sample at position Pos to value Val
#
[dm set-sample> (Val Pos)
  (native `*Aubio "fvec_set_sample" NIL
    (: vec) Val Pos ]

#
# set all elements to value Val
#
[dm set-all> (Val)
  (native `*Aubio "fvec_set_all" NIL
    (: vec) (cons Val -1.0) ]

#
# print out fvec data
#
[dm print> ()
  (native `*Aubio "fvec_print" NIL
    (: vec) ]

#
# copy fvec
#
[dm copy> () ]

#
# set all elements to zero
#
[dm zeros> ()
  (native `*Aubio "fvec_zeros" NIL
    (: vec) ]

#
# set all elements to one
#
[dm ones> ()
  (native `*Aubio "fvec_ones" NIL
    (: vec) ] 




# buffer creation function
[de new-fvec (Length)  # fvec_t* 
  (native "libaubio.so" "new_fvec" 'N
    Length ]

# buffer deletion function
[de del-fvec (Vec)  # void
  (native "libaubio.so" "del_fvec" NIL
    Vec]

#
# make a copy of a vector Src to Vec
#
[de fvec-copy (Src Vec)  # void
  (native "libaubio.so" "fvec_copy" NIL
    Src Vec ]

#
# read data from buffer 
#
[de fvec-get-data (Vec)
  (let @Len (car (struct Vec '(I)))  # get length of buffer
    (struct
      (native `*Aubio "fvec_get_data" 'N  # pointer to struct 
        Vec )
      (fill '(-1.0 . @Len)) ]

#
# read sample value in buffer
#
[de fvec-get-sample (Vec Position)
  (native "libaubio.so" "fvec_get_sample" -1.0
    Vec Position ]

#
# revert order of vector elements
#
[de fvec-rev (Vec)
  (native "libaubio.so" "fvec_rev" NIL
    Vec ]

#
# set all elements to a given value
#
[de fvec-set-all (Vec Val)
  (native "libaubio.so" "fvec_set_all" NIL
    Vec Val ]

#
# write sample value in a buffer
#
[de fvec-set-sample (Vec Data Position)  
  (native "libaubio.so" "fvec_set_sample" NIL
    Vec Data Position ]

#
# apply weight to a vector
#
[de fvec-weight (Vec Weight)
 (native "libaubio.so" "fvec_weight" NIL
    Vec Weight ]
#
# set all elements to zero
#
[de fvec-zeros (Vec)
  (native "libaubio.so" "fvec_zeros" NIL
    Vec ]

#
# set all elements to ones
#
[de fvec-ones (Vec)
  (native "libaubio.so" "fvec_ones" NIL
    Vec ]

#
# print out fvec data 
#
[de fvec-print (Vec)
  (native "libaubio.so" "fvec_print" NIL
    Vec ]

#
# revert order of vector elements
#
[de fvec-rev (Vec)
  (native "libaubio.so" "fvec_rev" NIL
    Vec ]
