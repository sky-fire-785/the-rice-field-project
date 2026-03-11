// 1. THE PURGE: Destroy all existing panels on all screens
var action = "remove";
for (var p = 0; p < panelIds.length; p++) {
    panelById(panelIds[p])[action]();
}

// 2. THE MULTI-MONITOR LOOP: Run this code for every monitor plugged in
for (var i = 0; i < screenIds.length; i++) {
    
    // Create the new Project Aphrodite Panel
    var panel = new Panel;
    panel.screen = screenIds[i];   // <-- THIS IS THE MAGIC LINE. It binds the panel to the current screen.
    panel.location = "bottom";
    panel.height = 46;
    panel.floating = true;

    // Add the Kickoff launcher (Start Menu)
    var kickoff = panel.addWidget("org.kde.plasma.kickoff");
    kickoff.currentConfigGroup = ["General"];
    kickoff.writeConfig("icon", "start-here-archlinux"); 

    // Add a separator
    panel.addWidget("org.kde.plasma.marginsseparator");

    // Add the Task Manager and pin your core apps
    var taskManager = panel.addWidget("org.kde.plasma.icontasks");
    taskManager.currentConfigGroup = ["General"];
    taskManager.writeConfig("launchers", "applications:systemsettings.desktop,applications:org.kde.dolphin.desktop,applications:kitty.desktop,applications:vivaldi-stable.desktop,applications:visual-studio-code-bin.desktop");

    // Add another separator
    panel.addWidget("org.kde.plasma.marginsseparator");

    // Add the System Tray
    panel.addWidget("org.kde.plasma.systemtray");

    // Add the Digital Clock
    var clock = panel.addWidget("org.kde.plasma.digitalclock");
    clock.currentConfigGroup = ["Appearance"];
    clock.writeConfig("use24hFormat", "0"); 
    clock.writeConfig("showSeconds", "true");
}