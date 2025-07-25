(list
  (channel
   (name 'agxr)
   (url "https://codeberg.org/agx-r/agx-guix-channel.git")
   (branch "main")
   (introduction
    (make-channel-introduction
     "4998e87e911b033c270650d685c1e96695bf81ef"
     (openpgp-fingerprint "8313EBF338E1F49B69B454797630358CBD877E27"))))

  (channel
   (name 'nonguix)
   (url "https://gitlab.com/nonguix/nonguix")
   (introduction
    (make-channel-introduction
     "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
     (openpgp-fingerprint "2A393FFF68F4EF7A3D2912AF6F5120A022FBB2D5"))))

  (channel
   (name 'guix)
   (url "https://codeberg.org/guix/guix-mirror.git")
   (introduction
    (make-channel-introduction
     "207cba8114d354737b231e510d6110ea2a42e07b"
     (openpgp-fingerprint "AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3")))))
