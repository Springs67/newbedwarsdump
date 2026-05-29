local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.Promise
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u19 = v18.InteractionCategory
local u20 = v18.InteractionPriority
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "grim-reaper-balance").GrimReaperBalance
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "GrimReaperController"
    end,
    ["__index"] = u28
})
u29.__index = u29
function u29.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u25
    --]]
    u28.constructor(p32, u25.GRIM_REAPER)
    p32.Name = "GrimReaperController"
    p32.soulsByPosition = {}
end
function u29.onKitLocalActivated(u33, u34) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    u33:registerSoulInteractions()
    u26.Client:OnEvent("SpawnGrimReaperSoul", function(p35) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:spawnSoul(p35.position, p35.secret, p35.soulOfPlayer, p35.soulModel)
    end):andThen(function(p36) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:GiveTask(p36)
    end)
end
function u29.onKitReplicationActivated(u37, u38) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    u26.Client:OnEvent("EntityConsumeGrimReaperSoul", function(p39) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37:startChannel(p39.entity, p39.position)
    end):andThen(function(p40) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:GiveTask(p40)
    end)
end
function u29.onKitLocalDeactivated(_) --[[ Line: 64 ]] end
function u29.onKitReplicationDeactivated(_) --[[ Line: 66 ]] end
function u29.onInnateAbilityEnabled(_, _, _) --[[ Line: 68 ]] end
function u29.onAbilityUsed(_, _, _) --[[ Line: 70 ]] end
function u29.registerSoulInteractions(u41) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u20
        [4] = u19
        [5] = u13
    --]]
    u7.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Player\'s Soul",
        ["interactionObjectText"] = "CONSUME",
        ["interactionTag"] = "GrimSoul",
        ["instantActivation"] = true,
        ["maxActivationDistance"] = 120,
        ["removePromptOnInteract"] = false,
        ["clickablePrompt"] = u4.isMobileControls(),
        ["priority"] = u20.ABILITY,
        ["category"] = u19.ABILITY,
        ["onInteracted"] = function(p42, p43, p44) --[[ Name: onInteracted, Line 83 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u41
            --]]
            if not p43:IsA("Model") then
                return nil
            end
            if p42 == u13.LocalPlayer then
                local v45 = p42.Character
                if v45 ~= nil then
                    v45 = v45:GetAttribute("GrimReaperChannel")
                end
                if v45 ~= true then
                    u41:consumeSoul(p43)
                    p44:Destroy()
                end
            end
        end
    })
end
function u29.spawnSoul(p46, p47, p48, _, u49) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
        [3] = u16
        [4] = u8
        [5] = u23
    --]]
    if u49 ~= nil then
        u49 = u49:Clone()
    end
    if u49 == nil then
        u49 = u14:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone()
    end
    u12:AddTag(u49, "GrimSoul")
    u49:SetAttribute("GrimReaperSoulSecret", p48)
    u49:PivotTo(CFrame.new(p47))
    p46.soulsByPosition[tostring(p47)] = u49
    for v50, v51 in u49:GetDescendants() do
        local _ = v50 - 1
        if v51:IsA("BasePart") then
            v51.CanCollide = false
            v51.CanQuery = false
            v51.CanTouch = false
        end
    end
    u49.Parent = u16
    u8.delay(u23.SOUL_ORB_EXPIRE_TIME):andThen(function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        if u49.Parent then
            u49:Destroy()
        end
    end)
end
function u29.consumeSoul(_, p52) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u13
        [3] = u21
        [4] = u26
    --]]
    local v53 = p52:GetAttribute("GrimReaperSoulSecret")
    u22:playAnimation(u13.LocalPlayer, u21.GRIM_REAPER_CONSUME)
    u26.Client:Get("ConsumeGrimReaperSoul"):CallServer({
        ["secret"] = v53
    })
