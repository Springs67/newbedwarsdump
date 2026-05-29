local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InExpo
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "UnstablePortalController"
    end,
    ["__index"] = u11
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p18)
    p18.Name = "UnstablePortalController"
end
function u15.KnitStart(u19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u13
        [4] = u12
    --]]
    u11.KnitStart(u19)
    u14.Client:Get("UnstablePortalEffect"):Connect(function(p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u12
            [3] = u19
        --]]
        local v21 = u13:getEntity(p20.player)
        if v21 then
            if u12:isAboveVoid(v21:getInstance(), 15) then
                u19:aboveAirEffect(p20.player)
            else
                u19:onGroundEffect(p20.player)
            end
        else
            return nil
        end
    end)
    u14.Client:Get("PlayerLeavePortal"):Connect(function(p22) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:leavePortalEffect(p22.targetPosition, p22.player)
    end)
end
function u15.aboveAirEffect(_, p23) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u10
        [4] = u5
        [5] = u6
        [6] = u8
    --]]
    local v24 = u13:getEntity(p23)
    if not v24 then
        return nil
    end
    local v25 = p23.Character
    if not v25 then
        return nil
    end
    local v26 = v25.PrimaryPart
    if v26 ~= nil then
        v26 = v26.Position
    end
    if not v26 then
        return nil
    end
    v25.Archivable = true
    local u27 = v25:Clone()
    u27.Parent = u9
    v25:SetAttribute("Transparency", 1)
    v24:hideNametag()
    u10(1, u5, function(p28) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u27
        --]]
        u6(u27, 1 - p28)
    end)
    u10(1, u5, function(p29) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:PivotTo(p29)
    end, u27.PrimaryPart.CFrame, CFrame.new(v26 - Vector3.new(0, 15, 0)))
    local u30 = u8.Assets.Effects.UnstablePortal:Clone()
    u30.Parent = u9
    u30:PivotTo(CFrame.new(v26 - Vector3.new(0, 15, 0)))
    task.delay(1, function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u27
        --]]
        u30:Destroy()
        u27:Destroy()
    end)
end
function u15.onGroundEffect(_, p31) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u4
    --]]
    local v32 = p31.Character
    if v32 ~= nil then
        v32 = v32.PrimaryPart
        if v32 ~= nil then
            v32 = v32.Position
        end
    end
    if not v32 then
        return nil
    end
    local u33 = u8.Assets.Effects.UnstablePortal:Clone()
    u33:PivotTo(CFrame.new(v32 - Vector3.new(0, 1.5, 0)))
    u33.Parent = u9
    u4.Controllers.VoidTeleportPortalController:jumpInPortal(p31, v32 - Vector3.new(0, 1.5, 0))
    task.delay(1, function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:Destroy()
    end)
end
function u15.leavePortalEffect(_, p34, p35) --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u9
        [4] = u10
        [5] = u5
    --]]
    local u36 = p35.Character
    if not u36 then
        return nil
    end
    u36.Archivable = true
    local u37 = u8.Assets.Effects.UnstablePortal:Clone()
    local u38 = u36:Clone()
    u6(u38, 0.1)
    u38.Parent = u9
    u38:SetAttribute("Transparency", 0)
    for v39, v40 in u38:GetDescendants() do
        local _ = v39 - 1
        if (v40:IsA("BasePart") or v40:IsA("Decal") and not v40:IsA("Texture")) and v40 ~= u38.PrimaryPart then
            v40.Transparency = 0
        end
    end
    u37:PivotTo(CFrame.new(p34 + Vector3.new(0, 9, 0)))
    u38:PivotTo(CFrame.new(p34 + Vector3.new(0, 9, 0)))
    u37.Parent = u9
    u10(1, u5, function(p41) --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u38
        --]]
        u6(u38, p41)
    end)
    u10(1, u5, function(p42) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:PivotTo(p42)
    end, u38.PrimaryPart.CFrame, CFrame.new(p34))
    task.delay(1, function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u37
            [3] = u36
        --]]
        u38:Destroy()
        u37:Destroy()
        u36:SetAttribute("Transparency", 0)
    end)
end
v3.CreateController(u15.new())
return nil