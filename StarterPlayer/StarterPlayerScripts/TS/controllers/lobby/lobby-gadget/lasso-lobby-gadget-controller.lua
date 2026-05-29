local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.PlayerUtil
local u4 = v2.WatchPlayer
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "LassoLobbyGadgetController"
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
    --]]
    u8.constructor(p14)
    p14.Name = "LassoLobbyGadgetController"
    p14.cowboyHatMaidMap = {}
end
function u11.KnitStart(u15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u9
    --]]
    u8.KnitStart(u15)
    u4(function(u16, p17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u15
        --]]
        if u16:GetAttribute("LobbyGadgetType") == u9.LASSO then
            u15:equipCowboyHat(u16)
        else
            u15:unequipCowboyHat(u16)
        end
        p17:GiveTask(u16:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u9
                [3] = u15
            --]]
            if u16:GetAttribute("LobbyGadgetType") == u9.LASSO then
                u15:equipCowboyHat(u16)
            else
                u15:unequipCowboyHat(u16)
            end
        end))
    end)
end
function u11.equipCowboyHat(p18, p19) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u7
        [4] = u10
    --]]
    local v20 = p18.cowboyHatMaidMap[p19]
    if v20 ~= nil then
        v20:DoCleaning()
    end
    local v21 = u3.waitForCharacter(p19)
    if not v21 then
        return nil
    end
    local v22 = u6.new()
    local v23 = u7.Assets.Misc.CowboyHat:Clone()
    v22:GiveTask(v23)
    v23.Parent = v21
    u10:weldAccessory(v21, v23)
    p18.cowboyHatMaidMap[p19] = v22
end
function u11.unequipCowboyHat(p24, p25) --[[ Line: 72 ]]
    local v26 = p24.cowboyHatMaidMap[p25]
    if v26 ~= nil then
        v26:DoCleaning()
    end
end
v5.CreateController(u11.new())
return nil