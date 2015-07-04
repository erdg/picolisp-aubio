# cvec.l
#
# The MIT license (MIT)


# vector of complex-valued data, stored in polar coordinates
#
# typedef struct {
#   uint_t length;  // length of buffer = (requested length)/2 + 1
#   smpl_t *norm;
#   smpl_t *phas;
# } cvec_t;

[de new-cvec (Length)
  (native "libaubio.so" "new_cvec" 'N
    Length ]

[de del-cvec (Vec)
  (native "libaubio.so" "del_cvec" NIL
    Vec ]

[de cvec-norm-set-sample (Vec Val Position)
  (native "libaubio.so" "cvec_norm_set_sample" NIL
    Vec Val Position ]

[de cvec-phas-set-sample (Vec Val Position)
  (native "libaubio.so" "cvec_phas_set_sample" NIL
    Vec Val Position ]

[de cvec-norm-get-sample (Vec Position)
  (native "libaubio.so" "cvec_norm_get_sample" -1.0
    Vec Position ]

[de cvec-phas-get-sample (Vec Position)
  (native "libaubio.so" "cvec_phas_get_sample" -1.0
    Vec Position ]

# get length of vector
[de cvec->length (Vec)
  (car (struct Vec '(I))) ]

[de cvec-norm-get-data (Vec)
  (let @Len (cvec->length Vec)
    (struct
      (native "libaubio.so" "cvec_norm_get_data" 'N
        Vec )
      (fill '(-1.0 . @Len)) ]
  
[de cvec-print (Vec)
  (native "libaubio.so" "cvec_print" NIL
    Vec ]

[de cvec-copy (Src Vec) ]

[de cvec-norm-set-all (Vec Val)
  (native "libaubio.so" "cvec_norm_set_all" NIL
    Vec Val ]
