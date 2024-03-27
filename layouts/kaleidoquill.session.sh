# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/code/kaleidoquill_app/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "kaleidoquill"; then

  # Create a new window inline within session layout definition.
  new_window "Compose"
  run_cmd "dcupd"
  sleep 1
  new_window "Frontend"
  run_cmd "cd kaleidoquill_frontend && nvim"
  sleep 1
  send_keys " sf"
  send_keys ""
  new_window "Backend"
  run_cmd "cd kaleidoquill_backend && nvim"
  sleep 1
  send_keys " sf"
  new_window "Logs"
  split_h 50
  run_cmd "dclf kaleidoquill_frontend" 0
  run_cmd "dclf kaleidoquill_backend" 1

  # Load a defined window layout.
  #load_window "example"

  # Select the default active window on session creation.
  select_window "Compose"
fi
# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
