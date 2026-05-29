local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.WatchCollectionTag
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local v10 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u11 = v10.InteractionCategory
local u12 = v10.InteractionPriority
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "RoyaleBedController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
    --]]
    u9.constructor(p18, { u13.BATTLE_ROYALE })
    p18.Name = "RoyaleBedController"
    p18.bedSet = {}
    p18.ghostTeammate = {}
end
function u15.KnitStart(p19) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p19)
end
function u15.onGameInit(u20) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u5
        [4] = u7
        [5] = u14
    --]]
    u20:initPrompt()
    u4("royale-bed", function(p21) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u8
            [3] = u5
            [4] = u7
        --]]
        u20.bedSet[p21] = true
        local v22 = u8.LocalPlayer.Character
        if v22 ~= nil then
            v22 = v22:GetAttribute("GhostForm")
        end
        if v22 == 0 or (v22 ~= v22 or (v22 == "" or not v22)) then
            local v23 = not u5.Controllers.BattleRotaleGhostController:isLocalGhost()
            if v23 then
                local v24 = 0
                for _ in u20.ghostTeammate do
                    v24 = v24 + 1
                end
                if v24 > 0 then
                    v23 = true
                else
                    v23 = false
                end
            end
            if v23 then
                u7:AddTag(p21, "revive-bed")
            end
        end
    end)
    u4("ghost-player", function(p25) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u20
        --]]
        local v26 = u8:GetPlayerByUserId(p25:GetAttribute("PlayerID"))
        if v26 then
            if v26 == u8.LocalPlayer or v26.Team ~= u8.LocalPlayer.Team then
                return nil
            end
            u20.ghostTeammate[v26] = true
            u20:enableAllPrompts()
        end
    end)
    u14.Client:Get("ReviveEffect"):Connect(function(p27) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if u20.ghostTeammate[p27.player] ~= nil then
            u20.ghostTeammate[p27.player] = nil
            local v28 = 0
            for _ in u20.ghostTeammate do
                v28 = v28 + 1
            end
            if v28 == 0 then
                u20:disableAllPrompts()
            end
        end
    end)
    u14.Client:Get("BeconeGhost"):Connect(function(_) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:disableAllPrompts()
    end)
end
function u15.initPrompt(_) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u12
        [4] = u11
        [5] = u14
    --]]
    u5.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Bed",
        ["interactionObjectText"] = "Revive Your Teammates!",
        ["interactionTag"] = "revive-bed",
        ["maxActivationDistance"] = 20,
        ["removePromptOnInteract"] = false,
        ["holdDuration"] = 8,
        ["clickablePrompt"] = u3.isMobileControls(),
        ["priority"] = u12.OTHER,
        ["category"] = u11.OTHER,
        ["KeyCode"] = Enum.KeyCode.R,
        ["onInteracted"] = function(_, p29, _) --[[ Name: onInteracted, Line 109 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            u14.Client:Get("BedRevive"):SendToServer({
                ["bedPosition"] = p29.Position
            })
        end
    })
end
function u15.enableAllPrompts(p30) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    local v31 = 0
    for _ in p30.ghostTeammate do
        v31 = v31 + 1
    end
    if v31 == 0 then
        return nil
    end
    local v32 = u8.LocalPlayer.Character
    if v32 ~= nil then
        v32 = v32:GetAttribute("GhostForm")
    end
    if v32 ~= 0 and (v32 == v32 and (v32 ~= "" and v32)) then
        return nil
    end
    for v33 in p30.bedSet do
        u7:AddTag(v33, "revive-bed")
        local v34 = v33:WaitForChild("Part", 3)
        if v34 ~= nil then
            v34 = v34:FindFirstChildOfClass("BillboardGui")
        end
        if v34 then
            v34.Enabled = true
        end
    end
end
function u15.disableAllPrompts(p35) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    for v36 in p35.bedSet do
        u7:RemoveTag(v36, "revive-bed")
        local v37 = v36:WaitForChild("Part", 3)
        if v37 ~= nil then
            v37 = v37:FindFirstChildOfClass("BillboardGui")
        end
        if v37 then
            v37.Enabled = false
        end
    end
end
u5.CreateController(u15.new())
return nil