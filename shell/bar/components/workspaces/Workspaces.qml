import QtQuick
import QtQuick.Layouts

import Quickshell.Widgets
import Quickshell.Hyprland

import "../../Config"

RowLayout {
  id: root

  spacing: 4

  Repeater {
    id: repeater
    model: HyprlandWorkspaces.workspaces ? HyprlandWorkspaces.workspaces[screen.name] : []

    WrapperMouseArea {
      id: mouseArea
      required property HyprlandWorkspace modelData

      hoverEnabled: true

      onClicked: {
        if (!modelData.active) {
          modelData.activate();
        }
      }
      onEntered: {
        rect.hover = true;
      }
      onExited: {
        rect.hover = false;
      }

      WrapperRectangle {
        id: rect

        property bool hover: false

        border {
          color: "#0A81F5"
          width: mouseArea.modelData?.active ? 1 : 0
        }
        radius: 8
        rightMargin: 11
        leftMargin: 11
        topMargin: 3
        bottomMargin: 3

        color: {
          if (mouseArea.modelData?.active) {
            return "#343434";
          } else {
            if (hover) {
              return "#64727D";
            }
            return "#00000000";
          }
        }

        Text {
          font.pixelSize: 13
          color: "white"
          text: mouseArea.modelData?.name ? mouseArea.modelData.name : ""
        }
      }
    }
  }
}
