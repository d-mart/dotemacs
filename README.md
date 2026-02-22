# dotemacs

Personal Emacs configuration, organized as a modular `.emacs.d` tree.

## Overview

- Main entrypoint: `.emacs.d/init.el`
- Modular config files: `.emacs.d/init.d/*.el` (loaded in filename sort order)
- Optional machine-specific overrides:
  - `.emacs.d/local-init.d/*.el` (loaded after `init.d`)
  - `.emacs.d/host-overrides.el` (loaded last, git-ignored)
- Utility/helper functions:
  - `.emacs.d/misc-utils.el`
  - `.emacs.d/my-misc-utils.el`
  - `.emacs.d/my-misc-advice.el`

The numeric prefixes in `init.d` define load order (for example `040-...` before `700-...`).

## Deploy Script

Repo includes `deploy.sh` to install this config into a target directory (default: `$HOME`) by symlink or copy.

### Common usage

```bash
# symlink into ~/ (backs up existing ~/.emacs and ~/.emacs.d)
./deploy.sh -s

# copy into a separate target directory
./deploy.sh -c -t /tmp/emacs_test
```

### Options

- `-s` / `-l`: symlink mode
- `-c`: copy mode
- `-t <dir>`: target directory
- `-g <sha-or-ref>`: checkout a specific git ref before deploy
- `-x`: launch Emacs after deploy

### Important notes

- `-g` performs `git checkout` in this repo and can change your working tree state.
- Script creates one-level backups:
  - `~/.emacs.bak`
  - `~/.emacs.d.bak`

## Tests

Two lightweight checks are included under `test/`.

### 1) Parse smoke test

Reads/parses all `.el` files under `.emacs.d` and fails on read errors.

```bash
emacs -Q --batch -l test/smoke-parse-config.el
```

### 2) ERT tests

Runs targeted utility/config contract tests in `test/utils-tests.el`.

```bash
emacs -Q --batch -L test -l test/run-tests.el
```

### Run both locally

```bash
emacs -Q --batch -l test/smoke-parse-config.el && \
emacs -Q --batch -L test -l test/run-tests.el
```

## GitLab Pipeline

Pipeline config is in `.gitlab-ci.yml`.

- Image: `ubuntu:latest`
- Stage: `test`
- Job: `emacs-config-tests`
- Installs `emacs-nox`, then runs:
  1. `emacs --version`
  2. `emacs -Q --batch -l test/smoke-parse-config.el`
  3. `emacs -Q --batch -L test -l test/run-tests.el`

The pipeline fails on non-zero exit status from either test command.

