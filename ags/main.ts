import { Monitor } from "types/@girs/gdk-3.0/gdk-3.0.cjs";
import { Bar } from "widget/bar";
import { hyprland } from "resource:///com/github/Aylur/ags/service/hyprland.js";
import GLib from "gi://GLib";
import Gdk from "gi://Gdk";
import { NotificationPopups } from "widget/notifications";
import { Overview, Workspaces } from "widget/overview";

const COMPILED_STYLE_DIR = `${GLib.get_user_cache_dir()}/ags/user/generated`;

async function applyStyle() {
  Utils.exec(`mkdir -p ${COMPILED_STYLE_DIR}`);
  Utils.exec(
    `sass ${App.configDir}/scss/main.scss ${COMPILED_STYLE_DIR}/style.css`,
  );
  App.resetCss();
  App.applyCss(`${COMPILED_STYLE_DIR}/style.css`);
  console.log("[LOG] Styles loaded");
}

applyStyle().catch(print);

Utils.monitorFile(
  // directory that contains the scss files
  `${App.configDir}/scss/main.scss`,
  () => applyStyle(),
);

// const Bar = (monitor: number) =>
//   Widget.Window({
//     monitor,
//     name: `bar${monitor}`,
//     anchor: ["top", "left", "right"],
//     exclusivity: "exclusive",
//     child: Widget.CenterBox({
//       start_widget: Widget.Label({
//         hpack: "center",
//         label: "Welcome to AGS!",
//       }),
//       end_widget: Widget.Label({
//         hpack: "center",
//         label: time.bind(),
//       }),
//     }),
//   });

App.config({
  style: `${COMPILED_STYLE_DIR}/style.css`,
  windows: [
    ...[...Array(hyprland.monitors.length).keys()].map((index) => Bar(index)),
    NotificationPopups(),
    // Overview(),
  ],
});