end
function u29.startChannel(p54, p55, p56) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u3
        [3] = u9
        [4] = u13
        [5] = u7
        [6] = u24
        [7] = u5
        [8] = u14
        [9] = u16
        [10] = u10
        [11] = u8
        [12] = u15
        [13] = u23
        [14] = u17
    --]]
    local v57 = {
        ["consume"] = u27.GRIM_REAPER_CONSUME,
        ["channel"] = u27.GRIM_REAPER_CHANNEL
    }
    local v58 = ColorSequence.new(u3.WHITE)
    local v59 = p55:FindFirstChild("3DClothing")
    if v59 ~= nil then
        v59 = nil
        for v60, v61 in v59:GetDescendants() do
            local _ = v60 - 1
            if v61.Name == "GrimReaperChannelAttachment" == true then
                v59 = v61
                break
            end
        end
    end
    if v59 == nil then
        v59 = p55:FindFirstChild("UpperTorso")
        if v59 ~= nil then
            v59 = v59:FindFirstChild("BodyFrontAttachment")
        end
    end
    if v59 then
        local u62 = u9.new()
        local v63 = p55 == u13.LocalPlayer.Character
        local v64 = u24[u7.Controllers.KitSkinController:getKitSkin(p55)]
        if v64.grimReaper then
            v57.consume = v64.grimReaper.consumeSound
            v57.channel = v64.grimReaper.channelSound
            v58 = v64.grimReaper.beamColor
        end
        local v65 = u5
        local v66 = v57.consume
        local v67 = {}
        local v68
        if v63 then
            v68 = nil
        else
            v68 = p55:GetPrimaryPartCFrame().Position
        end
        v67.position = v68
        v65:playSound(v66, v67)
        local v69 = u5
        local v70 = v57.channel
        local v71 = {
            ["looped"] = true
        }
        local v72
        if v63 then
            v72 = nil
        else
            v72 = p55:GetPrimaryPartCFrame().Position
        end
        v71.position = v72
        local v73
        if v63 then
            v73 = nil
        else
            v73 = p55.PrimaryPart
        end
        v71.parent = v73
        local u74 = v69:playSound(v70, v71)
        if u74 then
            u62:GiveTask(function() --[[ Line: 194 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u74
                --]]
                u5:tweenSoundVolume(u74, 0, 0.1).Completed:Wait()
                local v75 = u74
                if v75 ~= nil then
                    v75:Stop()
                end
                local v76 = u74
                if v76 ~= nil then
                    v76:Destroy()
                end
            end)
        end
        local u77 = p54.soulsByPosition[tostring(p56)]
        if u77 == nil then
            u77 = u14:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("GrimReaperSoul"):Clone()
            u77:PivotTo(CFrame.new(p56))
            u77.Parent = u16
        end
        u62:GiveTask(function() --[[ Line: 216 ]]
            --[[
            Upvalues:
                [1] = u77
            --]]
            local v78 = u77
            if v78 ~= nil then
                v78:Destroy()
            end
        end)
        local u79 = u10("Beam", {
            ["LightEmission"] = 0.6,
            ["LightInfluence"] = 1,
            ["Width0"] = 0.4,
            ["Width1"] = 0.2,
            ["CurveSize0"] = 3,
            ["CurveSize1"] = -3,
            ["FaceCamera"] = true,
            ["Attachment0"] = u77:FindFirstChild("Spirit"):FindFirstChild("Attachment"),
            ["Attachment1"] = v59,
            ["Transparency"] = NumberSequence.new(0),
            ["Color"] = v58,
            ["Parent"] = u77
        })
        local u80 = u79:Clone()
        u80.FaceCamera = false
        u80.Parent = u77
        u8.defer(function() --[[ Line: 241 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u15
                [3] = u80
            --]]
            local v81 = 1
            while u79.Parent do
                local v82 = 0.4 + 0.2 * math.random()
                local v83 = u15:Create(u79, TweenInfo.new(v82), {
                    ["CurveSize0"] = v81 * -3,
                    ["CurveSize1"] = v81 * 3
                })
                u15:Create(u80, TweenInfo.new(v82), {
                    ["CurveSize0"] = v81 * -3,
                    ["CurveSize1"] = v81 * 3
                }):Play()
                v83:Play()
                v83.Completed:Wait()
                v81 = v81 * -1
            end
        end)
        for _, u84 in p55:GetDescendants() do
            if u84:IsA("BasePart") then
                if u84.Transparency < 0.5 then
                    local u85 = u84.Transparency
                    local u86 = u84.Material
                    u15:Create(u84, TweenInfo.new(0.1), {
                        ["Transparency"] = 0.369
                    }):Play()
                    u84.Material = Enum.Material.ForceField
                    u62:GiveTask(function() --[[ Line: 270 ]]
                        --[[
                        Upvalues:
                            [1] = u84
                            [2] = u15
                            [3] = u85
                            [4] = u86
                        --]]
                        if u84.Parent then
                            local v87 = {
                                ["Transparency"] = u85
                            }
                            u15:Create(u84, TweenInfo.new(0.1), v87):Play()
                            u84.Material = u86
                        end
                    end)
                end
            elseif u84:IsA("ParticleEmitter") then
                local _ = u84.Transparency
            end
        end
        if v63 then
            u62:GiveTask(u7.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = u23.CONSUME_SPEED_MULTIPLIER
            }))
        end
        if v63 then
            local u89 = u17.PerformCombat:connect(function(p88) --[[ Line: 298 ]]
                p88:setCancelled(true)
            end)
            task.delay(u23.INVISIBILITY_ABILITY_DURATION, function() --[[ Line: 301 ]]
                --[[
                Upvalues:
                    [1] = u89
                --]]
                u89:Destroy()
            end)
        end
        u8.delay(u23.INVISIBILITY_ABILITY_DURATION):andThen(function() --[[ Line: 307 ]]
            --[[
            Upvalues:
                [1] = u62
            --]]
            u62:DoCleaning()
        end)
    end
end
u7.CreateController(u29.new())
return nil