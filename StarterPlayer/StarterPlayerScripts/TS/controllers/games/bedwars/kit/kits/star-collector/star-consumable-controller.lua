local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "util", "common-effects-util").CommonEffectsUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = v1.import(script, script.Parent, "ui", "star-collector-display").StarCollectorDisplay
local u19 = v1.import(script, script.Parent, "ui", "star-collector-notification").StarCollectorNotification
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "StarConsumableController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p23)
    p23.Name = "StarConsumableController"
end
function u20.KnitStart(u24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u14
        [4] = u3
        [5] = u16
        [6] = u8
        [7] = u17
        [8] = u15
        [9] = u13
        [10] = u2
        [11] = u5
        [12] = u19
        [13] = u4
        [14] = u18
    --]]
    u10.KnitStart(u24)
    u9.ItemConsumed:connect(function(p25) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u3
            [3] = u16
            [4] = u8
            [5] = u17
        --]]
        if p25.itemType == u14.VITALITY_STAR or p25.itemType == u14.CRIT_STAR then
            local v26 = p25.entity:getInstance()
            local v27 = {}
            if v26 then
                u3:playSound(u16.STAR_CRUSH, {
                    ["position"] = v26.HumanoidRootPart.Position
                })
                for _, v28 in u8.Assets.Effects.ConsumeStarEffect:Clone():GetChildren() do
                    v28.Parent = v26.HumanoidRootPart
                    table.insert(v27, v28)
                end
            end
            if p25.itemType == u14.VITALITY_STAR then
                for _, v29 in v27 do
                    for _, v30 in v29:GetChildren() do
                        if v30:IsA("ParticleEmitter") then
                            v30.Color = ColorSequence.new(Color3.fromRGB(85, 255, 127))
                        end
                    end
                end
            elseif p25.itemType == u14.CRIT_STAR then
                for _, v31 in v27 do
                    for _, v32 in v31:GetChildren() do
                        if v32:IsA("ParticleEmitter") then
                            v32.Color = ColorSequence.new(Color3.fromRGB(253, 166, 91))
                        end
                    end
                end
            end
            u17:playEffects(v27, v26, {
                ["destroyAfterSec"] = 2
            })
        end
    end)
    u15.Client:OnEvent("StarBuff", function(p33) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u14
            [3] = u2
            [4] = u5
            [5] = u19
            [6] = u24
            [7] = u4
            [8] = u18
        --]]
        if u13:getEntity(p33.player) == nil then
            return nil
        else
            if p33.starType == u14.VITALITY_STAR then
                local v34 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController")
                local v35 = u5.createElement
                local v36 = u19
                local v37 = {}
                local v38 = p33.buff
                v37.text = "Max Health +" .. tostring(v38) .. "!"
                v37.textColor3 = Color3.fromRGB(85, 255, 127)
                local u39 = v34:addComponent(v35(v36, v37))
                task.delay(3, function() --[[ Line: 90 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                    --]]
                    u39:DoCleaning()
                end)
            elseif p33.starType == u14.CRIT_STAR then
                local v40 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController")
                local v41 = u5.createElement
                local v42 = u19
                local v43 = {}
                local v44 = p33.buff * 100
                local v45 = math.round(v44)
                v43.text = "Crit Rate +" .. tostring(v45) .. "%!"
                v43.textColor3 = Color3.fromRGB(252, 201, 92)
                local u46 = v40:addComponent(v41(v42, v43))
                task.delay(3, function() --[[ Line: 99 ]]
                    --[[
                    Upvalues:
                        [1] = u46
                    --]]
                    u46:DoCleaning()
                end)
            end
            if u24.starCollectorTree then
                u5.update(u24.starCollectorTree, u5.createElement(u18, {
                    ["greenStars"] = p33.stats.greenStars,
                    ["yellowStars"] = p33.stats.yellowStars
                }))
            else
                u24.starCollectorTree = u4.Controllers.StatusInfoListController:waitForSetupAddElement(u5.createElement(u18, {
                    ["greenStars"] = p33.stats.greenStars,
                    ["yellowStars"] = p33.stats.yellowStars
                }))
            end
        end
    end)
end
function u20.isRelevantItem(_, p47) --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p47.itemType == u14.CRIT_STAR and true or p47.itemType == u14.VITALITY_STAR
end
function u20.onEnable(p48) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u12
    --]]
    local v49 = u7.LocalPlayer.Character
    local v50
    if v49 == nil then
        v50 = v49
    else
        v50 = v49.PrimaryPart
    end
    if v50 then
        local v51 = v49:FindFirstChildOfClass("Humanoid")
        if v51 ~= nil then
            v51 = v51.HipHeight
        end
        local v52 = v51 == nil and 0 or v51
        local v53 = u11
        local v54 = {
            ["positionOverride"] = (v50:GetPivot() - Vector3.new(0, v52, 0)).Position,
            ["size"] = u12.StarCollectorStella.TEAM_BUFF_RANGE * 2
        }
        p48.ringAuraEffect = v53.attachRingAura(v50, v54)
    end
end
function u20.onDisable(p55) --[[ Line: 146 ]]
    local v56 = p55.ringAuraEffect
    if v56 ~= nil then
        v56:Destroy()
    end
end
u4.CreateController(u20.new())
return nil