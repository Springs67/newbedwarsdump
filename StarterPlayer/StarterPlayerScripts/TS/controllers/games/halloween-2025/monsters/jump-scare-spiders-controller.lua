local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.ReplicatedStorage
local u10 = v7.RunService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "JumpScareSpidersController"
    end,
    ["__index"] = u12
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
        [1] = u12
        [2] = u16
    --]]
    u12.constructor(p22, { u16.HALLOWEEN_2025_EVENT_PVE })
    p22.Name = "JumpScareSpidersController"
    p22.effectMap = {}
end
function u19.KnitStart(p23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p23)
end
function u19.onGameInit(u24) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.Client:Get("JumpSpiderEffect"):Connect(function(p25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        print(p25.serverModel)
        u24:createEffect(p25.spawnPosition, p25.victim, p25.serverModel)
    end)
end
function u19.createEffect(_, p26, u27, u28) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u3
        [4] = u14
        [5] = u13
        [6] = u4
        [7] = u18
        [8] = u11
        [9] = u6
        [10] = u15
        [11] = u10
    --]]
    local u29 = u9.Assets.Misc.Spider:Clone()
    for _, v30 in u29:GetDescendants() do
        if v30:IsA("Part") then
            v30.CollisionGroup = "Monster"
            v30.CanCollide = false
            u8:AddTag(v30, "CanNoclip")
        end
    end
    local u31 = u27.Character
    if u31 ~= nil then
        u31 = u31.PrimaryPart
        if u31 ~= nil then
            u31 = u31.CFrame
        end
    end
    if not u31 then
        return nil
    end
    u29.PrimaryPart.Anchored = true
    u29:PivotTo(CFrame.new(p26.Position, u31.Position))
    u29.Parent = u28
    u3:playAnimation(u29, u14:getAssetId(u13.SPIDER_ATTACK))
    u4:playSound(u18.SPIDER_ATTACK_1, {
        ["position"] = u31.Position
    })
    local v32 = u31.LookVector * 0.5
    local v33 = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0)
    local u34 = (u31 + v32 + Vector3.new(0, 1, 0)) * v33
    u11(0.5, u6, function(p35) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29:PivotTo(p35)
    end, u29.PrimaryPart.CFrame, u34):Play()
    task.delay(0.5, function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u28
            [3] = u27
            [4] = u10
            [5] = u31
            [6] = u29
            [7] = u34
        --]]
        local u36 = u15:getEntity(u28)
        local u37 = u15:getEntity(u27)
        if not (u36 and u37) then
            return nil
        end
        local u38 = nil
        u38 = u10.Heartbeat:Connect(function(_) --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u31
                [3] = u36
                [4] = u37
                [5] = u29
                [6] = u38
                [7] = u34
            --]]
            local v39 = u27.Character
            if v39 ~= nil then
                v39 = v39.PrimaryPart
                if v39 ~= nil then
                    v39 = v39.CFrame
                end
            end
            u31 = v39
            if u36:isDead() or (u37:isDead() or not u31) then
                u29.PrimaryPart.Anchored = false
                u38:Disconnect()
                return nil
            end
            local v40 = u31
            local v41 = u31.LookVector * 0.5
            local v42 = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0)
            u34 = (v40 + v41 + Vector3.new(0, 1, 0)) * v42
            u29:PivotTo(u34)
        end)
    end)
end
v5.CreateController(u19.new())
return nil