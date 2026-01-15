var _a, _b;
import { o as onMessage, s as sendMessage, i as initPlugins } from "./chunks/_virtual_wxt-plugins-DCbb_YvY.js";
function defineBackground(arg) {
  if (arg == null || typeof arg === "function") return { main: arg };
  return arg;
}
const browser$1 = ((_b = (_a = globalThis.browser) == null ? void 0 : _a.runtime) == null ? void 0 : _b.id) ? globalThis.browser : globalThis.chrome;
const browser = browser$1;
const definition = defineBackground({
  type: "module",
  main: () => {
    onMessage("setAnnouncementSeen", async (message) => {
      console.info("setting seen", message.data);
      return await setAnnouncementSeen(message.data);
    });
    onMessage("getAnnouncementSeen", async () => {
      return await getAnnouncementSeen();
    });
    onMessage("broadcastTimezoneUpdate", async (message) => {
      return broadcastTimezoneUpdate(message.data);
    });
    chrome.action.onClicked.addListener(() => {
      chrome.tabs.create({});
    });
    browser.runtime.onInstalled.addListener(async (details) => {
      chrome.tabs.create({});
      if (details.reason === chrome.runtime.OnInstalledReason.UPDATE) {
        const oldVersion = details.previousVersion;
        const newVersion = chrome.runtime.getManifest().version;
        if (oldVersion !== newVersion) {
          chrome.storage.local.set({
            appVersion: newVersion
          });
          console.info(
            "Extension updated. Reloading service worker..."
          );
          chrome.runtime.reload();
        }
      }
    });
    browser.runtime.setUninstallURL("https://go.panda.network/panda-uninstall");
  }
});
async function getAnnouncementSeen() {
  const announcementSeen = await chrome.storage.local.get(
    "panda-announcement-seen"
  );
  return announcementSeen["panda-announcement-seen"];
}
async function setAnnouncementSeen(announcementId) {
  await chrome.storage.local.set({
    "panda-announcement-seen": announcementId
  });
}
async function broadcastTimezoneUpdate(offset) {
  console.info("broadcasting", offset);
  sendMessage("onTimezoneUpdate", offset);
}
function print(method, ...args) {
  return;
}
const logger = {
  debug: (...args) => print(console.debug, ...args),
  log: (...args) => print(console.log, ...args),
  warn: (...args) => print(console.warn, ...args),
  error: (...args) => print(console.error, ...args)
};
let result;
try {
  initPlugins();
  result = definition.main();
  if (result instanceof Promise) {
    console.warn(
      "The background's main() function return a promise, but it must be synchronous"
    );
  }
} catch (err) {
  logger.error("The background crashed on startup!");
  throw err;
}
