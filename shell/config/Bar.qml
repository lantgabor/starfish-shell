pragma Singleton

import Quickshell
import QtQuick

Singleton {
  property int fontSize: General.fontSize
  property var textColor: General.textColor

  property int barSpacing: 10
  property int barHeight: 30
  property var barColor: Qt.rgba(23 / 255, 23 / 255, 23 / 255, 0.9)

  property Workspaces workspaces: Workspaces {}

  component Workspaces: QtObject {
    property int buttonSpacing: 4

    property int buttonRadius: 8

    property int buttonTopMargin: 3
    property int buttonBottomMargin: 3
    property int buttonLeftMargin: 11
    property int buttonRightMargin: 11

    property var buttonHoverColor: "#64727D"
    property var buttonActiveColor: "#343434"
    property var buttonColor: Qt.rgba(0, 0, 0, 0)

    property var buttonBorderColor: "#0A81F5"
    property int buttonBorderWidth: 0
    property int activeButtonBorderWidth: 1
  }
}
