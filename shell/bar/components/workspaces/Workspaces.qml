import QtQuick
import QtQuick.Layouts

import Quickshell.Widgets
import Quickshell.Hyprland

import "root:/config" as C

RowLayout {
  id: root

  spacing: C.Bar.workspaces.buttonSpacing

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
          color: C.Bar.workspaces.buttonBorderColor
          width: mouseArea.modelData?.active ? C.Bar.workspaces.activeButtonBorderWidth : C.Bar.workspaces.buttonBorderWidth
        }

        radius: C.Bar.workspaces.buttonRadius
        rightMargin: C.Bar.workspaces.buttonRightMargin
        leftMargin: C.Bar.workspaces.buttonLeftMargin
        topMargin: C.Bar.workspaces.buttonTopMargin
        bottomMargin: C.Bar.workspaces.buttonBottomMargin

        color: {
          if (mouseArea.modelData?.active) {
            return C.Bar.workspaces.buttonActiveColor;
          } else {
            if (hover) {
              return C.Bar.workspaces.buttonHoverColor;
            }
            return C.Bar.workspaces.buttonColor;
          }
        }

        Text {
          font.pixelSize: C.Bar.fontSize
          color: C.Bar.textColor
          text: mouseArea.modelData?.name ? mouseArea.modelData.name : ""
        }
      }
    }
  }
}
