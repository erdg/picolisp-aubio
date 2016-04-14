(de new-fmat (Height Length)
   (native "libaubio.so" "new_fmat" 'N
      Height Length ) )

(de del-fmat (Mat)
   (native "libaubio.so" "del_fmat" NIL
      Mat ) )

(de fmat-get-sample (Mat Channel Position)
   (native "libaubio.so" "fmat_get_sample" -1.0
      Mat Channel Position ) )

(de fmat-set-sample (Mat Data Chan Pos)
   (native "libaubio.so" "fmat_set_sample" NIL
      Mat Data Chan Pos ) )

# FIXME
(de fmat-get-channel (Mat Chan Out)
   (native "libaubio.so" "fmat_get_channel" -1.0
      Mat Chan Out ) )

(de fmat-get-channel-data (Mat Chan)
   (let @Len (car (nth (struct Mat '(I I N)) (inc Chan)))
      (struct 
         (native "libaubio.so" "fmat_get_channel_data" 'N
            Mat Chan )
         (fill '(-1.0 . @Len)) ) ) )

(de fmat-get-data (Mat)
   (let [@Height (cadr (struct Mat '(I I N)))
         @Len    (car  (struct Mat '(I I N))) ]
      (struct
         (native "libaubio.so" "fmat_get_data" 'N
            Mat ) ) ) )

(de fmat-print (M)
   (ifn M
      NIL
      (native "libaubio.so" "fmat_print" NIL
         M ) ) )

(de fmat-set (Mat Val)
   (native "libaubio.so" "fmat_set" NIL
      Mat Val ) )
