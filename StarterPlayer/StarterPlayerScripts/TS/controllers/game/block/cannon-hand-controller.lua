local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "CannonHandController"
    end,
    ["__index"] = u5
})
u9.__index = u9
function u9.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p12)
    p12.Name = "CannonHandController"
end
function u9.KnitStart(p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p13)
end
function u9.isRelevantItem(_, p14) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return p14.itemType == u7.TNT and true or p14.itemType == u7.SIEGE_TNT
end
function u9.onEnable(p15, _) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.Controllers.CannonController:stopAiming()
    p15:updateAllCannonPrompts()
end
function u9.onDisable(p16) --[[ Line: 39 ]]
    p16:updateAllCannonPrompts()
end
function u9.updateAllCannonPrompts(p17) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    for v18, v19 in u3.Controllers.CannonController:getCannons() do
        local _ = v18 - 1
        p17:updateCannonPrompts(v19)
    end
end
function u9.updateCannonPrompts(p20, p21) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
    --]]
    if u3.Controllers.CannonController:isAiming() then
        p21.AimPrompt.Enabled = false
        p21.StopAimingPrompt.Enabled = true
        p21.FirePrompt.Enabled = false
        p21.LaunchSelfPrompt.Enabled = false
        return nil
    end
    if p20:isEnabled() then
        p21.AimPrompt.Enabled = false
        p21.StopAimingPrompt.Enabled = false
        local v22 = p20:getHandItem()
        if v22 ~= nil then
            v22 = v22.itemType
        end
        if v22 then
            local v23 = u6(v22)
            p21.FirePrompt.ObjectText = "Consumes " .. v23.displayName
        else
            p21.FirePrompt.ObjectText = "Consumes Ammo"
        end
        p21.FirePrompt.Enabled = true
        return nil
    end
    p21.AimPrompt.Enabled = true
    p21.LaunchSelfPrompt.Enabled = true
    p21.StopAimingPrompt.Enabled = false
    p21.FirePrompt.Enabled = false
end
function u9.fireCannon(p24, p25) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
    --]]
    local v26 = p24:getHandItem()
    if not v26 then
        return nil
    end
    u8.Client:Get("FireCannon"):SendToServer({
        ["cannonBlockPos"] = u2:getBlockPosition(p25.Position),
        ["itemType"] = v26.itemType
    })
end
function u9.launchSelf(_, p27) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u4
    --]]
    if not u8.Client:Get("LaunchSelfFromCannon"):CallServer({
        ["cannonBlockPos"] = u2:getBlockPosition(p27.Position)
    }) then
        return nil
    end
    local v28 = u4.LocalPlayer.Character
    if v28 ~= nil then
        v28 = v28.PrimaryPart
    end
    if not v28 then
        return nil
    end
    local v29 = p27:GetAttribute("LookVector")
    if not v29 then
        return nil
    end
    local v30 = u4.LocalPlayer.Character
    if v30 ~= nil then
        v30 = v30.PrimaryPart
        if v30 ~= nil then
            v30 = v30.AssemblyMass
        end
    end
    v28:ApplyImpulse(v29 * (v30 == nil and 0 or v30) * 200)
end
u3.CreateController(u9.new())
return nil