local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CollectionTagAdded
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InExpo
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").getMountMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "VoidTeleportPortalController"
    end,
    ["__index"] = u15
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p25)
    p25.Name = "VoidTeleportPortalController"
    p25.lastTeleport = -1
end
function u22.KnitStart(u26) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u3
        [3] = u12
        [4] = u13
        [5] = u20
    --]]
    u15.KnitStart(u26)
    u3("void_teleport_portal", function(u27) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u26
            [3] = u13
            [4] = u20
        --]]
        u27.Touched:Connect(function(p28) --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u26
                [3] = u13
                [4] = u20
                [5] = u27
            --]]
            if u12.LocalPlayer.Character and (p28.Parent == u12.LocalPlayer.Character and u26.lastTeleport + 2 <= u13:GetServerTimeNow()) then
                u26.lastTeleport = u13:GetServerTimeNow()
                local v29 = {
                    ["voidBlock"] = u27
                }
                u20.Client:Get("StepOnVoidPortal"):SendToServer(v29)
            end
        end)
    end)
    u20.Client:Get("VoidPortalEffect"):Connect(function(p30) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        if p30.entering then
            u26:jumpInPortal(p30.player, p30.portalPosition)
        else
            u26:jumpOutPortal(p30.player, p30.targetPosition)
        end
    end)
end
function u22.jumpInPortal(_, p31, p32) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u21
        [4] = u18
        [5] = u11
        [6] = u13
        [7] = u6
        [8] = u19
        [9] = u7
        [10] = u17
        [11] = u16
        [12] = u14
        [13] = u8
        [14] = u9
    --]]
    if p31 == u12.LocalPlayer then
        u4:playSound(u21.VOID_PORTAL_ENTER)
    end
    local v33 = p31.Character
    local v34 = u18:getEntity(p31)
    if not (v33 and v34) then
        return nil
    end
    local v35 = p32 or v33.PrimaryPart.Position - Vector3.new(0, 2, 0)
    v33.Archivable = true
    local u36 = v33:Clone()
    v33:SetAttribute("Transparency", 1)
    u36:SetAttribute("FirstPersonVisible", false)
    u11:AddTag(u36, "FirstPersonHidden")
    v34:hideNametag()
    u36:PivotTo(v33.PrimaryPart.CFrame)
    u36.Parent = u13
    local v37 = u6.Controllers.MountController:getMountTypeFromPlayer(p31)
    if v37 then
        local v38 = u36:WaitForChild(v37, 0.5)
        local v39 = u19(v37).animations.fall
        local v40
        if v39 == 0 or v39 ~= v39 then
            v40 = v39
        elseif v39 then
            v40 = v38
        else
            v40 = v39
        end
        if v40 ~= 0 and (v40 == v40 and v40) then
            u7.Controllers.MountAnimationController:playAnimationInMount(v38, v39)
        end
    else
        u17:playAnimation(u36, u16.GRAVEYARD_JUMP)
    end
    u14(1, u8, function(p41) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u36
        --]]
        u9(u36, 1 - p41)
    end)
    u14(1, u8, function(p42) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:PivotTo(p42)
    end, u36.PrimaryPart.CFrame, CFrame.new(v35))
    task.delay(1, function() --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:Destroy()
    end)
end
function u22.jumpOutPortal(_, u43, p44) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u21
        [4] = u13
        [5] = u6
        [6] = u19
        [7] = u7
        [8] = u17
        [9] = u16
        [10] = u14
        [11] = u8
        [12] = u18
    --]]
    if u43 == u12.LocalPlayer then
        u4:playSound(u21.VOID_PORTAL_EXIT)
    end
    local u45 = u43.Character
    if not u45 then
        return nil
    end
    u45.Archivable = true
    local u46 = u45:Clone()
    u46:PivotTo(p44)
    u46:SetAttribute("Transparency", 0.25)
    for v47, v48 in u46:GetDescendants() do
        local _ = v47 - 1
        if v48:IsA("MeshPart") then
            v48.Transparency = 0
            v48.CanCollide = false
        end
        if v48:IsA("Part") then
            v48.Transparency = 1
            v48.CanCollide = false
        end
    end
    u46.Parent = u13
    u46.PrimaryPart.Transparency = 1
    local v49 = u6.Controllers.MountController:getMountTypeFromPlayer(u43)
    if v49 then
        local v50 = u46:WaitForChild(v49, 0.5)
        local v51 = u19(v49).animations.jump
        local v52
        if v51 == 0 or v51 ~= v51 then
            v52 = v51
        elseif v51 then
            v52 = v50
        else
            v52 = v51
        end
        if v52 ~= 0 and (v52 == v52 and v52) then
            u7.Controllers.MountAnimationController:playAnimationInMount(v50, v51)
        end
    else
        u17:playAnimation(u46, u16.SKELETON_SPAWN)
    end
    u14(1, u8, function(p53) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        u46:PivotTo(p53)
    end, u46.PrimaryPart.CFrame, u45.PrimaryPart.CFrame)
    task.delay(1, function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u45
            [3] = u18
            [4] = u43
        --]]
        u46:Destroy()
        u45:SetAttribute("Transparency", 0)
        u18:getEntity(u43):showNametag()
    end)
end
u6.CreateController(u22.new())
return nil