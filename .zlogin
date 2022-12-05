source "$(gcloud --format='value(installation.sdk_root)' info)/path.zsh.inc"
source "$(gcloud --format='value(installation.sdk_root)' info)/completion.zsh.inc"

if [[ -v WSLENV ]]; then
  eval `keychain --agents ssh --eval id_rsa`
fi
