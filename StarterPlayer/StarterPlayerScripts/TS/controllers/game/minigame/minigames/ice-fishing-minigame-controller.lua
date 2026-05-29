local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.UIUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.TweenService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "winter-event", "ice-fishing-fish").IceFishingUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta").MinigameType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "IceFishingMinigameController"
    end,
    ["__index"] = u13
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
        [1] = u13
    --]]
    u13.constructor(p23)
    p23.Name = "IceFishingMinigameController"
end
function u20.KnitStart(u24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u18
        [3] = u17
        [4] = u12
        [5] = u10
        [6] = u7
        [7] = u16
        [8] = u6
        [9] = u3
        [10] = u19
        [11] = u11
        [12] = u4
        [13] = u8
        [14] = u15
        [15] = u14
    --]]
    u13.KnitStart(u24)
    u18.Client:WaitFor("MinigameStarted"):expect():Connect(function(p25) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u24
        --]]
        if p25.minigame.type == u17.ICE_FISHING then
            u24:onMinigameStart()
        end
    end)
    u18.Client:WaitFor("MinigameEnded"):expect():Connect(function(p26) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u24
        --]]
        if p26.minigame.type == u17.ICE_FISHING then
            u24:onMinigameEnded()
        end
    end)
    u18.Client:OnEvent("IceFishingFishSpotUpdate", function(u27) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v28 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
        if u27.open then
            u27.spot.Transparency = 0
            u27.spot.Color = u27.effectColor
            u12:Create(u27.spot, v28, {
                ["Size"] = Vector3.new(2.863, 11.65, 11.65)
            }):Play()
            if u27.showEffect then
                local v29 = u27.spot:GetDescendants()
                local function v31(p30) --[[ Line: 66 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    if p30:IsA("ParticleEmitter") then
                        p30.Enabled = true
                        p30.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, u27.effectColor), ColorSequenceKeypoint.new(1, u27.effectColor) })
                    end
                end
                for v32, v33 in v29 do
                    v31(v33, v32 - 1, v29)
                end
                return
            end
        else
            u12:Create(u27.spot, v28, {
                ["Size"] = Vector3.new(2.863, 0, 0)
            }):Play()
            for v34, v35 in u27.spot:GetDescendants() do
                local _ = v34 - 1
                if v35:IsA("ParticleEmitter") then
                    v35.Enabled = false
                end
            end
            task.delay(0.5, function() --[[ Line: 89 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27.spot.Transparency = 1
            end)
        end
    end)
    u10:GetInstanceAddedSignal("ice-fishing-spot"):Connect(function(u36) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u24
            [3] = u16
            [4] = u6
            [5] = u3
            [6] = u19
            [7] = u11
            [8] = u18
            [9] = u4
            [10] = u8
            [11] = u15
            [12] = u14
        --]]
        local u37 = u7.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "IceFishingPrompt",
            ["HoldDuration"] = 0.01,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["ActionText"] = "Catch Fish",
            ["ClickablePrompt"] = false,
            ["Enabled"] = true,
            ["Parent"] = u36
        })
        u37:AddTag("FishingPrompt")
        u37.Triggered:Connect(function(u38) --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u36
                [3] = u16
                [4] = u6
                [5] = u3
                [6] = u19
                [7] = u11
                [8] = u18
                [9] = u4
            --]]
            u24:disableFishingPrompts()
            local v39 = u36:GetAttribute("FishType")
            local v40
            if v39 then
                v40 = u16.getFishMetadata(v39)
            else
                v40 = nil
            end
            local v41 = u6.Controllers.FishingMinigameController
            local v42 = {
                ["id"] = "ice_fishing_fish",
                ["drops"] = {}
            }
            local v43
            if v40 == nil then
                v43 = v40
            else
                v43 = v40.rarity
            end
            v42.weight = (v43 == 0 or (v43 ~= v43 or not v43)) and 1 or v40.rarity / 100
            if v40 ~= nil then
                v40 = v40.fishModel
            end
            v42.fishModel = v40 == nil and "fish_iron" or v40
            v41:startMinigame(v42, function(p44) --[[ Line: 136 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u19
                    [3] = u11
                    [4] = u38
                    [5] = u18
                    [6] = u36
                    [7] = u24
                --]]
                if p44.win then
                    local v45 = u3
                    local v46 = u19.FISHERMAN_GAME_FISH_MOVE
                    local v47 = {}
                    local v48
                    if u11.LocalPlayer.Character == u38.Character then
                        v48 = nil
                    else
                        v48 = u38.Character
                        if v48 ~= nil then
                            v48 = v48:GetPivot().Position
                        end
                    end
                    v47.position = v48
                    v47.volumeMultiplier = 5
                    v45:playSound(v46, v47)
                    local v49 = {
                        ["player"] = u38,
                        ["spot"] = u36
                    }
                    u18.Client:Get("IceFishingFishCaught"):SendToServer(v49)
                end
                u24:enableFishingPrompts()
            end, {
                ["interactionRangeLimit"] = 15,
                ["customUI"] = {
                    ["size"] = UDim2.fromScale(0.3, 0.3),
                    ["position"] = u4:getActionBarPosition(),
                    ["anchorPoint"] = Vector2.new(0.5, 1)
                }
            })
        end)
        u37.PromptButtonHoldBegan:Connect(function(u50) --[[ Line: 171 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u3
                [3] = u19
                [4] = u11
                [5] = u15
                [6] = u14
                [7] = u6
                [8] = u37
            --]]
            local u51 = u8.new()
            local v52 = u3
            local v53 = u19.FISHING_ROD_CAST
            local v54 = {}
            local v55
            if u11.LocalPlayer.Character == u50.Character then
                v55 = nil
            else
                v55 = u50.Character
                if v55 ~= nil then
                    v55 = v55:GetPivot().Position
                end
            end
            v54.position = v55
            v54.volumeMultiplier = 1.75
            local v56 = v52:playSound(v53, v54):getInstance()
            if v56 ~= nil then
                v56.Ended:Once(function() --[[ Line: 192 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u19
                        [3] = u11
                        [4] = u50
                    --]]
                    local v57 = u3
                    local v58 = u19.FISHING_ROD_SPLASH
                    local v59 = {}
                    local v60
                    if u11.LocalPlayer.Character == u50.Character then
                        v60 = nil
                    else
                        v60 = u50.Character
                        if v60 ~= nil then
                            v60 = v60:GetPivot().Position
                        end
                    end
                    v59.position = v60
                    v59.volumeMultiplier = 2
                    v57:playSound(v58, v59)
                end)
            end
            local u61 = u15:playAnimation(u11.LocalPlayer, u14.FISHING_ROD_CAST, {
                ["fadeInTime"] = 0
            })
            local u62 = u6.Controllers.ViewmodelController:playAnimation(u14.FP_SWING_SWORD, {
                ["fadeTime"] = 0
            })
            task.delay(0.0005, function() --[[ Line: 218 ]]
                --[[
                Upvalues:
                    [1] = u62
                --]]
                local v63 = u62
                if v63 ~= nil then
                    v63:AdjustSpeed(0)
                end
            end)
            if u61 ~= nil then
                u61.Stopped:Connect(function() --[[ Line: 226 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u11
                        [3] = u14
                        [4] = u51
                    --]]
                    local u64 = u15:playAnimation(u11.LocalPlayer, u14.FISHING_ROD_CATCH_SUCCESS, {
                        ["fadeInTime"] = 0
                    })
                    u51:GiveTask(function() --[[ Line: 230 ]]
                        --[[
                        Upvalues:
                            [1] = u64
                        --]]
                        local v65 = u64
                        if v65 ~= nil then
                            v65:Stop()
                        end
                        local v66 = u64
                        if v66 ~= nil then
                            v66:Destroy()
                        end
                    end)
                end)
            end
            u51:GiveTask(function() --[[ Line: 242 ]]
                --[[
                Upvalues:
                    [1] = u62
                    [2] = u61
                --]]
                local v67 = u62
                if v67 ~= nil then
                    v67:Stop()
                end
                local v68 = u62
                if v68 ~= nil then
                    v68:Destroy()
                end
                local v69 = u61
                if v69 ~= nil then
                    v69:Stop()
                end
                local v70 = u61
                if v70 ~= nil then
                    v70:Destroy()
                end
            end)
            u37.PromptButtonHoldEnded:Connect(function() --[[ Line: 260 ]]
                --[[
                Upvalues:
                    [1] = u51
                --]]
                u51:DoCleaning()
            end)
        end)
    end)
    u10:GetInstanceRemovedSignal("ice-fishing-spot"):Connect(function(p71) --[[ Line: 266 ]]
        for v72, v73 in p71:GetDescendants() do
            local _ = v72 - 1
            if v73:IsA("ProximityPrompt") then
                v73:Destroy()
            end
        end
    end)
end
function u20.disableFishingPrompts(_) --[[ Line: 278 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    for v74, v75 in u10:GetTagged("FishingPrompt") do
        local _ = v74 - 1
        if v75:IsA("ProximityPrompt") then
            v75.Enabled = false
        end
    end
end
function u20.enableFishingPrompts(_) --[[ Line: 289 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    for v76, v77 in u10:GetTagged("FishingPrompt") do
        local _ = v76 - 1
        if v77:IsA("ProximityPrompt") then
            v77.Enabled = true
        end
    end
end
function u20.onMinigameStart(_) --[[ Line: 300 ]] end
function u20.onMinigameEnded(_) --[[ Line: 302 ]] end
u6.CreateController(u20.new())
return nil