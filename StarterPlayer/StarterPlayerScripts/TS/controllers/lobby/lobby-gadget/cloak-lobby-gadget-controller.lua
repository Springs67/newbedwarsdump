local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.WatchPlayer
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "CloakLobbyGadgetController"
    end,
    ["__index"] = u11
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p19)
    p19.Name = "CloakLobbyGadgetController"
    p19.playerMaid = {}
end
function u16.KnitStart(u20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u13
    --]]
    u11.KnitStart(u20)
    u4(function(u21, p22) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u20
        --]]
        if u21:GetAttribute("LobbyGadgetType") == u13.CLOAK then
            u20:equip(u21)
        else
            u20:unequip(u21)
        end
        p22:GiveTask(u21:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u13
                [3] = u20
            --]]
            if u21:GetAttribute("LobbyGadgetType") == u13.CLOAK then
                u20:equip(u21)
            else
                u20:unequip(u21)
            end
        end))
    end)
end
function u16.equip(u23, u24) --[[ Line: 57 ]]
    task.spawn(function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u23
        --]]
        if not u24.Character then
            return nil
        end
        u23.playerMaid[u24.UserId] = u23:equipCharacter(u24.Character)
    end)
end
function u16.equipCharacter(p25, p26) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u15
        [4] = u12
    --]]
    local v27 = u6.new()
    local v28 = u9.Assets.Misc.CloakCape:Clone()
    local v29 = u9.Assets.Misc.CloakHood:Clone()
    v27:GiveTask(v28)
    v27:GiveTask(v29)
    v28.Parent = p26
    v29.Parent = p26
    u15:weldAccessory(p26, v28)
    u15:weldAccessory(p26, v29)
    local v30 = u12:getEntity(p26)
    if v30 ~= nil then
        v30 = v30:getInstance()
    end
    if v30 then
        p25:playSmokePuff(v30)
    end
    return v27
end
function u16.unequip(p31, p32) --[[ Line: 88 ]]
    local v33 = p31.playerMaid[p32.UserId]
    if v33 ~= nil then
        v33:DoCleaning()
    end
end
function u16.playSmokePuff(_, p34) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u7
        [4] = u3
        [5] = u14
    --]]
    local v35 = u9.Assets.Effects.CloakSmokePuff:Clone()
    local v36 = {}
    local v37 = p34.PrimaryPart
    if v37 ~= nil then
        v37 = v37.CFrame
    end
    v36.CFrame = v37
    v36.Anchored = true
    v36.CanQuery = false
    v36.CanCollide = false
    v36.Transparency = 1
    v36.Parent = u10
    local u38 = u7("Part", v36)
    u3:setQueryIgnored(u38, true)
    v35.Parent = u38
    v35.Speed = NumberRange.new(5)
    u14:playEffects({ v35 }, p34)
    task.delay(5, function() --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:Destroy()
    end)
end
v5.CreateController(u16.new())
return nil