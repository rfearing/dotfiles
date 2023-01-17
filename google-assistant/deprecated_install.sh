# Modified from: github.com/googlesamples/assistant-sdk-python/tree/master/google-assistant-sdk/googlesamples/assistant/grpc

# Set up Pythyon Virtual Environment (need to use python3.9)
python3.9 -m venv ~/.dotfiles/.dot_env
~/.dotfiles/.dot_env/bin/python -m pip install --upgrade pip setuptools wheel
source ~/.dotfiles/.dot_env/bin/activate

# Once, I had to re-install google-assistant-grpc, leaving here as a reminder:
# pip install --upgrade google-assistant-grpc

# Install Google Assistant
python -m pip install --upgrade -r ~/.dotfiles/google-assistant/requirements.txt

# Credentials Save to: ~/Library/Application\ Support/google-oauthlib-tool/credentials.json
google-oauthlib-tool --client-secrets ~/.dotfiles/google-assistant/.nocommit.client-secret.json --scope https://www.googleapis.com/auth/assistant-sdk-prototype --save --headless

# Device ID = macbook-pro
# Register Device / Ovwerwrite Device with ID: 'macbook-pro'
googlesamples-assistant-devicetool --project-id 'mac-terminal-57734' register-device --device 'macbook-pro' --model 'mac-terminal-57734-my-macbook-xwpctu' --client-type='SERVICE'