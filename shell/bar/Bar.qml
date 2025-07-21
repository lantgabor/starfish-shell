pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Wayland

import "root:/config" as C

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

  implicitHeight: C.Bar.barHeight
  color: C.Bar.barColor

  RowLayout {
    id: barLeft

    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    anchors.leftMargin: 3

    spacing: C.Bar.barSpacing

    Workspaces {}
  }

  RowLayout {
    id: barCenter
    anchors.centerIn: parent

    spacing: C.Bar.barSpacing

    DateWidget {}
    Clock {}
  }

  RowLayout {
    id: barRight

    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    anchors.rightMargin: 3

    spacing: C.Bar.barSpacing

    AudioSink {}
    KeyboardLayout {}
  }
}
