---
description: Open the best matching project file in a tmux window using the nv alias. Usage: /copen <file description>
agent: general
---

The user wants to open a file described as: "$ARGUMENTS".

Follow these steps:

1. Use `grep` and/or `glob` to find files in the current project whose names or contents match the description. Prefer files in `app/`, `config/`, `lib/`, `test/`, `src/`, or the project root.
2. Pick the single best matching file. If the description is ambiguous, prefer the one most clearly related to the user's intent.
3. Determine the correct tmux session for this project. Use the current workspace directory name as the session name if a tmux session with that name exists; otherwise use the project root folder name.
4. Open the chosen file in a new tmux window named after the file (or a shortened version) in that session, using the user's `nv` zsh alias. Run:
   ```bash
   tmux new-window -t <session> -n <window_name> "zsh -i -c 'nv <file_path>'"
   ```
5. Confirm to the user which file was opened and in which tmux window/session.

Do not read the full file contents unless necessary for matching. Only use existing tools; do not create new files for this operation.
