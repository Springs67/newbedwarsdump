local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, script.Parent, "distraction").DistractionWrapper
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "DistractionController"
    end
})
u10.__index = u10
function u10.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(_) --[[ Line: 23 ]] end
function u10.onStart(_) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u8
        [4] = u5
        [5] = u9
        [6] = u6
    --]]
    u7.Client:Get("Distraction"):Connect(function(p13) --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u5
            [4] = u9
            [5] = u6
        --]]
        u3:playSound(u8.TV_STATIC)
        u3:playSound(u8.TURRET_ON)
        local u14 = u5.mount(u5.createElement(u9), u6.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
        task.delay(p13.length, function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u8
                [3] = u5
                [4] = u14
            --]]
            u3:playSound(u8.TV_STATIC)
            u3:playSound(u8.TURRET_OFF)
            u5.unmount(u14)
        end)
    end)
end
v2.defineMetadata(u10, "identifier", "client/controllers/games/bedwars/lucky-blocks/distraction/distraction-controller@DistractionController")
v2.defineMetadata(u10, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u10, "$:flamework@Controller", v4, {
    {}
})
return {
    ["default"] = u10
}