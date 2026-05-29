local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v12.TweenService
local u16 = v12.Workspace
local v17 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u18 = v17.InteractionCategory
local u19 = v17.InteractionPriority
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u27 = v1.import(script, script.Parent.Parent.Parent, "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u28 = v1.import(script, script.Parent, "ui", "drill-billboard").DrillBillboard
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "DrillItemController"
    end,
    ["__index"] = u20
})
u29.__index = u29
function u29.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.constructor(p32)
    p32.Name = "DrillItemController"
    p32.genPrompts = {}
    p32.drillAnimationMap = {}
end
function u29.isRelevantItem(_, p33) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return p33.itemType == u23.DRILL
end
function u29.onEnable(p34, _, _) --[[ Line: 54 ]]
    p34:enableAllPrompts()
end
function u29.onDisable(p35) --[[ Line: 57 ]]
    p35:disableAllPrompts()
end
function u29.KnitStart(u36) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u8
        [3] = u23
        [4] = u21
        [5] = u25
        [6] = u24
        [7] = u9
        [8] = u6
        [9] = u10
        [10] = u14
        [11] = u26
        [12] = u13
        [13] = u2
        [14] = u4
        [15] = u22
        [16] = u15
    --]]
    u20.KnitStart(u36)
    u8.Controllers.PreloadController:preloadForItemType(u23.DRILL, {
        ["animations"] = { u21.SAW_ATTACK },
        ["sounds"] = { u25.DRILL_ATTACK_1, u25.DRILL_DEPLOY, u25.DRILL_LOOP }
    })
    u24.Client:Get("SpawnDrillPrompt"):Connect(function(p37) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        for _, v38 in p37.positions do
            local v39 = u36:createInvisiblePart(v38)
            u36.genPrompts[v38] = v39
        end
        u36:initPrompt()
    end)
    u24.Client:Get("DrillPlaced"):Connect(function(p40) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u9
            [3] = u6
            [4] = u25
            [5] = u10
            [6] = u14
            [7] = u26
        --]]
        local v41 = u36.genPrompts[p40.position]
        if v41 then
            u9.Controllers.InteractionRegistryController:removePrompt(v41, "Drill_Prompt")
            v41:SetAttribute("Occupied", true)
            u6:playSound(u25.DRILL_DEPLOY, {
                ["rollOffMaxDistance"] = 220,
                ["position"] = p40.position
            })
            local u42 = u10("Sound", {
                ["RollOffMinDistance"] = 20,
                ["RollOffMaxDistance"] = 40,
                ["Volume"] = 0.15,
                ["Playing"] = false,
                ["Looped"] = true,
                ["SoundId"] = u25.DRILL_LOOP,
                ["Parent"] = p40.drill.PrimaryPart
            })
            task.delay(2.5, function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42:Play()
            end)
        end
        local v43 = p40.drill:GetAttribute("PlacedByUserId")
        if v43 == 0 or (v43 ~= v43 or not v43) then
            return nil
        end
        local v44 = u14:GetPlayerByUserId(v43)
        if not v44 then
            return nil
        end
        local v45 = u26.mcGreen
        if u14.LocalPlayer.Team ~= v44.Team then
            v45 = u26.mcRed
        end
        u36:createEntityHealthbar(p40.drill, v45)
    end)
    u24.Client:Get("DrillDestroyed"):Connect(function(p46) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u13
            [3] = u2
        --]]
        local v47 = u36.genPrompts[p46.position]
        if v47 then
            if u36:isEnabled() then
                u13:AddTag(v47, "Drill_Prompt")
                local v48 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v49 = p46.position
                v48:closeApp("StatefulEntityHpBarBillboard_" .. tostring(v49))
            end
            v47:SetAttribute("Occupied", false)
        end
    end)
    u24.Client:Get("DrillSpin"):Connect(function(p50) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u22
            [3] = u21
            [4] = u36
        --]]
        if p50.active then
            local v51 = u4:playAnimation(p50.drill, u22:getAssetId(u21.DRILL_SPIN_LOOP), {
                ["looped"] = true
            })
            if not v51 then
                return nil
            end
            u36.drillAnimationMap[p50.drill] = v51
        else
            local v52 = u36.drillAnimationMap[p50.drill]
            if v52 ~= nil then
                v52:Stop()
            end
            if v52 ~= nil then
                v52:Destroy()
            end
        end
    end)
    u24.Client:Get("DrillAttackAnimation"):Connect(function(p53) --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u6
            [3] = u25
            [4] = u22
            [5] = u21
        --]]
        local v54 = TweenInfo.new(0.5)
        u15:Create(p53.drill.PrimaryPart, v54, {
            ["CFrame"] = p53.cFrame
        }):Play()
        u6:playSound(u25.DRILL_ATTACK_1, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = p53.cFrame.Position
        })
        u6:playSound(u25.JUGGERNAUT_ATTACK_IMPACT_1, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = p53.cFrame.Position
        })
        local v55 = p53.drill:WaitForChild("Humanoid", 3)
        if v55 ~= nil then
            v55 = v55:WaitForChild("Animator", 3)
        end
        u22:playAnimation(v55, u21.SAW_ATTACK)
    end)
end
function u29.initPrompt(_) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u19
        [4] = u18
        [5] = u24
    --]]
    u8.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Deploy",
        ["interactionObjectText"] = "Extract ore",
        ["interactionTag"] = "Drill_Prompt",
        ["instantActivation"] = true,
        ["maxActivationDistance"] = 20,
        ["removePromptOnInteract"] = true,
        ["clickablePrompt"] = u5.isMobileControls(),
        ["priority"] = u19.ABILITY,
        ["category"] = u18.ABILITY,
        ["KeyCode"] = Enum.KeyCode.R,
        ["onInteracted"] = function(_, p56, _) --[[ Name: onInteracted, Line 182 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24.Client:Get("PlaceDrill"):SendToServer({
                ["position"] = p56.Position
            })
        end
    })
end
function u29.enableAllPrompts(p57) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    for v58, v59 in p57.genPrompts do
        local v60 = { v58, v59 }
        local v61 = v60[2]:GetAttribute("Occupied")
        if v61 == 0 or (v61 ~= v61 or (v61 == "" or not v61)) then
            u13:AddTag(v60[2], "Drill_Prompt")
        end
    end
end
function u29.disableAllPrompts(p62) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    for v63, v64 in p62.genPrompts do
        u9.Controllers.InteractionRegistryController:removePrompt(({ v63, v64 })[2], "Drill_Prompt")
    end
end
function u29.createInvisiblePart(_, p65) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u16
    --]]
    return u10("Part", {
        ["Name"] = "DrillPromptPart",
        ["Size"] = Vector3.new(1, 1, 1),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CFrame"] = CFrame.new(p65),
        ["Parent"] = u16
    })
end
function u29.createEntityHealthbar(_, p66, p67) --[[ Line: 219 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u27
        [3] = u11
        [4] = u28
    --]]
    local v68 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v69 = {
        ["app"] = u27
    }
    local v70 = p66:GetPivot().Position
    v69.appId = "StatefulEntityHpBarBillboard_" .. tostring(v70)
    v68:openApp(v69, {
        ["hpBarOffset"] = Vector3.new(0, 3.5, 0),
        ["gameEntity"] = p66,
        ["serverInstance"] = p66,
        ["barColor"] = p67
    }, nil, p66)
    local v71 = p66:GetAttribute("ItemType")
    if not v71 then
        return nil
    end
    u11.mount(u11.createElement(u28, {
        ["drill"] = p66,
        ["itemtype"] = v71
    }), p66)
end
u8.CreateController(u29.new())
return nil