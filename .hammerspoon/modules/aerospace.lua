local function aerospace(arguments)
    hs.task.new("/opt/homebrew/bin/aerospace", nil, arguments):start()
end

local function createF14Modal(modifiers, basicActions)
    local f14Modal = hs.hotkey.modal.new(modifiers, "F14")

    local function handleKey(event)
        local key = hs.keycodes.map[event:getKeyCode()]
        if basicActions[key] then
            basicActions[key]()
            f14Modal:exit()
            return true -- Suppress the key event
        end
        f14Modal:exit()
        return false -- Allow the key event to propagate if no action is taken
    end

    function f14Modal:entered()
        self.eventtap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, handleKey):start()
    end

    function f14Modal:exited()
        if self.eventtap then
            self.eventtap:stop()
            self.eventtap = nil
        end
    end

    return f14Modal
end

local basicActions = {
    -- Focus
    ["f"] = function()
        aerospace({ "focus-back-and-forth" })
    end,
    ["h"] = function()
        aerospace({ "focus", "--boundaries-action", "wrap-around-the-workspace", "left" })
    end,
    ["j"] = function()
        aerospace({ "focus", "--boundaries-action", "wrap-around-the-workspace", "down" })
    end,
    ["k"] = function()
        aerospace({ "focus", "--boundaries-action", "wrap-around-the-workspace", "up" })
    end,
    ["l"] = function()
        aerospace({ "focus", "--boundaries-action", "wrap-around-the-workspace", "right" })
    end,
    -- Move
    ["n"] = function()
        aerospace({ "move", "left" })
    end,
    ["m"] = function()
        aerospace({ "move", "down" })
    end,
    [","] = function()
        aerospace({ "move", "up" })
    end,
    ["."] = function()
        aerospace({ "move", "right" })
    end,
    -- Join
    ["y"] = function()
        aerospace({ "join-with", "left" })
    end,
    ["u"] = function()
        aerospace({ "join-with", "down" })
    end,
    ["i"] = function()
        aerospace({ "join-with", "up" })
    end,
    ["o"] = function()
        aerospace({ "join-with", "right" })
    end,
    -- Layout
    ["/"] = function()
        aerospace({ "layout", "tiles", "horizontal", "vertical" })
    end,
    [";"] = function()
        aerospace({ "layout", "accordion", "horizontal", "vertical" })
    end,
    ["p"] = function()
        aerospace({ "layout", "floating", "tiling" })
    end,
    -- Resize
    ["return"] = function()
        aerospace({ "resize", "smart", "-100" })
    end,
    ["space"] = function()
        aerospace({ "fullscreen" })
    end,
    ["delete"] = function()
        aerospace({ "resize", "smart", "+100" })
    end,
    -- Workspace
    ["s"] = function()
        aerospace({ "workspace-back-and-forth" })
    end,
    ["w"] = function()
        aerospace({ "workspace w" })
    end,
    ["t"] = function()
        aerospace({ "workspace t" })
    end,
    ["t"] = function()
        aerospace({ "workspace t" })
    end,
    -- Balance sizes
    ["b"] = function()
        aerospace({ "balance-sizes" })
    end,
    -- Clear
    ["c"] = function()
        aerospace({ "flatten-workspace" })
    end,
    -- Reload config
    ["r"] = function()
        aerospace({ "reload-config" })
        hs.notify.new({title="Hammerspoon", informativeText="Aerospace config reloaded"}):send()
    end

}

createF14Modal({}, basicActions)
