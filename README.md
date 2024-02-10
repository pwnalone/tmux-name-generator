# Tmux Name Generator

This is a plugin that generates a random name for your Tmux session when you do not specify one.

## Screenshots

![Session name #1](screenshots/name-1.png)
![Session name #2](screenshots/name-2.png)
![Session name #3](screenshots/name-3.png)
![Session name #4](screenshots/name-4.png)

## Install

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

Add the following line to your `.tmux.conf`.

```tmux
set -g @plugin 'pwnalone/tmux-name-generator'
```

### Manual Installation

Clone the repo.

```sh
git clone https://github.com/pwnalone/tmux-name-generator ~/.tmux/plugins/tmux-name-generator
```

Add the following line to your `.tmux.conf`.

```tmux
run ~/.tmux/plugins/tmux-name-generator/name_generator.tmux
```

## Usage

That's it! Now, when you start a Tmux session without specifying the name, a random one should be
generated for you.

## Configure

```tmux
# Enable/disable the lhs/rhs of the session name.
set -g @name_generator_use_lhs yes  # lhs = adjective
set -g @name_generator_use_rhs yes  # rhs = noun

# Set a custom separator for the lhs/rhs.
set -g @name_generator_sep '-'
```

### Wordlists

The default wordlists were taken from
[Zellij](https://github.com/zellij-org/zellij/blob/main/src/sessions.rs). If you have your own
wordlists that you would like to use, you can replace [words/lhs.txt](words/lhs.txt) and
[words/rhs.txt](words/rhs.txt) on your local machine.
