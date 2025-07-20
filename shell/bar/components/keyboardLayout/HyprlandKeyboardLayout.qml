pragma Singleton

import Quickshell.Hyprland
import Quickshell.Io
import Quickshell
import QtQuick

Singleton {
  id: root
  property var keyboardLayout

  Process {
    id: keyboardLayoutProcess
    running: true
    command: ["sh", "-c", "hyprctl devices -j | jq -r '.keyboards.[] | select(.main == true).active_keymap' | cut -c 1-2 | tr 'a-z' 'A-Z' | tr -d '\n'"]
    stdout: StdioCollector {}
  }

  Connections {
    target: Hyprland

    function onRawEvent(event: HyprlandEvent) {
      if (["activelayout"].includes(event.name)) {
        keyboardLayoutProcess.running = true;
      }
    }
  }

  Connections {
    target: keyboardLayoutProcess

    function onExited() {
      keyboardLayout = keyboardLayoutProcess.stdout.text;
    }
  }
}
