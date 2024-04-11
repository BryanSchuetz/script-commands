#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title The Feed
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName The Feed

# Documentation:
# @raycast.description Newsletters, marketing, and other bacon
# @raycast.author Bryan Schuetz
# @raycast.authorURL https://github.com/BryanSchuetz

tell application "Mail"
  -- Start by getting the sender's address and the message's account
  set selectedMsgs to selected messages of first message viewer
  set thisMsg to first item of selectedMsgs
  set acct to account of mailbox of thisMsg
  set spamAddr to extract address from sender of thisMsg
  get acct
  
  -- Add that address to a new condition of the rule
  set psRule to rule "The Feed"
  tell psRule
    set newCondition to make new rule condition at beginning of rule conditions
    tell newCondition
      set rule type to from header
      set qualifier to equal to value
      set expression to spamAddr
    end tell
  end tell
  
  -- Delete the message
  set mailbox of thisMsg to mailbox "The Feed" of acct
  
end tell