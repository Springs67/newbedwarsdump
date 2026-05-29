local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.ReplicatedStorage
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "hero-villain-types").HVFaction
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "HeroVillainAssignmentController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "HeroVillainAssignmentController"
end
function u11.KnitStart(u15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u4
    --]]
    u6.KnitStart(u15)
    u8.Client:OnEvent("NotifyHeroVillainAssignment", function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u15
        --]]
        if p16.player == u4.LocalPlayer then
            u15.localAssignment = p16.faction
        end
        u15:addAssignmentCapeToPlayer(p16.player, p16.faction)
    end)
end
function u11.getLocalHeroVillainAssignment(p17) --[[ Line: 39 ]]
    return p17.localAssignment
end
function u11.addAssignmentCapeToPlayer(_, p18, p19) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u9
        [4] = u10
    --]]
    local v20 = p18.Character
    if v20 then
        local v21 = v20:GetAttribute("CapeSetUP")
        if v21 == 0 or (v21 ~= v21 or (v21 == "" or not v21)) then
            v20:SetAttribute("CapeSetUP", true)
            if p19 == u7.VILLAIN then
                local v22 = u5.Assets.Misc.LuckyBlockVillainCape:Clone()
                v22:SetAttribute("NoArmorHide", true)
                u9:addAccessory(v20, v22)
                u10:weldCharacterAccessories(v20)
            else
                local v23 = u5.Assets.Misc.LuckyBlockHeroCape:Clone()
                v23:SetAttribute("NoArmorHide", true)
                u9:addAccessory(v20, v23)
                u10:weldCharacterAccessories(v20)
            end
        else
            return nil
        end
    else
        return nil
    end
end
v2.CreateController(u11.new())
return nil