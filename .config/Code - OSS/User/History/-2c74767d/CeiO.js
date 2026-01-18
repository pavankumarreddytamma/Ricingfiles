import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { poll } from "../utils/exec.js";

const cpu = poll(
  ["bash", "-c", "grep 'cpu ' /proc/stat"],
  2000,
  out => {
    const v = out.trim().split(/\s+/).slice(1).map(Number);
    const idle = v[3];
    const total = v.reduce((a, b) => a + b, 0);
    return Math.round((1 - idle / total) * 100);
  },
);

export default () =>
  Widget.Label({
    class_name: "stat",
    label: cpu().toString().concat("%"),
  });
