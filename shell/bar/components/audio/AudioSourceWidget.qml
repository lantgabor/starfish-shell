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
      onClicked: SystemAudio.setMicrophoneMuted()
      background: IconImage {
        implicitSize: 28
        source: {
          const icon = () => {
            if (SystemAudio.sourceMuted)
              return "dialog-cancel";
            return "audio-input-microphone";
          };
          return `image://icon/${icon()}`;
        }
      }
    }
  }
}
