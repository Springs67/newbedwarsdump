local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = v8.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "BlockDisguiseController"
    end,
    ["__index"] = u14
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p23)
    p23.Name = "BlockDisguiseController"
    p23.disguisedPlayerMap = {}
end
function u20.KnitStart(u24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u18
        [4] = u10
    --]]
    u14.KnitStart(u24)
    u13.StatusEffectAdded:connect(function(p25) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u10
            [3] = u24
        --]]
        if p25.statusEffect ~= u18.INVISIBILITY then
            return nil
        end
        local v26 = u10:GetPlayerFromCharacter(p25.entityInstance)
        if not v26 then
            return nil
        end
        local v27 = u24:getPlayerBlockModel(v26)
        if v27 then
            u24:setTransparencyOfModel(v27, 1)
        end
    end)
    u13.StatusEffectRemoved:connect(function(p28) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u10
            [3] = u24
        --]]
        if p28.statusEffect == u18.INVISIBILITY then
            local v29 = u10:GetPlayerFromCharacter(p28.entityInstance)
            if v29 then
                local v30 = u24:getPlayerBlockModel(v29)
                if v30 then
                    u24:setTransparencyOfModel(v30, 0)
                elseif v29.Character then
                    u24:setTransparencyOfModel(v29.Character, 0)
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
end
function u20.getPlayerBlockModel(_, p31) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v32 = u12
    local v33 = p31.UserId
    return v32:FindFirstChild("DisguisedPlayerBlock_" .. tostring(v33))
end
function u20.anchorBlockModel(_, p34) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v35 = u12
    local v36 = p34.UserId
    local v37 = v35:FindFirstChild("DisguisedPlayerBlock_" .. tostring(v36))
    if not v37 then
        return false
    end
    for v38, v39 in v37:GetDescendants() do
        local _ = v38 - 1
        if v39:IsA("BasePart") then
            v39.Anchored = true
            v39.CanCollide = false
        else
            v39:IsA("WeldConstraint")
        end
    end
    return true
end
function u20.disguisePlayerAsBlock(p40, p41, p42) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u17
        [3] = u12
        [4] = u9
        [5] = u7
        [6] = u15
        [7] = u5
        [8] = u6
        [9] = u2
        [10] = u16
        [11] = u19
        [12] = u18
    --]]
    local v43 = u11:WaitForChild("Items"):WaitForChild(p42)
    local v44 = u17.cloneItemIntoModel(v43)
    local v45 = v44:FindFirstChildWhichIsA("BasePart")
    local v46 = p41.Character
    local v47
    if v46 == nil then
        v47 = v46
    else
        v47 = v46:FindFirstChildWhichIsA("Humanoid")
    end
    local v48
    if v46 == nil then
        v48 = v46
    else
        v48 = v46.PrimaryPart
    end
    if not (v45 and (v46 and (v47 and v48))) then
        v44:Destroy()
        return nil
    end
    v44.Parent = u12
    local v49 = p41.UserId
    v44.Name = "DisguisedPlayerBlock_" .. tostring(v49)
    for v50, v51 in v44:GetDescendants() do
        local _ = v50 - 1
        if v51:IsA("BasePart") then
            v51.CanCollide = false
            v51.Anchored = false
        end
    end
    u9:AddTag(v44, "DontBlockSwordRaycast")
    u7(v44, u15 / 2.8 * 2)
    local v52 = u5.new()
    v52:GiveTask(v44)
    local v53 = v48.Size.Y / 2 + v47.HipHeight - u15 / 2
    v44:PivotTo(v48.CFrame - Vector3.new(0, v53, 0))
    v52:GiveTask((u6("WeldConstraint", {
        ["Part0"] = v45,
        ["Part1"] = v48,
        ["Parent"] = v44
    })))
    local v54 = u2.getOrCreate(p40.disguisedPlayerMap, p41, {
        ["hiddenPlayerMaid"] = nil,
        ["blockMaid"] = nil,
        ["heldItemMaid"] = nil
    })
    local v55 = v54.blockMaid
    if v55 ~= nil then
        v55:Destroy()
    end
    v54.blockMaid = v52
    v54.blockType = p42
    local v56 = u16:getEntity(p41)
    if v56 ~= nil then
        v56 = v56:getInstance()
    end
    if v56 and u19:isActive(v56, u18.INVISIBILITY) then
        p40:setTransparencyOfModel(v44, 1)
    end
