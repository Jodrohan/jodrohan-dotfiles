-- Quickshell profile configuration
hl.env("qsConfig", "ii")

-- Core System Applications
terminal = "kitty -1"
fileManager = "kitty --class yazi-explorer -e fish -c yazi"
browser = "google-chrome-stable"
codeEditor = "code"
textEditor = "kitty -1 fish -c nano"
officeSoftware = "libreoffice"
volumeMixer = "pavucontrol"
settingsApp = "XDG_CURRENT_DESKTOP=gnome qs -p ~/.config/quickshell/$qsConfig/settings.qml"
taskManager = "kitty -1 fish -c btop"

workspaceGroupSize = 10
