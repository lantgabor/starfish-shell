import Quickshell
import "bar"

ShellRoot {
  id: shellRoot
  Variants {
    model: Quickshell.screens

    Bar {
      required property ShellScreen modelData
      screen: modelData
    }
  }
}
