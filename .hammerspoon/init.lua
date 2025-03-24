hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall

require("modules/_variables")
require("modules/auto_reload")
require("modules/aerospace")
require("modules/auto_mute")

Install:andUse("FadeLogo",
        {
            config = {
                fade_in_time = 0.2,
                fade_out_time = 0.5,
                run_time = 0.3,
                zoom = false
            },
            start = true
        }
)
