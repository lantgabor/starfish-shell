pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
  id: root
  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource

  readonly property bool muted: sink?.audio?.muted ?? false
  readonly property real volume: sink?.audio?.volume ?? 0

  function setVolume(v: real) {
    if (sink?.ready && sink?.audio) {
      sink.audio.muted = false;
      sink.audio.volume = v;
    }
  }

  function setMuted() {
    if (sink?.ready && sink?.audio) {
      sink.audio.muted = !muted;
    }
  }

  Connections {
    target: Pipewire.defaultAudioSink?.audio

    function onMutedChanged() {
    // show muted osd + timer
    }

    function onVolumeChanged() {
    // show changed osd + timer
    }
  }

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }
}
