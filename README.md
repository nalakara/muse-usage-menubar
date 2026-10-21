# Muse Usage for SwiftBar

A tiny SwiftBar plugin that displays a Muse usage snapshot in the macOS menu bar.

The menu bar can show a compact label such as:

    ⚡ 42%

Clicking it reveals the usage percentage, remaining headroom, reset time, bonus token information, and the time of the latest snapshot.

## Important limitation

This project does not fetch live data from a public Muse API. SwiftBar only displays a local file named `usage.txt`.

That file must be replaced by a person, a script, or an AI assistant that can check the current Muse usage. The original setup uses Muse on a three-hour schedule. See `UPDATER.md` for the snapshot contract and a reusable updater prompt.

## Requirements

- macOS
- SwiftBar
- Homebrew, if you want `install.sh` to install SwiftBar automatically
- A process that updates `usage.txt`

## Install

Clone this repository, then run:

    git clone https://github.com/nalakara/muse-usage-menubar.git
    cd muse-usage-menubar
    ./install.sh

The installer:

1. Installs SwiftBar with Homebrew when SwiftBar is missing and Homebrew is available.
2. Creates `~/MuseMenuBar`.
3. Copies `muse-usage.5m.sh` into that folder and makes it executable.
4. Creates `usage.txt` from `usage.example.txt` when no snapshot exists.
5. Opens SwiftBar.

When SwiftBar asks for its plugin folder, choose `MuseMenuBar` in your home folder.

If SwiftBar already uses another plugin folder, either change its plugin folder to `~/MuseMenuBar` or copy both `muse-usage.5m.sh` and `usage.txt` into the existing folder.

## Snapshot format

The first line is the menu bar label. Everything after the first `---` appears in the dropdown.

Example:

    ⚡ 42%
    ---
    Used: 42% of the weekly limit
    Headroom: 58%
    Resets: Wednesday · 08:14 (2 days 4 hours left)
    Bonus tokens: 4B remaining · 0% used
    ---
    Snapshot: Monday · 09:00 | color=#888888

Only write values that were returned by the usage source. If a source reports percentages rather than exact token counts, do not invent exact token counts.

## Updating the snapshot

See `UPDATER.md`.

## Uninstall

1. Quit SwiftBar, or remove `muse-usage.5m.sh` from its plugin folder.
2. Delete `~/MuseMenuBar` if you no longer need the snapshot or plugin.

## Privacy

The live `usage.txt` file stays on your Mac and is ignored by Git. Do not commit a real snapshot if you consider your usage pattern private.

## License

MIT. See `LICENSE`.
