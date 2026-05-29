local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayer
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "VoidKnightArmorLobbyController"
    end,
    ["__index"] = u7
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p13)
    p13.Name = "VoidKnightArmorLobbyController"
    p13.playerMaid = {}
end
function u10.KnitStart(u14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u8
    --]]
    u7.KnitStart(u14)
    u2(function(u15, p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
        --]]
        if u15:GetAttribute("LobbyGadgetType") == u8.VOID_KNIGHT_ARMOR then
            u14:equip(u15)
        else
            u14:unequip(u15)
        end
        p16:GiveTask(u15:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u8
                [3] = u14
            --]]
            if u15:GetAttribute("LobbyGadgetType") == u8.VOID_KNIGHT_ARMOR then
                u14:equip(u15)
            else
                u14:unequip(u15)
            end
        end))
    end)
end
function u10.equip(u17, u18) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    task.spawn(function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u4
            [3] = u17
        --]]
        if not u18.Character then
            return nil
        end
        u18.Character:SetAttribute("Transparency", 1)
        local u19 = u4.new()
        local v20 = u18.Character:GetDescendants()
        local function v23(u21) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            if u21:IsA("Part") or (u21:IsA("BasePart") or u21:IsA("MeshPart")) then
                local u22 = u21.Transparency
                u19:GiveTask(function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u22
                    --]]
                    u21.Transparency = u22
                end)
                u21.Transparency = 1
            end
        end
        for v24, v25 in v20 do
            v23(v25, v24 - 1, v20)
        end
        u17:equipCharacter(u18.Character, u19)
        u17.playerMaid[u18.UserId] = u19
    end)
end
function u10.equipCharacter(_, p26, p27) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u9
    --]]
    local v28 = u6.Assets.Effects.VoidKnightArmor:Clone()
    local v29 = u5("Attachment", {
        ["Name"] = "LeftLowerArmAttachment",
        ["Parent"] = p26.LeftLowerArm
    })
    local v30 = u5("Attachment", {
        ["Name"] = "RightLowerArmAttachment",
        ["Parent"] = p26.RightLowerArm
    })
    p27:GiveTask(v29)
    p27:GiveTask(v30)
    for v31, v32 in v28:GetChildren() do
        local _ = v31 - 1
        if v32:IsA("Accessory") then
            p27:GiveTask(v32)
            v32.Parent = p26
        end
    end
    u9:weldCharacterAccessories(p26)
    return p27
end
function u10.unequip(p33, p34) --[[ Line: 106 ]]
    local v35 = p34.Character
    if v35 ~= nil then
        v35:SetAttribute("Transparency", 0)
    end
    local v36 = p33.playerMaid[p34.UserId]
    if v36 ~= nil then
        v36:DoCleaning()
    end
end
v3.CreateController(u10.new())
return nil