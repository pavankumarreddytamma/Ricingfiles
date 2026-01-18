import { execAsync } from "resource:///com/github/Aylur/ags/utils.js";

export const poll = (cmd, interval, transform = x => x) => {
  let value = "";
  setInterval(async () => {
    try {
      value = transform(await execAsync(cmd));
    } catch {}
  }, interval);
  return () => value;
};
