local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = u1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = u1.import(script, script.Parent, "ui", "hud", "skull-drop-hud").SkullDropHud
local u22 = u1.import(script, script.Parent, "ui", "skull-count-ui").SkullBillBoard
local u23 = {
    u20.SKULL_LOOP_1,
    u20.SKULL_LOOP_2,
    u20.SKULL_LOOP_3,
    u20.SKULL_LOOP_4
}
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "HunterGameController"
    end,
    ["__index"] = u10
})
u24.__index = u24
function u24.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
    --]]
    u10.constructor(p27, { u14.SKULL_DROP })
    p27.Name = "HunterGameController"
    p27.uiMaidMap = {}
end
function u24.KnitStart(p28) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.KnitStart(p28)
end
function u24.onGameInit(u29) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u20
        [3] = u19
        [4] = u11
        [5] = u18
        [6] = u15
        [7] = u8
        [8] = u2
        [9] = u21
        [10] = u13
        [11] = u1
        [12] = u12
        [13] = u9
        [14] = u17
        [15] = u3
    --]]
    u4.Controllers.PreloadController:runPreload({
        ["sounds"] = { u20.SKULL_DROP_ITEM_MERGE, u20.SKULL_DROP_ITEM_PICKUP, u20.SKULL_DROP_SKULL_PICKUP }
    })
    u19.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p30, _, _) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u18
            [3] = u15
            [4] = u8
            [5] = u29
            [6] = u2
            [7] = u21
        --]]
        local v31 = u11:getState().Game.queueType
        if p30 == u18.RUNNING and v31 == u15.SKULL_DROP then
            for _, v32 in u8:GetPlayers() do
                u29:setupPlayerBillboard(v32)
            end
            local v33 = {
                ["appId"] = "SkullDropHud",
                ["app"] = u21
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v33, {})
        end
    end)
    u19.Client:Get("EntityDeathEvent"):Connect(function(p34) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u1
            [3] = u12
            [4] = u29
        --]]
        local v35 = u13:getEntity(p34.entityInstance)
        if not u1.instanceof(v35, u12) then
            return nil
        end
        u29:cleanPlayerBillBoard(v35:getPlayer())
    end)
    u19.Client:Get("SkullUpdateEvent"):Connect(function(p36) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:updatePlayerBillboard(p36.player)
        u29:updateHighlight(p36.player)
        u29:updateLoopingSound(p36.player)
    end)
    local u37 = os.clock()
    local u38 = 0
    u9.ItemAdded:connect(function(p39) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u3
            [3] = u20
            [4] = u37
            [5] = u38
        --]]
        if p39.item.Name == u17.HEADHUNT_SKULL then
            if os.clock() - u37 < 2 then
                u38 = u38 + 1
            else
                u38 = 0
            end
            local v40 = u3
            local v41 = u20.SKULL_DROP_SKULL_PICKUP
            local v42 = {}
            local v43 = u38 / 10
            v42.playbackSpeedMultiplier = math.clamp(v43, 0, 1) * 0.15 + 0.95
            v40:playSound(v41, v42)
            u37 = os.clock()
        else
            u3:playSound(u20.SKULL_DROP_ITEM_PICKUP)
        end
    end)
end
function u24.setupPlayerBillboard(u44, u45) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v46 = u5.new()
    if u44.uiMaidMap[u45] ~= nil then
        return nil
    end
    u45.CharacterAdded:Connect(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u45
        --]]
        u44:updatePlayerBillboard(u45)
    end)
    u44.uiMaidMap[u45] = v46
    u44:updatePlayerBillboard(u45)
end
function u24.updatePlayerBillboard(p47, p48) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u16
        [3] = u17
        [4] = u7
        [5] = u22
    --]]
    if p48 == u8.LocalPlayer then
        return nil
    end
    local v49 = p47.uiMaidMap[p48]
    local v50 = p48.Character
    if v50 ~= nil then
        v50 = v50:WaitForChild("Head", 3)
    end
    if not (v49 and v50) then
        return nil
    end
    v49:DoCleaning()
    local v51 = u16.getAmount(p48, u17.HEADHUNT_SKULL)
    if v51 <= 0 then
        v49:DoCleaning()
        return nil
    end
    local u52 = u7.mount(u7.createElement("BillboardGui", {
        ["AlwaysOnTop"] = true,
        ["MaxDistance"] = 100,
        ["ExtentsOffset"] = Vector3.new(0, 7, 0),
        ["Size"] = UDim2.fromScale(5, 2.5)
    }, { u7.createElement(u22, {
            ["amount"] = v51
        }) }), v50)
    v49:GiveTask(function() --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u52
        --]]
        u7.unmount(u52)
    end)
end
function u24.cleanPlayerBillBoard(p53, p54) --[[ Line: 146 ]]
    local v55 = p53.uiMaidMap[p54]
    if not v55 then
        return nil
    end
    v55:DoCleaning()
end
function u24.updateHighlight(_, p56) --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u16
        [3] = u17
        [4] = u6
    --]]
    if p56 == u8.LocalPlayer then
        return nil
    else
        local v57 = p56.Character
        if v57 then
            local v58 = v57:FindFirstChild("SkullHighlight")
            local v59 = u16.getAmount(p56, u17.HEADHUNT_SKULL)
            if v59 > 4 and not v58 then
                u6("Highlight", {
                    ["Name"] = "SkullHighlight",
                    ["FillTransparency"] = 1,
                    ["OutlineTransparency"] = 0,
                    ["Parent"] = v57,
                    ["OutlineColor"] = Color3.fromRGB(255, 120, 120),
                    ["FillColor"] = Color3.fromRGB(255, 150, 150),
                    ["DepthMode"] = Enum.HighlightDepthMode.Occluded
                })
            elseif v59 < 4 and v58 ~= nil then
                v58:Destroy()
            end
        else
            return nil
        end
    end
end
function u24.updateLoopingSound(_, p60) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
        [3] = u23
        [4] = u6
    --]]
    local v61 = u16.getAmount(p60, u17.HEADHUNT_SKULL)
    local v62 = p60.Character
    if v62 ~= nil then
        v62 = v62.PrimaryPart
        if v62 ~= nil then
            v62 = v62:FindFirstChild("SkullLoopingSound")
        end
    end
    if v61 == 0 then
        if v62 ~= nil then
            v62:Stop()
        end
        if v62 ~= nil then
            v62:Destroy()
        end
        return nil
    end
    local v63 = v61 / 3
    local v64 = math.floor(v63)
    local v65 = #u23 - 1
    local v66 = u23[math.min(v64, v65) + 1]
    local v67
    if v62 == nil then
        v67 = v62
    else
        v67 = v62.SoundId
    end
    if v67 == v66 then
        return nil
    end
    if v62 ~= nil then
        v62:Destroy()
    end
    local v68 = {
        ["Name"] = "SkullLoopingSound",
        ["RollOffMinDistance"] = 20,
        ["RollOffMaxDistance"] = 40,
        ["Volume"] = 0.06,
        ["Playing"] = true,
        ["Looped"] = true,
        ["SoundId"] = v66
    }
    local v69 = p60.Character
    if v69 ~= nil then
        v69 = v69.PrimaryPart
    end
    v68.Parent = v69
    u6("Sound", v68)
end
u4.CreateController(u24.new())
return nil