import Quickshell // for PanelWindow
import QtQuick // for Text
import QtQuick

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 28

  Text {
    id: clock
    // center the bar in its parent component (the window)
    anchors.centerIn: parent

        Process {
      // the command it will run, every argument is its own string
      command: ["date"]

      // run the command immediately
      running: true

      // process the stdout stream using a StdioCollector
      // Use StdioCollector to retrieve the text the process sends
      // to stdout.
      stdout: StdioCollector {
        // Listen for the streamFinished signal, which is sent
        // when the process closes stdout or exits.
        onStreamFinished: clock.text = this.text // `this` can be omitted
      }
    }

    text: "hello world"
  }
}