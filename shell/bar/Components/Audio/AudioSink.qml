import QtQuick
import Quickshell
import QtQuick.Controls

import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Layouts

WrapperItem {
  child: RowLayout {
    spacing: 0

    Button {
      onClicked: SystemAudio.setMuted()
      background: IconImage {
        implicitSize: 28
        source: {
          const icon = () => {
            if (SystemAudio.muted)
              return "audio-volume-muted";
            if (SystemAudio.volume < 0.2)
              return "audio-volume-low";
            if (SystemAudio.volume < 0.5)
              return "audio-volume-medium";
            return "audio-volume-high";
          };
          return `image://icon/${icon()}`;
        }
      }
    }

    Slider {
      id: control
      value: {
        if (!SystemAudio.muted)
          return SystemAudio.volume;
        else
          return 0;
      }

      onMoved: {
        SystemAudio.setVolume(value);
      }

      background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: 4
        width: control.availableWidth
        height: implicitHeight
        radius: 2
        color: "#bdbebf"

        Rectangle {
          width: control.visualPosition * parent.width
          height: parent.height
          color: "#21be2b"
          radius: 2
        }
      }

      handle: Rectangle {
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 26
        implicitHeight: 26
        radius: 13
        color: control.pressed ? "#f0f0f0" : "#f6f6f6"
        border.color: "#bdbebf"
      }
    }
  }
}
