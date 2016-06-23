-- default keybinding: g
-- add the following to your input.conf to change the default keybinding:
-- keyname script_binding auto_load_deframe
local utils = require 'mp.utils'
function load_deframe_fn()
    mp.osd_message("Search frame...")
    subl = "/usr/local/bin/deframe"
    t = {}
    t.args = {subl,mp.get_property("path")}
    res = utils.subprocess(t)
    mp.command("vf add @%s:crop=" .. res.stdout)
    mp.osd_message(res.stdout)
end

mp.add_key_binding("g", "auto_load_deframe", load_deframe_fn)
