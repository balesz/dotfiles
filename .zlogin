source "$(gcloud --format='value(installation.sdk_root)' info)/path.zsh.inc"
source "$(gcloud --format='value(installation.sdk_root)' info)/completion.zsh.inc"

eval "$(ssh-agent -s)"
eval `keychain --agents ssh --eval id_rsa`

