local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.RunService
local u10 = v7.TweenService
local u11 = v7.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme-meta").getCurrentStatefulEntitySkinMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants")
local u17 = v16.GolemBossAction
local u18 = v16.VOID_GOLEM_LASER_DELAY
local u19 = v16.VOID_GOLEM_LASER_DURATION
local u20 = v16.VoidGolemBossConstants
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u23 = v1.import(script, script.Parent, "golem-boss-client").GolemBossClient
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "VoidGolemBossClient"
    end,
    ["__index"] = u23
})
u24.__index = u24
function u24.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27, p28, p29, p30) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.constructor(p27, p28, p29, p30)
end
function u24.createGameEntity(p31, p32) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u15
        [3] = u22
        [4] = u11
    --]]
    local v33 = u14(u15.VOID_GOLEM_BOSS).model:Clone()
    v33:WaitForChild("RootPart").Anchored = true
    u22:setEntityIgnoreQuery(v33)
    u22:setClientEntityNotCollidable(v33)
    v33:PivotTo(p32)
    p31.gameEntity = v33
    u22:hideStatefulEntity(p31.gameEntity)
    v33.Parent = u11
    p31:registerClientGameEntity(v33)
end
function u24.handleActionRequest(p34, p35, p36) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u17
    --]]
    u23.handleActionRequest(p34, p35, p36)
    if p35 == u17.VOID_PORTAL_ATTACK then
        p34:handleVoidPortalAttack(p36)
    end
end
function u24.handleVoidPortalAttack(p37, p38) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u13
        [3] = u12
        [4] = u22
        [5] = u5
        [6] = u21
        [7] = u20
        [8] = u4
        [9] = u6
        [10] = u19
    --]]
    if not p37.gameEntity or (not p37.gameEntity.Parent or p37.isDead) then
        return nil
    end
    if p38.firstPortal then
        u3:playAnimation(p37.gameEntity, u13:getAssetId(u12.VOID_GOLEM_PORTAL_ATTACK), {
            ["looped"] = false
        })
        local v39 = {
            ["volumeMultiplier"] = 2,
            ["position"] = u22:getGameEntityCFrame(p37.gameEntity).Position
        }
        u5:playSound(u21.VOID_TITAN_PORTAL_ATTACK, v39)
        task.wait(u20.VOID_GOLEM_PORTAL_ANIMATION_DELAY)
    end
    local v40 = p38.portalPosition
    local v41 = u4.fromList
    local v42 = u20.VOID_GOLEM_PORTAL_OPEN_SOUNDS
    u5:playSound(v41(unpack(v42)), {
        ["position"] = v40
    })
    p37:createPortal(v40, p38.dangerPosition)
    local v43 = p37:getDangerPositions(p38.dangerPosition)
    u6.Controllers.GolemBossController:showDangerIndicators(v43)
    task.delay(u19, function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6.Controllers.GolemBossController:hideAllBlockDangerIndicators()
    end)
end
function u24.getDangerPositions(_, p44) --[[ Line: 92 ]]
    local v45 = {}
    for _, v46 in {
        Vector3.new(0, 0, 0),
        Vector3.new(1, 0, 1),
        Vector3.new(0, 0, 1),
        Vector3.new(1, 0, 0),
        Vector3.new(-1, 0, 0),
        Vector3.new(0, 0, -1),
        Vector3.new(-1, 0, -1),
        Vector3.new(1, 0, -1),
        Vector3.new(-1, 0, 1)
    } do
        local v47 = p44 + v46
        table.insert(v45, v47)
    end
    return v45
end
function u24.createPortal(u48, p49, _) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u18
        [4] = u10
        [5] = u19
    --]]
    local u50 = u8.Assets.Effects.TitanVoidPortal:Clone()
    u50.Parent = u11
    u50:ScaleTo(0.01)
    local v51 = CFrame.fromEulerAnglesXYZ(0, 0, -1.5707963267948966)
    u50:PivotTo(CFrame.new(p49) * v51)
    u48:scalePortal(u50, 1, 0.75)
    task.delay(u18, function() --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u10
            [3] = u19
            [4] = u48
        --]]
        local u52 = u50.beam.BottomAttachment
        local v53 = u52.WorldCFrame
        local v54 = u10:Create(u52, TweenInfo.new(0.25), {
            ["WorldCFrame"] = CFrame.new(v53.X, v53.Y - 22.2, v53.Z) * CFrame.Angles(0, 3.141592653589793, -1.5707963267948966)
        })
        v54:Play()
        v54.Completed:Connect(function() --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            for v55, v56 in u52:GetDescendants() do
                local _ = v55 - 1
                if v56:IsA("ParticleEmitter") then
                    v56.Enabled = true
                end
            end
        end)
        local u57 = u10:Create(u52, TweenInfo.new(0.25), {
            ["WorldCFrame"] = v53
        })
        task.delay(u19, function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u57
            --]]
            for v58, v59 in u52:GetDescendants() do
                local _ = v58 - 1
                if v59:IsA("ParticleEmitter") then
                    v59.Enabled = false
                end
            end
            u57:Play()
        end)
        u57.Completed:Connect(function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u50
            --]]
            u48:scalePortal(u50, 0.01, 0.75)
            task.delay(0.75, function() --[[ Line: 151 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                u50:Destroy()
            end)
        end)
    end)
    return u50
end
function u24.scalePortal(_, u60, u61, u62) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local u63 = u60:GetScale()
    local u64 = 0
    local u65 = nil
    u65 = u9.Heartbeat:Connect(function(p66) --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u64
            [2] = u62
            [3] = u63
            [4] = u61
            [5] = u60
            [6] = u65
        --]]
        u64 = u64 + p66
        local v67 = u64 / u62
        local v68 = math.clamp(v67, 0, 1)
        u60:ScaleTo(u63 + (u61 - u63) * v68)
        if v68 >= 1 then
            u65:Disconnect()
        end
    end)
end
return {
    ["VoidGolemBossClient"] = u24
}