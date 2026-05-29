local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.WatchCollectionTag
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InQuint
local u8 = v6.OutExpo
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "util", "action-util").ActionUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u27 = v1.import(script, script.Parent, "ui", "block-invuln-timer").BlockInvulnTimer
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "LuckyblockTowersController"
    end,
    ["__index"] = u20
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u23
    --]]
    u20.constructor(p31, { u23.LB_ONEBLOCK })
    p31.Name = "LuckyblockTowersController"
end
function u28.KnitStart(p32) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.KnitStart(p32)
end
function u28.onGameInit(u33) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u19
        [3] = u24
        [4] = u5
        [5] = u21
        [6] = u25
        [7] = u22
        [8] = u14
    --]]
    u4("LBT_LuckyBlock", function(p34) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        local v35 = p34:GetAttribute("InvulnEndTime")
        local v36 = v35 == nil and 0 or v35
        local v37 = os.clock()
        if v36 > 0 and v37 < v36 then
            u33:applyBlockShield(p34, v36)
        end
    end)
    u19.MatchStateChange:connect(function(p38) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u5
            [3] = u33
            [4] = u21
        --]]
        if p38.matchState == u24.RUNNING then
            u5.Controllers.MapController:getCFrame("center"):andThen(function(p39) --[[ Line: 66 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u21
                --]]
                if p39 then
                    u33:pointPlayerCameraTo(p39.Position)
                end
                local u40 = u21:disableMovementInput()
                task.delay(0.6, function() --[[ Line: 71 ]]
                    --[[
                    Upvalues:
                        [1] = u40
                    --]]
                    u40()
                end)
            end)
        end
    end)
    u25.Client:OnEvent("EntityDeathEvent", function(p41) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u24
            [3] = u22
            [4] = u14
            [5] = u33
        --]]
        if u5.Controllers.MatchController:getMatchState() ~= u24.RUNNING then
            return nil
        end
        local v42 = u22:getEntity(p41.entityInstance)
        if v42 ~= nil then
            v42 = v42:getPlayer()
        end
        if v42 == u14.LocalPlayer then
            u5.Controllers.MapController:getCFrame("center"):andThen(function(p43) --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                if p43 then
                    u33:pointPlayerCameraTo(p43.Position)
                end
            end)
        end
    end)
end
function u28.pointPlayerCameraTo(_, p44) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v45 = u17.CurrentCamera
    if not v45 then
        return nil
    end
    v45.CFrame = CFrame.lookAt(v45.CFrame.Position, p44)
end
function u28.applyBlockShield(_, u46, p47) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u11
        [3] = u27
        [4] = u15
        [5] = u12
        [6] = u17
        [7] = u18
        [8] = u8
        [9] = u26
        [10] = u3
        [11] = u16
        [12] = u9
        [13] = u7
    --]]
    local u48 = u10.new()
    local u49 = u11.mount(u11.createElement(u27, {
        ["Adornee"] = u46,
        ["EndTime"] = p47
    }), u46)
    u48:GiveTask(function() --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u49
        --]]
        u11.unmount(u49)
    end)
    local u50 = Color3.fromRGB(46, 46, 46)
    u46.Color = u50
    u48:GiveTask(function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        u46.Color = Color3.fromRGB(255, 255, 255)
    end)
    task.delay(0.05, function() --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u50
            [3] = u48
        --]]
        local v51 = u46
        if v51 ~= nil then
            for v52, u53 in v51:GetDescendants() do
                local _ = v52 - 1
                if u53:IsA("Texture") or u53:IsA("Decal") then
                    u53.Color3 = u50
                    u48:GiveTask(function() --[[ Line: 129 ]]
                        --[[
                        Upvalues:
                            [1] = u53
                        --]]
                        u53.Color3 = Color3.fromRGB(255, 255, 255)
                    end)
                end
            end
        end
    end)
    local u54 = u46.CFrame
    local u55 = u15.Assets.Effects.BedShield:Clone()
    u55:PivotTo(u54)
    u12(u55, 0.05)
    u55.Parent = u17
    u18(1.1, u8, function(p56) --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        u55.Shields.Transparency = p56
    end, 1, 0)
    u26.tweenModelSize(u55, 1.1, u8, 10)
    for _, v57 in u55:GetChildren() do
        if v57:IsA("BasePart") then
            u3:setQueryIgnored(v57, true)
        end
    end
    local u58 = 0
    u48:GiveTask(u16.Heartbeat:Connect(function(p59) --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u55
            [3] = u9
            [4] = u54
        --]]
        u58 = u58 + p59
        if u55.PrimaryPart == nil then
            u9.Error("Shield effect has no primary part")
            return nil
        end
        local v60 = CFrame.Angles(0, u58 * 0.8, 0)
        u55.Shields.CFrame = u54 * v60
    end))
    u48:GiveTask(function() --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u55
            [3] = u7
        --]]
        u26.tweenModelSize(u55, 0.3, u7, 0):andThen(function() --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u55
            --]]
            u55:Destroy()
        end)
    end)
    u48:GiveTask(function() --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u48
        --]]
        u46.AncestryChanged:Once(function() --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u48
            --]]
            u48:DoCleaning()
        end)
    end)
    task.delay(p47 - u17:GetServerTimeNow(), function() --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        u48:DoCleaning()
    end)
    return u48
end
u5.CreateController(u28.new())
return nil