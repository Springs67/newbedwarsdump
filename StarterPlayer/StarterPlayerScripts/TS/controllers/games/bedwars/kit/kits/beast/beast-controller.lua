local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.GameQueryUtil
local u6 = v3.SoundManager
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.ReplicatedStorage
local u17 = v14.Workspace
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "beast", "beast-util").BeastKit
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u29 = u1.import(script, script.Parent, "ui", "beast-bloodlust-bar").BeastBloodlustBar
local u30 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "BeastController"
    end,
    ["__index"] = u28
})
u30.__index = u30
function u30.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v31 = u30
    local v32 = setmetatable({}, v31)
    return v32:constructor(...) or v32
end
function u30.constructor(p33) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u23
        [3] = u11
    --]]
    u28.constructor(p33, u23.BEAST)
    p33.Name = "BeastController"
    p33.activeVisuals = {}
    p33.beastAbilityUnlockMaid = u11.new()
end
function u30.onKitLocalActivated(u34, p35) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u13
        [3] = u29
        [4] = u15
    --]]
    u34:unmountBloodlustBar()
    local v36 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController")
    local v37 = u13.createElement
    local v38 = u29
    local v39 = {
        ["Size"] = UDim2.fromScale(0.36, 0.03),
        ["ProgressBarConfig"] = {
            ["Flip"] = false,
            ["GradientRotation"] = 0,
            ["BarGradient"] = ColorSequence.new(Color3.fromRGB(38, 4, 8), Color3.fromRGB(188, 28, 38))
        }
    }
    u34.bloodlustBarMaid = v36:addComponent(v37(v38, v39))
    p35:GiveTask(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        return u34:unmountBloodlustBar()
    end)
    p35:GiveTask(u15.LocalPlayer:GetAttributeChangedSignal("BeastBloodlust"):Connect(function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:updateBeastAbilityState()
    end))
    p35:GiveTask(u15.LocalPlayer:GetAttributeChangedSignal("BeastIsActive"):Connect(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:updateBeastAbilityState()
    end))
    p35:GiveTask(u15.LocalPlayer:GetAttributeChangedSignal("BeastCanDeactivateAt"):Connect(function() --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:updateBeastAbilityState()
    end))
    p35:GiveTask(function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        return u34.beastAbilityUnlockMaid:DoCleaning()
    end)
    u34:updateBeastAbilityState()
end
function u30.onKitLocalDeactivated(p40) --[[ Line: 78 ]]
    p40:unmountBloodlustBar()
end
function u30.onKitReplicationActivated(u41, _) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u21
        [3] = u9
        [4] = u24
        [5] = u22
        [6] = u11
        [7] = u1
        [8] = u20
        [9] = u15
        [10] = u25
        [11] = u12
        [12] = u16
        [13] = u5
        [14] = u6
        [15] = u27
        [16] = u18
        [17] = u10
    --]]
    u26.Client:OnEvent("ActivateBeast", function(u42) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u9
            [3] = u41
            [4] = u24
            [5] = u22
            [6] = u11
            [7] = u1
            [8] = u20
            [9] = u15
            [10] = u25
            [11] = u12
            [12] = u16
            [13] = u5
            [14] = u6
            [15] = u27
            [16] = u18
            [17] = u10
        --]]
        local v43 = u21:getEntity(u42.entityInstance)
        if v43 == nil then
            return nil
        end
        local v44 = u9.Controllers.MatchController:getQueueTypeAsync():expect()
        local u45 = u42.entityInstance
        local v46 = u41.activeVisuals[u45]
        if v46 ~= nil then
            v46:DoCleaning()
        end
        if not u42.isActive then
            return nil
        end
        local v47 = u24.WalkSpeedMultiplier
        local v48 = v44 and v44 == u22.CAPTURE_POINTS and 1.15 or v47
        local v49 = u11.new()
        u41.activeVisuals[u45] = v49
        v49:GiveTask(function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u45
            --]]
            local v50 = u41.activeVisuals[u45] ~= nil
            u41.activeVisuals[u45] = nil
            return v50
        end)
        local v51
        if u1.instanceof(v43, u20) then
            v51 = v43:getPlayer().UserId == u15.LocalPlayer.UserId
        else
            v51 = false
        end
        if v51 then
            v49:GiveTask(u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = v48
            }))
        end
        local u52 = u42.entityInstance:GetDescendants()
        local function u56(p53) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u25
            --]]
            for _, v54 in u52 do
                if (v54:IsA("BasePart") or v54:IsA("Decal")) and (v54.Name ~= "HumanoidRootPart" and not v54:IsA("Texture")) then
                    local v55 = v54:FindFirstAncestorOfClass("Accessory")
                    if not (v55 and u25(string.lower(v55.Name))) then
                        v54.Transparency = p53
                    end
                end
            end
        end
        u56(1)
        v49:GiveTask(function() --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u56
            --]]
            u56(0)
        end)
        local u57 = u42.entityInstance.Humanoid.HipHeight
        u42.entityInstance.Humanoid.HipHeight = 2.3
        v49:GiveTask(function() --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u57
            --]]
            u42.entityInstance.Humanoid.HipHeight = u57
        end)
        local v58 = u12("Folder", {
            ["Name"] = "ExtraCharacterParts",
            ["Parent"] = u42.entityInstance
        })
        v49:GiveTask(v58)
        local v59 = u16.Assets.Effects.BeastActivated:Clone()
        v59:PivotTo(u42.entityInstance:GetPrimaryPartCFrame())
        local v60 = v59:FindFirstChildOfClass("Humanoid")
        if v60 ~= nil then
            v60:Destroy()
        end
        local v61 = v59:FindFirstChild("HumanoidRootPart")
        if v61 ~= nil then
            v61:Destroy()
        end
        local v62 = v59:FindFirstChild("Animate")
        if v62 ~= nil then
            v62:Destroy()
        end
        local v63 = v59:FindFirstAncestorOfClass("BodyColors")
        if v63 ~= nil then
            v63:Destroy()
        end
        for _, v64 in v59:GetDescendants() do
            if v64:IsA("BasePart") then
                v64.Massless = true
                v64.CanCollide = false
                u5:setQueryIgnored(v64, true)
            end
        end
        v59.Parent = v58
        for _, v65 in u42.entityInstance:GetChildren() do
            if v65:IsA("BasePart") and v65.Name ~= "HumanoidRootPart" then
                local v66 = v59:FindFirstChild(v65.Name)
                if v66 and v66:IsA("BasePart") then
                    for _, v67 in v66:GetDescendants() do
                        if v67:IsA("Motor6D") then
                            v67:Destroy()
                        end
                    end
                    v66.Parent = v58
                    u12("Weld", {
                        ["Part0"] = v66,
                        ["Part1"] = v65,
                        ["Parent"] = v66
                    })
                end
            end
        end
        if v51 then
            u6:playSound(u27.BEAST_ROAR)
        else
            u6:playSound(u27.BEAST_ROAR, {
                ["rollOffMaxDistance"] = 100,
                ["position"] = u42.entityInstance:GetPrimaryPartCFrame().Position
            })
        end
        local u68 = {}
        for _, v69 in v58:GetDescendants() do
            if v69:IsA("BasePart") then
                u68[v69] = {
                    ["size"] = v69.Size,
                    ["randomOffset"] = math.random() * 0.1
                }
            end
        end
        task.spawn(function() --[[ Line: 205 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u10
                [3] = u68
            --]]
            u18(0.5, u10, function(p70) --[[ Line: 206 ]]
                --[[
                Upvalues:
                    [1] = u68
                --]]
                for v71, v72 in u68 do
                    local v73 = v72.size
                    local v74 = p70 + v72.randomOffset
                    v71.Size = v73 * math.clamp(v74, 0, 1)
                end
            end, 0.6, 1):Wait()
        end)
    end)
