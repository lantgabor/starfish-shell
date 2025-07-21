pragma Singleton

import QtQuick

import Quickshell
import Quickshell.Hyprland

Singleton {
  id: root

  property var workspaces

  function workspacesOnScreen() {
    var workspaces = Hyprland.workspaces;
    var ret = {};

    for (let i = 0; i < workspaces.values.length; i++) {
      if (!workspaces.values[i]?.name.startsWith("special")) {
        if (!ret[workspaces.values[i].monitor?.name]) {
          ret[workspaces.values[i].monitor?.name] = [];
        }
        ret[workspaces.values[i].monitor?.name].push(workspaces.values[i]);
      }
    }
    return ret;
  }

  Connections {
    target: Hyprland

    function onRawEvent(event: HyprlandEvent) {
      if (event.name.includes("workspacev2") || event.name.includes("openlayer")) {
        root.workspaces = root.workspacesOnScreen();
      }
    }
  }
}
