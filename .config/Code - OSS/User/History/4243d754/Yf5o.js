import Widget from "resource:///com/github/Aylur/ags/widget.js";
import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";

import Left from "./left.js";
import Center from "./center.js";
import Right from "./right.js";

export default () =>
  Widget.Window({
    name: "bar",
    class_name: "glass-bar",
    layer: "top",
    exclusivity: "exclusive",
    anchor: ["top"],
    margins: [12, 60, 0, 60],
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
