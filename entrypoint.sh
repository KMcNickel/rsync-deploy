#!/bin/sh

# Set deploy key
SSH_PATH="$HOME/.ssh"
mkdir "$SSH_PATH"
echo "$DEPLOY_KEY" > "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key"

echo $GITHUB_WORKSPACE

# Do deployment
sh -c "rsync $INPUT_OPTIONS -e 'ssh -i $SSH_PATH/deploy_key -o StrictHostKeyChecking=no' $GITHUB_WORKSPACE/$INPUT_SOURCE $INPUT_USER@$INPUT_HOST:$INPUT_TARGET"
