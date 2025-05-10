(list
  (channel
    (name 'guix)
    (url "https://codeberg.org/guix/guix-mirror.git")
    (introduction
     (make-channel-introduction
      "207cba8114d354737b231e510d6110ea2a42e07b"
      (openpgp-fingerprint "AD17 A21E F8AE D8F1 CC02 DBD9 F7D5 C9BF 765C 61E3"))))

  (channel
    (name 'agx)
    (url "https://codeberg.org/agx-r/agx-guix-packages.git")
    (branch "main")
    (introduction
     (make-channel-introduction
      "0a6542d6ad83bf0fdd3a520749b25c0f58b9da0a"
      (openpgp-fingerprint "8313 EBF3 38E1 F49B 69B4  5479 7630 358C BD87 7E27")))))
