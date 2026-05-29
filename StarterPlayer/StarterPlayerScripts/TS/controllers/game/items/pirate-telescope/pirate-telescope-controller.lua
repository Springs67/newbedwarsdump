local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.RunService
local u10 = v7.TweenService
local u11 = v7.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = TweenInfo.new(0.8, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
local u23 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
local u24 = v17.PIRATE_TELESCOPE_RANGE
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "PirateTelescopeService"
    end,
    ["__index"] = u13
})
u25.__index = u25
function u25.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
    --]]
    u13.constructor(p28)
    p28.Name = "PirateTelescopeService"
    p28.abilityMaid = u5.new()
end
function u25.isRelevantItem(_, p29) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    return p29.itemType == u20.PIRATE_TELESCOPE
end
function u25.onEnable(p30, _, _) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
        [3] = u19
        [4] = u20
    --]]
    p30:setupDestroyableYield(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
            [3] = u19
            [4] = u20
        --]]
        local v31 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v32 = u14.PIRATE_TELESCOPE
        local v33 = {}
        local v34 = {}
        local v35 = u19(u20.PIRATE_TELESCOPE).image
        v34.icon = v35 == nil and "" or v35
        v33.abilityButton = v34
        v33.abilityType = "ItemPrimary"
        return v31:enableAbility(v32, v33):expect()
    end)
end
function u25.onDisable(p36) --[[ Line: 67 ]]
    p36.abilityMaid:DoCleaning()
end
function u25.KnitStart(u37) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u14
        [4] = u8
        [5] = u21
        [6] = u3
        [7] = u16
        [8] = u15
    --]]
    u13.KnitStart(u37)
    u12.AbilityUsed:connect(function(p38) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u8
            [3] = u21
            [4] = u3
            [5] = u16
            [6] = u15
        --]]
        local v39
        if p38.ability == u14.PIRATE_TELESCOPE and p38.userCharacter == u8.LocalPlayer.Character then
            v39 = u21.Client:Get("PirateTelescopeAura"):CallServer()
        else
            v39 = false
        end
        local v40 = v39 and u8:GetPlayerFromCharacter(p38.userCharacter)
        if v40 then
            local u41 = u3:playAnimation(v40, u16:getAssetId(u15.BOBA_BLASTER_IDLE))
            task.delay(1, function() --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                local v42 = u41
                if v42 ~= nil then
                    v42:Stop()
                end
                local v43 = u41
                if v43 ~= nil then
                    v43:Destroy()
                end
            end)
        end
    end)
    u21.Client:Get("PlayTelescopeEffect"):Connect(function(p44) --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37:createRadius(p44.player)
    end)
end
function u25.createRadius(_, p45) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u11
        [3] = u6
        [4] = u9
        [5] = u10
        [6] = u22
        [7] = u24
        [8] = u23
    --]]
    local v46 = p45.Team
    if v46 ~= nil then
        v46 = v46.TeamColor.Color
    end
    local u47 = u18:getEntity(p45)
    local v48 = p45.Character
    if v48 ~= nil then
        v48 = v48:GetPrimaryPartCFrame().Position
    end
    if not v48 then
        return nil
    end
    local u49 = u6("Part", {
        ["Size"] = Vector3.new(0.2, 0, 0),
        ["Parent"] = u11,
        ["CFrame"] = CFrame.new(v48) - Vector3.new(0, 2, 0),
        ["Orientation"] = Vector3.new(0, 0, 90),
        ["Shape"] = Enum.PartType.Cylinder,
        ["Color"] = v46,
        ["Transparency"] = 0,
        ["CastShadow"] = false,
        ["Material"] = Enum.Material.ForceField,
        ["Reflectance"] = 0,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanTouch"] = false,
        ["CanQuery"] = false
    })
    u9.Heartbeat:Connect(function() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u47
        --]]
        local v50 = u49
        if v50 then
            v50 = u47
            if v50 ~= nil then
                v50 = v50:isAlive()
            end
            if v50 then
                v50 = u47:getInstance():GetPrimaryPartCFrame().Position
            end
        end
        if not v50 then
            return nil
        end
        u49.Position = u47:getInstance():GetPrimaryPartCFrame().Position - Vector3.new(0, 2, 0)
    end)
    local v51 = u10
    local v52 = u22
    local v53 = {}
    local v54 = u24
    local v55 = u24
    v53.Size = Vector3.new(0.2, v54, v55)
    local v56 = v51:Create(u49, v52, v53)
    v56:Play()
    local u57 = nil
    u57 = v56.Completed:Connect(function() --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u49
            [3] = u23
            [4] = u24
            [5] = u57
        --]]
        local v58 = u10
        local v59 = u49
        local v60 = u23
        local v61 = {}
        local v62 = u24
        local v63 = u24
        v61.Size = Vector3.new(0.2, v62, v63)
        local v64 = u49.Position.X
        local v65 = u49.Position.Y + 0.1 + 0.1
        local v66 = u49.Position.Z
        v61.Position = Vector3.new(v64, v65, v66)
        v58:Create(v59, v60, v61):Play()
        u57:Disconnect()
        u49:Destroy()
    end)
end
v4.CreateController(u25.new())
return nil