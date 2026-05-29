local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutElastic
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-emote-definitions").KitContractEmoteDefinitions
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPrimaryActiveKit
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u18 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "KitMasteryEmoteController"
    end,
    ["__index"] = u10
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p22)
    p22.Name = "KitMasteryEmoteController"
end
function u19.KnitStart(p23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u13
        [4] = u18
        [5] = u7
        [6] = u16
        [7] = u12
        [8] = u8
        [9] = u15
        [10] = u14
        [11] = u4
        [12] = u11
        [13] = u9
        [14] = u17
        [15] = u5
    --]]
    u10.KnitStart(p23)
    local v24 = u3.Controllers.EmoteHandlerController
    local v25 = u13.KIT_MASTERY_EMOTE
    local u26 = u18
    local u27 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
            return "Anonymous"
        end,
        ["__index"] = u26
    })
    u27.__index = u27
    function u27.new(...) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        local v28 = u27
        local v29 = setmetatable({}, v28)
        return v29:constructor(...) or v29
    end
    function u27.constructor(p30, ...) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26.constructor(p30, ...)
    end
    function u27.onEnable(u31, u32, u33, u34, u35) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u16
            [3] = u12
            [4] = u8
            [5] = u15
            [6] = u14
            [7] = u4
            [8] = u11
            [9] = u9
            [10] = u17
            [11] = u5
        --]]
        local u36 = u7:GetPlayerByUserId(u32)
        if not u36 then
            return nil
        end
        local u37 = u16(u36)
        if not (u12.isKitContractAvailable(u37) and u12.isKitContractEmoteAvailable(u37)) then
            return nil
        end
        local u38 = {
            u8.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteBronze,
            u8.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteSilver,
            u8.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteGold,
            u8.Assets.Effects.KitMasteryEmotes.KitMasteryEmotePlatinum,
            u8.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteDiamond,
            u8.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteEmerald,
            u8.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteNightmare
        }
        local u39 = {
            u15.KIT_MASTERY_EMOTE_BRONZE,
            u15.KIT_MASTERY_EMOTE_SILVER,
            u15.KIT_MASTERY_EMOTE_GOLD,
            u15.KIT_MASTERY_EMOTE_PLATINUM,
            u15.KIT_MASTERY_EMOTE_DIAMOND,
            u15.KIT_MASTERY_EMOTE_EMERALD,
            u15.KIT_MASTERY_EMOTE_NIGHTMARE
        }
        u14.Client:GetNamespace("KitStat"):Get("GetActiveKitStats"):CallServerAsync(u36):andThen(function(p40) --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u36
                [3] = u34
                [4] = u12
                [5] = u37
                [6] = u38
                [7] = u35
                [8] = u11
                [9] = u33
                [10] = u39
                [11] = u31
                [12] = u32
                [13] = u9
                [14] = u17
                [15] = u5
            --]]
            if u4.Controllers.EmoteController:getPlayingEmote(u36) ~= u34 then
                return nil
            end
            if p40 == nil then
                return nil
            end
            local v41 = u12.getKitMasteryTierData(u37, p40)
            local v42
            if v41 == nil then
                v42 = v41
            else
                v42 = v41.selectedKitMasteryTier
            end
            if v42 == nil then
                return nil
            end
            if v41 ~= nil then
                v41 = v41.selectedKitMasteryTier
            end
            local v43 = v41 - 1
            local u44 = u38[v43 + 1]:Clone()
            u35:GiveTask(function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                local v45 = u44
                if v45 ~= nil then
                    v45:Destroy()
                end
            end)
            local v46 = u44:GetDescendants()
            local function v49(p47) --[[ Line: 100 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u37
                --]]
                if p47:IsA("BasePart") then
                    p47.CanCollide = false
                    p47.CanQuery = false
                    p47.CanTouch = false
                end
                if p47:IsA("ParticleEmitter") then
                    p47.Enabled = true
                end
                if p47:IsA("ImageLabel") then
                    local v48 = u11[u37]
                    if v48 ~= nil then
                        p47.Position = p47.Position + v48.imageLabelOffset
                        p47.Image = v48.imageId
                    end
                end
            end
            for v50, v51 in v46 do
                v49(v51, v50 - 1, v46)
            end
            local v52 = u44.PrimaryPart
            local v53 = u33.PrimaryPart
            if v52 == nil or v53 == nil then
                return nil
            end
            local u54 = u31:playSound(u39[v43 + 1], u32, {
                ["rollOffMaxDistance"] = 180,
                ["looped"] = false,
                ["volumeMultiplier"] = 0.8,
                ["position"] = v53.Position
            })
            u35:GiveTask(function() --[[ Line: 134 ]]
                --[[
                Upvalues:
                    [1] = u54
                --]]
                local v55 = u54
                if v55 ~= nil then
                    v55:Destroy()
                end
            end)
            u44.Parent = u9
            v52.Anchored = true
            local v56 = v53.Position + Vector3.new(0, 5, 0)
            local v57 = v53:GetPivot().LookVector * 5
            v52:PivotTo(CFrame.new(v56, v56 + v57))
            u17.tweenModelSize(u44, 1.2, u5, 2)
            task.delay(5, function() --[[ Line: 151 ]]
                --[[
                Upvalues:
                    [1] = u35
                --]]
                u35:DoCleaning()
            end)
        end)
    end
    function u27.onDisable(_, _, _, _) --[[ Line: 156 ]] end
    v24:registerHandler(v25, u27)
end
u3.CreateController(u19.new())
return nil