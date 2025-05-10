(list
  (channel
    (name 'guix)
    (url "https://codeberg.org/guix/guix-mirror.git")
    (introduction
     (make-channel-introduction
      "207cba8114d354737b231e510d6110ea2a42e07b"
      (openpgp-fingerprint "AD17 A21E F8AE D8F1 CC02 DBD9 F7D5 C9BF 765C 61E3"))))

  (channel
    (name 'agxr)
    (url "https://codeberg.org/agx-r/agx-guix-channel.git")
    (branch "main")
    (introduction
     (make-channel-introduction
      "c2ed312b6cdc3e3f76f0f1391d2d7830f2c7a34f"
      (openpgp-fingerprint "8313 EBF3 38E1 F49B 69B4 5479 7630 358C BD87 7E27")))))