end
function u20.undisguisePlayer(p57, p58) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
        [3] = u18
    --]]
    local v59 = p57.disguisedPlayerMap[p58]
    if v59 ~= nil then
        local v60 = v59.blockMaid
        if v60 ~= nil then
            v60:Destroy()
        end
    end
    p57:unhidePlayer(p58)
    if v59 ~= nil then
        local v61 = v59.heldItemMaid
        if v61 ~= nil then
            v61:Destroy()
        end
    end
    p57.disguisedPlayerMap[p58] = nil
    local v62 = u16:getEntity(p58)
    if v62 ~= nil then
        v62 = v62:getInstance()
    end
    if v62 and u19:isActive(v62, u18.INVISIBILITY) then
        p57:setTransparencyOfModel(p58.Character, 1)
    end
end
function u20.unhidePlayer(p63, p64) --[[ Line: 189 ]]
    local v65 = p63.disguisedPlayerMap[p64]
    if v65 ~= nil then
        local v66 = v65.hiddenPlayerMaid
        if v66 ~= nil then
            v66:Destroy()
        end
    end
end
function u20.hidePlayer(p67, p68, p69) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
        [3] = u10
        [4] = u3
        [5] = u5
    --]]
    local v70 = u2.getOrCreate(p67.disguisedPlayerMap, p68, {
        ["hiddenPlayerMaid"] = nil,
        ["blockMaid"] = nil,
        ["heldItemMaid"] = nil
    })
    local v71 = v70.hiddenPlayerMaid
    if v71 ~= nil then
        v71:Destroy()
    end
    local v72 = v70.heldItemMaid
    if v72 ~= nil then
        v72:Destroy()
    end
    local u73 = p68.Character
    if not u73 then
        return nil
    end
    local u74 = u16:getEntity(p68)
    if not u74 then
        return nil
    end
    if p68.Team ~= u10.LocalPlayer.Team or (p68 == u10.LocalPlayer or p69) then
        u74:hideNametag()
    end
    local u75 = {
        ["transparency"] = 1
    }
    u3.Controllers.CharacterTransparencyController:getTransparencyModifier(u73):addModifier(u75)
    for v76, v77 in u73:GetDescendants() do
        local _ = v76 - 1
        if v77:IsA("BasePart") then
            v77.LocalTransparencyModifier = 1
        elseif v77:IsA("Decal") then
            v77.LocalTransparencyModifier = 1
        end
    end
    local u79 = u73.ChildAdded:Connect(function(p78) --[[ Line: 244 ]]
        if p78:IsA("BasePart") then
            p78.LocalTransparencyModifier = 1
        elseif p78:IsA("Decal") then
            p78.LocalTransparencyModifier = 1
        end
    end)
    local v80 = u5.new()
    v80:GiveTask(function() --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u73
            [3] = u3
            [4] = u75
            [5] = u74
        --]]
        u79:Disconnect()
        for v81, v82 in u73:GetDescendants() do
            local _ = v81 - 1
            if v82:IsA("BasePart") then
                v82.LocalTransparencyModifier = 0
            elseif v82:IsA("Decal") then
                v82.LocalTransparencyModifier = 0
            end
        end
        u3.Controllers.CharacterTransparencyController:getTransparencyModifier(u73):removeModifier(u75)
        u74:showNametag()
    end)
    local v83
    if u10.LocalPlayer == p68 then
        u3.Controllers.ViewmodelController:setHeldItem(nil)
        v83 = u5.new()
        v83:GiveTask(function() --[[ Line: 264 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u10
                [3] = u3
            --]]
            local v84 = u16:getEntity(u10.LocalPlayer)
            if v84 ~= nil then
                v84 = v84:getHandItemInstanceFromCharacter()
            end
            local v85 = u3.Controllers.ViewmodelController
            if v84 ~= nil then
                v84 = v84:Clone()
            end
            v85:setHeldItem(v84)
        end)
    else
        v83 = nil
    end
    v70.hiddenPlayerMaid = v80
    v70.heldItemMaid = v83
end
function u20.getDisguisedPlayer(p86, p87) --[[ Line: 281 ]]
    return p86.disguisedPlayerMap[p87]
end
function u20.getDisguisedPlayers(p88) --[[ Line: 286 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.keys(p88.disguisedPlayerMap)
end
function u20.setTransparencyOfModel(_, p89, p90) --[[ Line: 289 ]]
    for _, v91 in p89:GetDescendants() do
        if (v91:IsA("BasePart") or (v91:IsA("Decal") or v91:IsA("Texture"))) and v91.Name ~= "HumanoidRootPart" then
            v91.Transparency = p90
        end
    end
end
u3.CreateController(u20.new())
return nil