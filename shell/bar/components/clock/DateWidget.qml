import QtQuick

import Quickshell
import Quickshell.Widgets

WrapperItem {
  id: root
  Text {
    color: "white"
    font.pixelSize: 13
    text: SystemDateTime.date
  }
}
