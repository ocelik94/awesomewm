local awful = require("awful.init")

-- reload processes on config reload
awful.spawn.easy_async_with_shell(
    'ps x | grep "blueman-applet" | grep -v grep | awk "{print $1}" | xargs kill',
    function() awful.spawn("blueman-applet") end
)

awful.spawn.easy_async_with_shell(
    'ps x | grep "nm-applet" | grep -v grep | awk "{print $1}" | xargs kill',
    function() awful.spawn("nm-applet --indicator") end
)

awful.spawn.easy_async_with_shell(
    'ps x | grep "polkit-kde-authentication-agent-1" | grep -v grep | awk "{print $1}" | xargs kill',
    function() awful.spawn("/usr/lib/polkit-kde-authentication-agent-1") end
)

awful.spawn.easy_async_with_shell(
    'ps x | grep "picom" | grep -v grep | awk "{print $1}" | xargs kill',
    function() awful.spawn("picom") end
)

awful.spawn.easy_async_with_shell(
    'ps x | grep "vmware-user-suid-wrapper" | grep -v grep | awk "{print $1}" | xargs kill',
    function() awful.spawn("vmware-user-suid-wrapper") end
)

awful.spawn.easy_async_with_shell(
    'ps x | grep "imwheel" | grep -v grep | awk "{print $1}" | xargs kill',
    function() awful.spawn("imwheel") end
)