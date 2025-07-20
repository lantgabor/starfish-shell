import QtQuick

import Quickshell.Widgets

WrapperItem {
  id: root

  visible: width > 0 && height > 0 && opacity > 0

  Text {
    id: text
    font.pointSize: 13
    color: "white"
    text: HyprlandKeyboardLayout.keyboardLayout ? HyprlandKeyboardLayout.keyboardLayout : ""
  }
}
