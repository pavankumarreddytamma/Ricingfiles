import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { poll } from "../utils/exec.js";

const gpu = poll(
  ["bash", "-c", "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits"],
  2000,
  out => out.trim(),
);

export default () =>
  Widget.Label({
    class_name: "stat",
    label: gpu().concat("%"),
  });
