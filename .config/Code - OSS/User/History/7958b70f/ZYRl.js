import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { poll } from "../utils/exec.js";

const temp = poll(
  ["bash", "-c", "sensors | grep 'Tctl' | awk '{print $2}'"],
  3000,
  out => out.replace("+", "").replace("°C", ""),
);

export default () =>
  Widget.Label({
    class_name: "stat",
    label: temp().concat("°C"),
  });
