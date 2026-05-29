local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.Promise
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults
local u10 = u1.import(script, script.Parent, "profile-data-keybind-loader").ProfileDataKeybindLoader
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "KeybindLoadController"
    end,
    ["__index"] = u8
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u7
    --]]
    u8.constructor(p14)
    p14.Name = "KeybindLoadController"
    p14.keybindLoaders = { u10.new() }
    p14.loadedKeybindsSignal = u7.new()
end
function u11.KnitStart(p15) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p15)
    p15:loadKeybinds()
end
function u11.getKeybinds(p16) --[[ Line: 36 ]]
    return p16.loadedKeybinds
end
function u11.waitForKeybinds(p17) --[[ Line: 39 ]]
    if p17.loadedKeybinds then
        return p17.loadedKeybinds
    else
        return p17.loadedKeybindsSignal:Wait()
    end
end
function u11.loadKeybinds(u18) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u9
    --]]
    local v22 = u5.new(function(p19, p20) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u6
            [3] = u9
        --]]
        local v21 = u18.loadedKeybinds or {
            ["keyboard"] = u6.deepCopy(u9.KEYBOARD_KEYBINDS),
            ["gamepad"] = u6.deepCopy(u9.GAMEPAD_KEYBINDS)
        }
        if not v21.gamepad then
            p20("Initially loaded keybinds must provide gamepad keybinds")
        end
        p19(v21)
    end)
    local v23 = v22
    for v24, u25 in u18.keybindLoaders do
        local _ = v24 - 1
        v22 = v23:andThen(function(p26) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            local v27 = u25:loadKeybinds()
            if not v27 then
                return p26
            end
            p26.keyboard = v27.keyboard or p26.keyboard
            p26.gamepad = v27.gamepad or p26.gamepad
            return p26
        end)
        v23 = v22
    end
    v23:andThen(function(p28) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v29 = u18:registerKeybinds(p28)
        if not v29.success then
            error(v29.errorMessage)
        end
        u18.loadedKeybindsSignal:Fire(p28)
        u18.loadedKeybinds = p28
    end):catch(function(p30) --[[ Line: 80 ]]
        if p30 ~= "" and p30 then
            warn(p30)
        end
    end)
end
function u11.registerKeybinds(u31, u32) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v34, v35 = u1.try(function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u32
            [3] = u31
            [4] = u1
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):registerKeybindDefinitions(u32.keyboard, u32.gamepad)
        u31.loadedKeybinds = u32
        return u1.TRY_RETURN, {
            {
                ["success"] = true
            }
        }
    end, function(p33) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1.TRY_RETURN, {
            {
                ["success"] = false,
                ["errorMessage"] = "Failed to register keybinds with error " .. tostring(p33)
            }
        }
    end)
    if v34 then
        return unpack(v35)
    end
end
v4.CreateController(u11.new())
return nil