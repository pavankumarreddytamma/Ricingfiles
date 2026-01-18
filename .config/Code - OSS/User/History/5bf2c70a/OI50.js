import Bar from "./bar/bar.js";

export const gtk = 3;  // <--- tell AGS to use GTK3

export default function App() {
    return [
        Bar(),
    ];
}
