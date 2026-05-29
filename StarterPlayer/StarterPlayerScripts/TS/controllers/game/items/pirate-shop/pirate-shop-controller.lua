local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCharacter
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "PirateHatController"
    end,
    ["__index"] = u9
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "PirateHatController"
end
function u14.KnitStart(u18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u7
        [4] = u3
        [5] = u12
        [6] = u4
    --]]
    u9.KnitStart(u18)
    u11.Client:OnEvent("UnlockPirateCategory", function(p19) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u7
            [3] = u3
            [4] = u12
        --]]
        for v20, v21 in p19.players do
            local _ = v20 - 1
            u18:equipPirateHat(v21)
            if u7.LocalPlayer == v21 then
                u3:playSound(u12.HANNAH_UNSHEATH_SWORD, {})
            end
        end
    end)
    u4(function(p22, _) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        if p22:GetAttribute("HasPirateUnlock") == true then
            u18:equipPirateHat(p22)
        end
    end)
end
function u14.equipPirateHat(_, p23) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u13
    --]]
    local u24 = p23.Character
    if not u24 then
        return nil
    end
    local v25 = u10:getEntity(p23)
    if not v25 then
        return nil
    end
    local u26 = v25:getHumanoid()
    if not u26 then
        return nil
    end
    local u27 = {}
    for _, v28 in u24:GetChildren() do
        if v28:IsA("Accessory") and (v28.Name == "HatAttachment" and table.find(u27, v28) == nil) then
            table.insert(u27, v28)
            v28:Destroy()
        end
    end
    local v29 = u8.Assets.Misc.PirateHat:Clone()
    v29:SetAttribute("IsPirateHat", true)
    v29:SetAttribute("NoArmorHide", true)
    u26:AddAccessory(v29)
    local v30 = u8.Assets.Misc.Parrot:Clone()
    v30:SetAttribute("IsParrot", true)
    v30:SetAttribute("NoArmorHide", true)
    u26:AddAccessory(v30)
    v29.Destroying:Connect(function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u26
            [3] = u13
            [4] = u24
        --]]
        for _, v31 in u27 do
            u26:AddAccessory(v31)
            u13:weldCharacterAccessories(u24)
        end
    end)
    u13:weldCharacterAccessories(u24)
end
v5.CreateController(u14.new())
return nil