import Widget from "resource:///com/github/Aylur/ags/widget.js";

export default () =>
  Widget.Box({
    class_name: "center",
    spacing: 14,
    children: [
      Widget.Label({ label: "CPU" }),
      Widget.Label({ label: "GPU" }),
      Widget.Label({ label: "TEMP" }),
      Widget.Label({
        label: new Date().toLocaleDateString(),
      }),
    ],
  });
