local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ContextActionService
local u8 = v6.Players
local u9 = v6.RunService
local u10 = v6.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "OwlTargetController"
    end,
    ["__index"] = u12
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
    --]]
    u12.constructor(p24)
    p24.Name = "OwlTargetController"
    p24.maid = u4.new()
end
function u21.KnitStart(u25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u8
        [4] = u14
        [5] = u20
        [6] = u13
        [7] = u18
    --]]
    u12.KnitStart(u25)
    u11.AbilityUsed:connect(function(p26) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
            [3] = u25
            [4] = u20
            [5] = u13
            [6] = u18
        --]]
        if p26.userCharacter == u8.LocalPlayer.Character and (p26.ability == u14.SUMMON_OWL and u25.target) then
            local v27 = u8:GetPlayerFromCharacter(u25.target)
            if not v27 then
                return nil
            end
            if u20.Client:Get("SummonOwl"):CallServer(v27) then
                u13:dispatch({
                    ["type"] = "UnequipItemInHand",
                    ["equip"] = false
                })
                local v28 = u18.getInventory(u8.LocalPlayer).hand
                if v28 ~= nil then
                    v28 = v28.itemType
                end
                if v28 then
                    local v29 = u8.LocalPlayer.Character
                    if v29 ~= nil then
                        local v30 = v29:WaitForChild(v28, 3)
                        if v30 ~= nil then
                            v30:Destroy()
                        end
                    end
                end
            end
        end
    end)
end
function u21.isRelevantItem(_, p31) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return p31.itemType == u19.OWL_ORB
end
function u21.onEnable(u32, _, _) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
        [3] = u17
        [4] = u7
        [5] = u9
        [6] = u10
        [7] = u16
        [8] = u8
        [9] = u15
        [10] = u5
    --]]
    u32:setupYield(function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u2
            [3] = u14
            [4] = u17
        --]]
        local v33 = u32.maid
        local v34 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v35 = u14.SUMMON_OWL
        local v36 = {
            ["abilityType"] = "ItemPrimary",
            ["abilityButton"] = {
                ["icon"] = u17.OWL_IMAGE
            }
        }
        v33:GiveTask(v34:enableAbility(v35, v36):expect())
        return function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            u32.maid:DoCleaning()
        end
    end)
    u7:BindAction("Use Owl", function(_, p37, _) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        if p37 == Enum.UserInputState.Cancel then
            return nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u14.SUMMON_OWL)
    end, false, Enum.UserInputType.MouseButton1)
    u32.maid:GiveTask(u9.Heartbeat:Connect(function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u32
            [3] = u16
            [4] = u8
            [5] = u15
            [6] = u5
        --]]
        local v38 = u10.CurrentCamera
        if v38 ~= nil then
            v38 = v38.CFrame
        end
        if not v38 then
            u32:removeTarget()
            return nil
        end
        if not u16:getLocalPlayerEntity() then
            u32:removeTarget()
            return nil
        end
        local v39 = u8.LocalPlayer.Character
        if v39 ~= nil then
            v39 = v39.PrimaryPart
            if v39 ~= nil then
                v39 = v39.Position
            end
        end
        if not v39 then
            return nil
        end
        local v40 = u32:getPotentialTargetTeammates(v39, u15.OWL_ATTACH_MAX_RANGE)
        local v41 = Ray.new(v38.Position, v38.LookVector).Unit
        local v42 = (1 / 0)
        local v43 = nil
        for _, v44 in v40 do
            local v45 = v44:getInstance():GetPrimaryPartCFrame().Position
            local v46 = v41:ClosestPoint(v45)
            local v47 = (v45 - v46).Magnitude
            if v47 <= 60 then
                local v48 = v47 + (v41.Origin - v46).Magnitude / 3
                if v48 < v42 then
                    v43 = v44:getInstance()
                    v42 = v48
                end
            end
        end
        if u32.target ~= v43 then
            u32:removeTarget()
            if v43 then
                local v49 = Color3.fromRGB(0, 133, 255)
                local v50 = u32
                local v51 = u5
                local v52 = {
                    ["StudsOffset"] = Vector3.new(0, 7, 0),
                    ["AlwaysOnTop"] = true,
                    ["Parent"] = v43.PrimaryPart,
                    ["Size"] = UDim2.fromOffset(40, 40),
                    ["Children"] = { u5("ImageLabel", {
                            ["Image"] = "rbxassetid://9429977101",
                            ["BackgroundTransparency"] = 1,
                            ["ImageTransparency"] = 0,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["ScaleType"] = Enum.ScaleType.Fit,
                            ["ImageColor3"] = v49
                        }) }
                }
                v50.targetIcon = v51("BillboardGui", v52)
            end
        end
        u32.target = v43
    end))
end
function u21.onDisable(p53) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p53:removeTarget()
    p53.maid:DoCleaning()
    u7:UnbindAction("Use Owl")
end
function u21.removeTarget(p54) --[[ Line: 170 ]]
    p54.target = nil
    local v55 = p54.targetIcon
    if v55 ~= nil then
        v55:Destroy()
    end
end
function u21.getPotentialTargetTeammates(_, p56, _) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u15
        [3] = u16
    --]]
    local v57 = {}
    for _, v58 in u8:GetPlayers() do
        local v59 = v58.Character
        if v59 ~= nil then
            v59 = v59.PrimaryPart
        end
        local v60 = v59 and (v58.Character.PrimaryPart.Position - p56).Magnitude < u15.OWL_ATTACH_MAX_RANGE
        if v60 then
            if v58.Team == u8.LocalPlayer.Team then
                v60 = v58 ~= u8.LocalPlayer
            else
                v60 = false
            end
            if v60 then
                local v61 = v58:GetAttribute("IsOwlTarget")
                if v61 == 0 or v61 ~= v61 then
                    v61 = false
                elseif v61 == "" then
                    v61 = false
                end
                v60 = not v61
            end
        end
        if v60 then
            local v62 = u16:getEntity(v58)
            if v62 then
                table.insert(v57, v62)
            end
        end
    end
    return v57
end
v3.CreateController(u21.new())
return nil