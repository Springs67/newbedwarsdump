local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.RunService
local u9 = v6.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u11 = v1.import(script, script.Parent.Parent.Parent, "game", "items", "metal-detector", "indicator").Indicator
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-team-id").BlockHuntTeamId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, script.Parent, "nearby-indicator").NearbyIndicator
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "BlockRadarController"
    end,
    ["__index"] = u12
})
u18.__index = u18
function u18.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p21)
    p21.Name = "BlockRadarController"
end
function u18.KnitStart(p22) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p22)
end
function u18.isRelevantItem(_, p23) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p23.itemType == u14.BLOCK_RADAR
end
function u18.onEnable(u24, _, _) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u10
        [4] = u11
        [5] = u7
        [6] = u8
        [7] = u13
        [8] = u3
        [9] = u15
        [10] = u9
        [11] = u17
        [12] = u2
        [13] = u16
    --]]
    u24.directionalMaid = u4.new()
    local v25, u26 = u5.createBinding(UDim2.fromScale(0.5, 0.5))
    local v27, u28 = u5.createBinding(0)
    local u29 = u10.new()
    local u30 = u10.new()
    local u31 = u5.createRef()
    u24.directionalMaid:GiveTask(u29)
    u24.directionalMaid:GiveTask(u30)
    local u32 = u5.mount(u5.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true
    }, { u5.createElement("Frame", {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            [u5.Ref] = u31
        }), u5.createElement(u11, {
            ["position"] = v25,
            ["rotation"] = v27,
            ["activatedSignal"] = u29
        }) }), u7.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
    u24.directionalMaid:GiveTask(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u32
        --]]
        u5.unmount(u32)
    end)
    u24.directionalMaid:GiveTask(u8.Heartbeat:Connect(function() --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u24
            [3] = u3
            [4] = u15
            [5] = u31
            [6] = u9
            [7] = u26
            [8] = u28
            [9] = u4
            [10] = u5
            [11] = u17
            [12] = u30
            [13] = u7
            [14] = u2
            [15] = u16
            [16] = u29
        --]]
        local v33 = u13:getLocalPlayerEntity()
        local v34
        if v33 == nil then
            v34 = v33
        else
            v34 = v33:getInstance():GetPivot().Position
        end
        if v33 == nil or v34 == nil then
            return nil
        end
        if u24.lastTrackedHiddenPlayer == nil then
            for _, v35 in u3.Controllers.BlockDisguiseController:getDisguisedPlayers() do
                if not v35.Character then
                    return nil
                end
                if (v35.Character:GetPivot().Position - v34).Magnitude < 180 then
                    u24.lastTrackedHiddenPlayer = {
                        ["player"] = v35,
                        ["nextBeep"] = time() + 2
                    }
                end
            end
        else
            local v36 = u3.Controllers.TeamController:getPlayerTeam(u24.lastTrackedHiddenPlayer.player)
            if v36 ~= nil then
                v36 = v36.id
            end
            if u24.lastTrackedHiddenPlayer.player.Parent == nil or (not u24.lastTrackedHiddenPlayer.player.Character or (v36 == "" or (not v36 or v36 ~= u15.HIDERS))) then
                u24.lastTrackedHiddenPlayer = nil
                return nil
            end
            local v37 = u24.lastTrackedHiddenPlayer.player.Character:GetPivot().Position
            local v38 = (v37 - v34).Magnitude
            if v38 > 180 then
                u24.lastTrackedHiddenPlayer = nil
                return nil
            end
            if v38 > 45 then
                local v39 = u24.nearbyMaid
                if v39 ~= nil then
                    v39:DoCleaning()
                end
                local v40 = u31:getValue()
                local v41 = v40.AbsolutePosition
                local v42 = v40.AbsoluteSize
                local v43 = u9.CurrentCamera:WorldToViewportPoint(v37)
                local v44 = Vector2.new(v43.X, v43.Y)
                if v43.Z < 0 then
                    v44 = v42 + v41 - v44 + v41
                end
                local v45 = v44 - v41
                local v46 = v45.Y
                local v47 = v45.X
                local v48 = math.atan2(v46, v47)
                local v49 = v41 + Vector2.new(math.cos(v48) * 80, math.sin(v48) * 80)
                u26(UDim2.fromOffset(v49.X, v49.Y))
                u28((math.deg(v48)))
            elseif not u24.nearbyMaid then
                u24.nearbyMaid = u4.new()
                local v50 = u5.mount
                local v51 = u5.createElement
                local v52 = {}
                local v53 = {
                    ["activatedSignal"] = u30
                }
                __set_list(v52, 1, {u5.createElement("Frame", {
    ["BackgroundTransparency"] = 1,
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Position"] = UDim2.fromScale(0.5, 0.5)
}), u5.createElement(u17, v53)})
                local u54 = v50(v51("ScreenGui", {
                    ["ResetOnSpawn"] = false,
                    ["IgnoreGuiInset"] = true
                }, v52), u7.LocalPlayer:FindFirstChildOfClass("PlayerGui"))
                u24.nearbyMaid:GiveTask(function() --[[ Line: 145 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u54
                    --]]
                    u5.unmount(u54)
                end)
            end
            if u24.lastTrackedHiddenPlayer.nextBeep < time() then
                local v55 = {}
                for v56, v57 in u24.lastTrackedHiddenPlayer do
                    v55[v56] = v57
                end
                v55.nextBeep = time() + 2
                u24.lastTrackedHiddenPlayer = v55
                if v38 > 45 then
                    u2:playSound(u16.BLOCK_RADAR_FAR, {
                        ["position"] = nil,
                        ["volumeMultiplier"] = 0.5
                    })
                    u29:Fire(1)
                else
                    u2:playSound(u16.BLOCK_RADAR_NEAR, {
                        ["position"] = nil,
                        ["volumeMultiplier"] = 0.5
                    })
                    u30:Fire(1)
                end
            end
        end
    end))
end
function u18.onDisable(p58) --[[ Line: 190 ]]
    if p58.directionalMaid then
        p58.directionalMaid:DoCleaning()
        p58.directionalMaid = nil
    end
    if p58.nearbyMaid then
        local v59 = p58.nearbyMaid
        if v59 ~= nil then
            v59:DoCleaning()
        end
        p58.nearbyMaid = nil
    end
end
u3.CreateController(u18.new())
return nil