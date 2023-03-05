if which gcloud > /dev/null; then
  source "$(gcloud --format='value(installation.sdk_root)' info)/path.zsh.inc"
  source "$(gcloud --format='value(installation.sdk_root)' info)/completion.zsh.inc"
fi

if [[ -v WSLENV ]]; then
  eval `keychain --agents ssh --eval id_rsa`
fi
