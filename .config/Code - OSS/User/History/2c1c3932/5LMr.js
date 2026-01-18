import Widget from "resource:///com/github/Aylur/ags/widget.js";
import Cpu from "../widgets/cpu.js";
import CpuTemp from "../widgets/cpuTemp.js";
import Gpu from "../widgets/gpu.js";

export default () =>
  Widget.Box({
    class_name: "center",
    spacing: 14,
    children: [
      Widget.Label({ label: "CPU" }),
      Cpu(),
      Widget.Label({ label: "GPU" }),
      Gpu(),
      Widget.Label({ label: "TEMP" }),
      CpuTemp(),
      Widget.Label({
        label: new Date().toLocaleDateString(),
      }),
    ],
  });
