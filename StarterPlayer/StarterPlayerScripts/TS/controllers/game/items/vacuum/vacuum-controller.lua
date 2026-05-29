local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.ExpireList
local u6 = v3.MobileButton
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vacuum", "vacuum-constants").VacuumConstants
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, script.Parent, "vacuum-gui").VacuumGUI
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "VacuumController"
    end,
    ["__index"] = u13
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
        [3] = u21
        [4] = u8
    --]]
    u13.constructor(p26)
    p26.Name = "VacuumController"
    p26.collectingGhosts = u5.new(2)
    p26.entityRemovedRemote = u21.Client:Get("CollectableEntityRemoved")
    p26.guiMaid = u8.new()
end
function u23.KnitStart(u27) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u17
        [3] = u12
    --]]
    u13.KnitStart(u27)
    u27.entityRemovedRemote:Connect(function(p28) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u12
            [3] = u27
        --]]
        if p28.entityType ~= u17.GHOST then
            return nil
        end
        if p28.collector ~= u12.LocalPlayer then
            return nil
        end
        u27.collectingGhosts:remove(p28.id)
    end)
end
function u23.isRelevantItem(_, p29) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return p29.itemType == u19.VACUUM
end
function u23.onEnable(u30, p31, u32) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u12
        [4] = u15
        [5] = u2
        [6] = u4
        [7] = u9
        [8] = u6
        [9] = u18
        [10] = u14
        [11] = u22
    --]]
    u13.onEnable(u30, p31, u32)
    u30:setupYield(function() --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u12
            [3] = u15
        --]]
        local u33 = u16:playAnimation(u12.LocalPlayer, u15.VACUUM_IDLE, {
            ["looped"] = true
        })
        return function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            local v34 = u33
            if v34 ~= nil then
                v34:Stop()
            end
        end
    end)
    local v37 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "use-vacuum",
        ["boundFunction"] = function(_, p35, p36) --[[ Name: boundFunction, Line 77 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u32
            --]]
            if not u30:getNearbyGhost() then
                return Enum.ContextActionResult.Pass
            end
            if p35 == Enum.UserInputState.Begin or p35 == Enum.UserInputState.End then
                u30:useVacuum(p36, u32)
            end
            return Enum.ContextActionResult.Sink
        end,
        ["priority"] = Enum.ContextActionPriority.Medium.Value
    })
    u30.maid:GiveTask(v37)
    if u4.isMobileControls() then
        u30:setupYield(function() --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u6
                [3] = u18
                [4] = u14
                [5] = u30
                [6] = u32
                [7] = u12
            --]]
            local u39 = u9.mount(u9.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u9.createElement(u6, {
                    ["Image"] = u18.SHOOT_MOBILE,
                    ["Position"] = u14:getActionMobileButtonPosition(),
                    ["OnPressDown"] = function(p38) --[[ Name: OnPressDown, Line 99 ]]
                        --[[
                        Upvalues:
                            [1] = u30
                            [2] = u32
                        --]]
                        u30:useVacuum(p38, u32)
                    end
                }) }), u12.LocalPlayer:WaitForChild("PlayerGui"))
            return function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u39
                --]]
                u9.unmount(u39)
            end
        end)
    end
    local v40 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u22, {
        ["InitialGhostCount"] = u30:getGhostCount()
    }))
    u30.guiMaid:GiveTask(v40)
end
function u23.onDisable(p41) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.onDisable(p41)
    p41.guiMaid:DoCleaning()
end
function u23.useVacuum(u42, p43, p44) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u12
        [3] = u15
        [4] = u20
    --]]
    if p43.UserInputState == Enum.UserInputState.End then
        local v45 = u42.animationTrack
        if v45 ~= nil then
            v45:Stop(0.1)
        end
        local v46 = u42.animationTrack
        if v46 ~= nil then
            v46:Destroy()
        end
        return nil
    end
    local v47 = u16:playAnimation(u12.LocalPlayer, u15.VACUUM_STARTUP, {
        ["looped"] = false
    })
    u42.animationTrack = u16:playAnimation(u12.LocalPlayer, u15.VACUUM_SUCK, {
        ["looped"] = true
    })
    if u42.animationTrack then
        u42.maid:GiveTask(function() --[[ Line: 138 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            local v48 = u42.animationTrack
            if v48 ~= nil then
                v48:Stop(0.1)
            end
            local v49 = u42.animationTrack
            if v49 ~= nil then
                v49:Destroy()
            end
        end)
    end
    if v47 ~= nil then
        v47.Stopped:Wait()
    end
    while true do
        local v50 = task.wait(0.1)
        if v50 ~= 0 and (v50 == v50 and v50) then
            v50 = p44()
            if v50 then
                if p43.UserInputState == Enum.UserInputState.End then
                    v50 = false
                else
                    v50 = u42:getGhostCount() < u20.MAX_GHOST_COUNT
                end
            end
        end
        if v50 == 0 or (v50 ~= v50 or not v50) then
            local v51 = u42.animationTrack
            if v51 ~= nil then
                v51:Stop(0.1)
            end
            local v52 = u42.animationTrack
            if v52 ~= nil then
                v52:Destroy()
            end
            return
        end
        u42:tryVacuumNearbyGhost()
    end
end
function u23.tryVacuumNearbyGhost(p53) --[[ Line: 172 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v54 = p53:getNearbyGhost()
    if not v54 then
        return nil
    end
    local v55 = v54:GetAttribute("Id")
    if p53.collectingGhosts:has(v55) then
        return nil
    end
    p53.collectingGhosts:add(v55)
    u21.Client:Get("CollectCollectableEntity"):SendToServer({
        ["id"] = v55
    })
end
function u23.getNearbyGhost(_) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
    --]]
    local v56 = u12.LocalPlayer.Character
    if v56 ~= nil then
        v56 = v56.PrimaryPart
        if v56 ~= nil then
            v56 = v56.CFrame
        end
    end
    if not v56 then
        return nil
    end
    local v57 = v56.Position + v56.LookVector.Unit * 15
    local v58 = nil
    for v59, v60 in u11:GetTagged("ghost") do
        local _ = v59 - 1
        if (v60:GetPivot().Position - v57).Magnitude < 15 == true then
            v58 = v60
            break
        end
    end
    return v58
end
function u23.onStartCharging(_) --[[ Line: 221 ]] end
function u23.onStopCharging(_) --[[ Line: 223 ]] end
function u23.onLaunch(u61, u62) --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u12
        [3] = u15
    --]]
    task.spawn(function() --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u12
            [3] = u15
            [4] = u62
            [5] = u61
        --]]
        local u63 = u16:playAnimation(u12.LocalPlayer, u15.VACUUM_LAUNCH, {
            ["looped"] = false
        })
        if not u62() and u63 ~= nil then
            u63:Stop()
        end
        if u63 then
            u61.maid:GiveTask(function() --[[ Line: 237 ]]
                --[[
                Upvalues:
                    [1] = u63
                --]]
                return u63:Stop()
            end)
        end
    end)
    u61:setLocalGhostCount(u61:getGhostCount() - 1)
end
function u23.canLaunch(p64) --[[ Line: 244 ]]
    return p64:getGhostCount() > 0
end
function u23.onStartReload(_, _) --[[ Line: 247 ]] end
function u23.getGhostCount(_) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v65 = u12.LocalPlayer:GetAttribute("Vacuum_GhostCount")
    return v65 == nil and 0 or v65
end
function u23.setLocalGhostCount(_, p66) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.LocalPlayer:SetAttribute("Vacuum_GhostCount", p66)
end
v7.CreateController(u23.new())
return nil