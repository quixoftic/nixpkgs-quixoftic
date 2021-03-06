self: super:

let

in
{
  # cleverca22's patch for ntpd seccomp fixes. See:
  # https://github.com/ntp-project/ntp/pull/27
  # https://github.com/cleverca22/nixos-configs/blob/535e75d8a875da64c95ba12233432b584a19bef5/ntp_fix.nix
  #
  # I believe this should fix the issues I've been having with ntpd
  # going defunct and not being restarted properly.

  ntp = super.ntp.overrideAttrs (drv: {
    patches = [
      (self.fetchpatch {
        url = "https://github.com/ntp-project/ntp/commit/881e427f3236046466bdb8235edf86e6dfa34391.patch";
        sha256 = "0iqn12m7vzsblqbds5jb57m8cjs30rw8nh2xv8k2g8lbqbyk1k7s"; }) ];
    });
}
