# Load assembly System.Windows.Forms
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Keyboard {
    [DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]
    public static extern short GetAsyncKeyState(int virtualKeyCode);

    [DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, int dwExtraInfo);
}
"@

function Press-F15 {
    # Press the key
    [Keyboard]::keybd_event(0x74, 0, 0, 0)

    # Release the key
    [Keyboard]::keybd_event(0x74, 0, 2, 0)
}

while($true) {
    # Press F15 key
    Press-F15

    # Sleep for 30 seconds
    Start-Sleep -Seconds 30
}
