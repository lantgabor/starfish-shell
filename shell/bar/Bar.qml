pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Wayland

import "components/clock"
import "components/audio"
import "components/keyboardLayout"
import "components/workspaces"

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
    anchors.leftMargin: 3

    spacing: Config.barSpacing

    Workspaces {}
  }

  RowLayout {
    id: barCenter
    anchors.centerIn: parent
    spacing: Config.barSpacing

    DateWidget {}
    Clock {}
  }

  RowLayout {
    id: barRight

    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    anchors.rightMargin: 3

    spacing: Config.barSpacing

    AudioSink {}
    KeyboardLayout {}
  }
}
