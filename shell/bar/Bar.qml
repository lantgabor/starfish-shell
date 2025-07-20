pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Wayland

import Components

PanelWindow {
  id: bar

  anchors {
    top: true
    left: true
    right: true
  }
  WlrLayershell.layer: WlrLayer.Bottom

  implicitHeight: Config.barHeight
  color: Config.barColor

  RowLayout {
    id: barLeft

    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter

    spacing: Config.barSpacing

    HyprlandWorkspaces {}
  }

  RowLayout {
    id: barCenter

    anchors.centerIn: parent

    spacing: Config.barSpacing
  }

  RowLayout {
    id: barRight

    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter

    spacing: Config.barSpacing

    Clock {}
  }
}
