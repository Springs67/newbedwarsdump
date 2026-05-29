local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.RunService
local u11 = v8.TweenService
local u12 = v8.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u18 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "CubeSplitBreakEffectController"
    end,
    ["__index"] = u18
})
u19.__index = u19
function u19.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
    --]]
    u18.constructor(p22, u15.CUBE_SPLIT)
    p22.Name = "CubeSplitBedBreakEffectController"
end
function u19.KnitStart(p23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.KnitStart(p23)
end
function u19.onBedBreak(u24, _, u25, u26, u27) --[[ Line: 42 ]]
    task.spawn(function() --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u25
            [3] = u26
            [4] = u27
        --]]
        u24:createEffect(u25, u26, u27)
    end)
end
function u19.createEffect(u28, u29, u30, u31) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u17
        [3] = u7
        [4] = u3
        [5] = u14
        [6] = u13
        [7] = u12
        [8] = u10
        [9] = u4
        [10] = u16
        [11] = u11
    --]]
    local u32 = u9.Assets.Misc.SlicedBed:Clone()
    u28.maid:GiveTask(u32)
    u28.maid:GiveTask(task.spawn(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u7
            [3] = u30
            [4] = u3
            [5] = u14
            [6] = u32
            [7] = u13
        --]]
        local u33
        if u17.isLobbyServer() then
            u33 = u3.hexColor(u14.red)
        else
            u33 = u7.Controllers.TeamController:getTeamById(u30)
            if u33 ~= nil then
                u33 = u33.color
            end
        end
        if not u33 then
            return nil
        end
        local v34 = u32.Pivot.Align:GetChildren()
        local function v36(p35) --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u3
                [3] = u33
            --]]
            if not p35:IsA("MeshPart") then
                return nil
            end
            if u13.includes(string.lower(p35.Name), "blanket") then
                p35.Color = u3.brighten(u33, 0.2)
                return nil
            end
            if u13.includes(string.lower(p35.Name), "mattress") then
                p35.Color = u33
            end
        end
        for v37, v38 in v34 do
            v36(v38, v37 - 1, v34)
        end
    end))
    u32.Parent = u12
    u32:PivotTo(u29)
    u28.maid:GiveTask(task.spawn(function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u30
            [3] = u32
            [4] = u13
            [5] = u3
        --]]
        local u39 = u7.Controllers.TeamController:getTeamById(u30)
        if u39 ~= nil then
            u39 = u39.color
        end
        if not u39 then
            return nil
        end
        local v40 = u32.Pivot.Align:GetChildren()
        local function v42(p41) --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u3
                [3] = u39
            --]]
            if not p41:IsA("MeshPart") then
                return nil
            end
            if u13.includes(string.lower(p41.Name), "blanket") then
                p41.Color = u3.brighten(u39, 0.2)
                return nil
            end
            if u13.includes(string.lower(p41.Name), "mattress") then
                p41.Color = u39
            end
        end
        for v43, v44 in v40 do
            v42(v44, v43 - 1, v40)
        end
    end))
    local u45 = {}
    for v46, v47 in u32:GetDescendants() do
        local _ = v46 - 1
        if v47:IsA("ParticleEmitter") then
            table.insert(u45, v47)
        end
    end
    u28.maid:GiveTask(task.spawn(function() --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        for v48, v49 in u45 do
            local _ = v48 - 1
            v49.Enabled = true
            task.wait(0.1)
        end
    end))
    u28.maid:GiveTask(task.delay(0.6, function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u16
            [4] = u29
        --]]
        local u50 = 1
        local u53 = u10.Heartbeat:Connect(function(p51) --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u4
                [3] = u16
                [4] = u29
            --]]
            u50 = u50 + p51
            if u50 >= 0.1 then
                local v52 = math.random() + math.random(2, 3)
                u4:playSound(u16.KILL_EFFECT_SLASH, {
                    ["position"] = u29.Position,
                    ["playbackSpeedMultiplier"] = v52
                })
                u50 = 0
            end
        end)
        task.delay(0.9, function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u53
            --]]
            u53:Disconnect()
        end)
    end))
    u28.maid:GiveTask(task.delay(1.5, function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u32
            [3] = u31
            [4] = u28
            [5] = u4
            [6] = u16
            [7] = u29
            [8] = u11
        --]]
        for v54, v55 in u45 do
            local _ = v54 - 1
            v55.Enabled = false
            local _ = v55.Enabled
        end
        for v56, v57 in u32.Pivot.Align:GetChildren() do
            local _ = v56 - 1
            if v57:IsA("MeshPart") then
                v57.Anchored = false
                v57.CanCollide = true
                local v58 = (v57.Position - u31).Unit
                local v59 = v58.X
                local v60 = v58.Z
                Vector3.new(v59, 0, v60)
            end
        end
        u28.maid:GiveTask(u4:playSound(u16.SPLIT_BED_BREAK_FALL_APART, {
            ["playbackSpeedMultiplier"] = 0.5,
            ["position"] = u29.Position
        }))
        u28.maid:GiveTask(task.delay(2.5, function() --[[ Line: 187 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u11
            --]]
            local v61 = u32.Pivot.Align:GetChildren()
            local function v63(p62) --[[ Line: 189 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                if not p62:IsA("MeshPart") then
                    return nil
                end
                u11:Create(p62, TweenInfo.new(1), {
                    ["Size"] = Vector3.new(0, 0, 0),
                    ["Transparency"] = 1
                }):Play()
            end
            for v64, v65 in v61 do
                v63(v65, v64 - 1, v61)
            end
        end))
    end))
end
v6.CreateController(u19.new())
return nil