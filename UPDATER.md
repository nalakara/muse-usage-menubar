# Updating `usage.txt`

## Role of the updater

SwiftBar displays the snapshot. It does not obtain Muse usage data.

An updater must:

1. Check the current Muse subscription or usage status.
2. Build a new snapshot using only the values returned by that check.
3. Replace `usage.txt` in the same folder as `muse-usage.5m.sh`.
4. Leave the previous snapshot untouched when the check fails.

In the original setup, the target file is:

    ~/MuseMenuBar/usage.txt

## Recommended schedule

Three hours is a practical default. Muse usage normally changes slowly, and the main purpose of the display is to reveal unused headroom before the weekly reset. Use a shorter interval if you need a fresher estimate.

## Reusable task prompt

Give an assistant with access to Muse usage and the target Mac a task like this:

    Check the current Muse usage status. Rewrite ~/MuseMenuBar/usage.txt using only the values returned by the status check. The first line must be `⚡ <used percent>%`. Add a dropdown with the used percentage, remaining headroom, reset time, remaining reset countdown, bonus token status when available, and the snapshot time. Do not invent exact token counts when the source only reports percentages. If the status check fails, leave the existing file unchanged and do not send a message.

## Snapshot contract

- Encoding: UTF-8
- Filename: `usage.txt`
- First line: the compact menu bar label
- Separator: a line containing only `---`
- Final section: snapshot time, so staleness is visible
- A failed update must not replace a good snapshot with an error message

## Security and privacy

Do not put credentials, tokens, account identifiers, or private messages in `usage.txt`. The file is meant to contain usage display text only.
