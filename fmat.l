[de new-fmat (Height Length)
  (native
    "libaubio.so" "new_fmat" 'N
    Height Length ]

[de del-fmat (S)
  (native
    "libaubio.so" "del_fmat" NIL
    S ]

[de fmat-get-sample (S Channel Position)
  (native 
    "libaubio.so" "fmat_get_sample" -1.0
    S Channel Position ]

[de fmat-set-sample (S Channel Position)
  (native
    "libaubio.so" "fmat_set_sample" NIL
    S Channel Position ]
