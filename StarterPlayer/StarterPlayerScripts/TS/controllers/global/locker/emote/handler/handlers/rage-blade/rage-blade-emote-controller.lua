local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u11 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler
local u12 = v1.import(script, script.Parent, "rage-blade-win-count").RageBladeWinCount
local u13 = nil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "RageBladeEmoteController"
    end
})
u14.__index = u14
function u14.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(_) --[[ Line: 27 ]] end
function u14.onStart(_) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u13
    --]]
    u3.Controllers.EmoteHandlerController:registerHandler(u10.RAGE_BLADE, u13)
end
v2.defineMetadata(u14, "identifier", "client/controllers/global/locker/emote/handler/handlers/rage-blade/rage-blade-emote-controller@RageBladeEmoteController")
v2.defineMetadata(u14, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u14, "$:flamework@Controller", v4, {
    {}
})
u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "RageBladeEmoteHandler"
    end,
    ["__index"] = u11
})
u13.__index = u13
function u13.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v17 = u13
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u13.constructor(p19, ...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p19, ...)
end
function u13.onEnable(p20, p21, p22, p23, p24) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u3
        [4] = u9
        [5] = u7
        [6] = u5
        [7] = u12
    --]]
    if not p22.PrimaryPart or p23 ~= u10.RAGE_BLADE then
        return nil
    end
    local u25 = u8.Assets.Misc.RageBladeEmote:Clone()
    local v26 = (p22.Head.CFrame + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 0, 1.3089969389957472)
    u25.Parent = p22
    u25:PivotTo(v26)
    p20:setupInstance(u25)
    local v27 = u3.Controllers.KitContractController:getKitStats(u9.BARBARIAN):expect()
    if v27 ~= nil then
        v27 = v27.wins
    end
    local v28 = v27 == nil and 0 or v27
    local v29
    if p20:isPreview(p21) then
        v29 = u7.LocalPlayer
    else
        v29 = u7:GetPlayerByUserId(p21)
    end
    local v30 = u5
    local v31 = u5.createElement(u12, {
        ["Adornee"] = u25,
        ["WinCount"] = v28
    })
    if v29 ~= nil then
        v29 = v29:WaitForChild("PlayerGui")
    end
    local u32 = v30.mount(v31, v29, "RageBladeWinCount")
    p24:GiveTask(function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u32
            [3] = u25
        --]]
        u5.unmount(u32)
        u25:Destroy()
    end)
end
function u13.onDisable(_, _, _, _) --[[ Line: 92 ]] end
return {
    ["default"] = u14
}