end
function u30.onKitReplicationDeactivated(_) --[[ Line: 216 ]] end
function u30.onInnateAbilityEnabled(p75, p76, _) --[[ Line: 218 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    if p76.abilityId ~= u19.BEAST_FORM then
        return nil
    end
    p75:updateBeastAbilityState()
end
function u30.onAbilityUsed(_, _, _) --[[ Line: 224 ]] end
function u30.unmountBloodlustBar(p77) --[[ Line: 226 ]]
    if p77.bloodlustBarMaid then
        p77.bloodlustBarMaid:Destroy()
        p77.bloodlustBarMaid = nil
    end
end
function u30.updateBeastAbilityState(p78) --[[ Line: 232 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u19
        [3] = u15
        [4] = u24
        [5] = u4
    --]]
    local v79 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u19.BEAST_FORM)
    if v79 then
        local v80 = u15.LocalPlayer:GetAttribute("BeastBloodlust")
        local v81 = u15.LocalPlayer:GetAttribute("BeastIsActive")
        local v82 = type(v80) ~= "number" and 0 or v80
        if type(v81) ~= "boolean" then
            v81 = false
        end
        local v83 = v82 + 0.001 >= u24.BloodlustRequired
        local v84 = p78:canDeactivateBeastNow()
        local v85
        if v81 then
            if v84 then
                v85 = u4.READY
            else
                v85 = u4.ON_COOLDOWN
            end
        elseif v83 then
            v85 = u4.READY
        else
            v85 = u4.DISABLED
        end
        if v85 ~= v79.abilityState then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v79, v85)
        end
        if v81 and not v84 then
            p78:scheduleBeastDeactivateUnlockRefresh()
        else
            p78.scheduledBeastUnlockAt = nil
            p78.beastAbilityUnlockMaid:DoCleaning()
        end
    else
        return nil
    end
end
function u30.canDeactivateBeastNow(_) --[[ Line: 261 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u17
    --]]
    local v86 = u15.LocalPlayer:GetAttribute("BeastCanDeactivateAt")
    return type(v86) ~= "number" and true or v86 <= u17:GetServerTimeNow()
end
function u30.scheduleBeastDeactivateUnlockRefresh(u87) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u17
    --]]
    local v88 = u15.LocalPlayer:GetAttribute("BeastCanDeactivateAt")
    if type(v88) ~= "number" then
        return nil
    end
    local v89 = v88 - u17:GetServerTimeNow()
    if v89 <= 0 then
        return nil
    end
    if u87.scheduledBeastUnlockAt == v88 then
        return nil
    end
    u87.scheduledBeastUnlockAt = v88
    u87.beastAbilityUnlockMaid:DoCleaning()
    u87.beastAbilityUnlockMaid:GiveTask(task.delay(v89, function() --[[ Line: 282 ]]
        --[[
        Upvalues:
            [1] = u87
        --]]
        u87.scheduledBeastUnlockAt = nil
        u87:updateBeastAbilityState()
    end))
end
v8.CreateController(u30.new())
return nil