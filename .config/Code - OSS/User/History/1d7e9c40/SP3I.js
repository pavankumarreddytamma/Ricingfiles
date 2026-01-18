import Widget from "resource:///com/github/Aylur/ags/widget.js";
import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";

export default () =>
  Widget.Box({
    class_name: "left",
    spacing: 10,
    children: [
      Widget.Label({
        label: Hyprland.active.workspace.bind("id").as(id => `WS ${id}`),
      }),
      Widget.Label({
        label: Hyprland.active.client.bind("title"),
        max_width_chars: 30,
        truncate: "end",
      }),
    ],
  });
