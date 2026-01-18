import Quickshell
import Quickshell.Wayland

Shell {
    // This is your main bar
    TopBar {
        id: mainBar
    }

    // This is a hidden menu window
    PowerMenu {
        id: powerMenu
        visible: false // Hidden by default
    }
}