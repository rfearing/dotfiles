function google_assistant() {
	source ~/.dotfiles/.dot_env/bin/activate
	python ~/.dotfiles/google-assistant/text_to_assistant.py --device-id 'macbook-pro' --device-model-id 'mac-terminal-57734-my-macbook-xwpctu' --assistant-command "$1"
}

alias bed_on="google_assistant 'Turn on the bedroom lights'"
alias bed_off="google_assistant 'Turn off the bedroom lights'"
alias office_on="google_assistant 'Turn on the office overhead light'"
alias office_off="google_assistant 'Turn off the office overhead light'"
