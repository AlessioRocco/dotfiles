; Linux-specific git configuration.
; Included by ~/.gitconfig via [include] path = ~/.gitconfig.os
; Stowed from the `linux` package.

[gpg "ssh"]
  ; 1Password CLI SSH signing helper (deb/rpm install location).
  program = "/opt/1Password/op-ssh-sign"
