pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
  id: root
  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource

  readonly property bool sinkMuted: sink?.audio?.muted ?? false
  readonly property real sinkVolume: sink?.audio?.volume ?? 0

   readonly property bool sourceMuted: source?.audio?.muted ?? false
  readonly property real sourceVolume: source?.audio?.volume ?? 0

  function setVolume(v: real) {
    if (sink?.ready && sink?.audio) {
      sink.audio.muted = false;
      sink.audio.volume = v;
    }
  }

  function setMuted() {
    if (sink?.ready && sink?.audio) {
      sink.audio.muted = !sink.audio.muted;
    }
  }

  function setMicrophoneMuted() {
    if (source?.ready && source?.audio) {
      source.audio.muted = !source.audio.muted;
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
