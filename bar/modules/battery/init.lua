local wibox = require("wibox")
local awful = require("awful")

function update_mouse_battery_icon(icon)
    local iconName = awful.util.pread(
    "upower -i /org/freedesktop/UPower/devices/mouse_0003o046Do101Ax0006 " ..
    "| grep icon-name | grep -oP \"(?<=').*(?=')\"")
    icon:set_image("/usr/share/icons/gnome/scalable/status/" .. string.gsub(iconName, "\n", "") .. ".svg")
end

mouse_battery_icon = wibox.widget.imagebox()
mouse_battery_timer = timer({ timeout = 60 })
mouse_battery_timer:connect_signal("timeout",  function() update_mouse_battery_icon(mouse_battery_icon) end)
mouse_battery_timer:start()
mouse_battery_timer:emit_signal("timeout")

return mouse_battery_icon