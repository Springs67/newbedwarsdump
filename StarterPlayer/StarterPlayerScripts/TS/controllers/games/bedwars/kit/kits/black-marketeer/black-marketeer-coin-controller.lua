local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.HttpService
local u11 = v8.Players
local u12 = v8.ReplicatedStorage
local u13 = v8.RunService
local u14 = v8.Workspace
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "BlackMarketeerCoinController"
    end,
    ["__index"] = u20
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.constructor(p24)
    p24.Name = "BlackMarketeerCoinController"
    p24.pickupListenerActive = false
end
function u21.KnitStart(p25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.KnitStart(p25)
end
function u21.validCollectableEntityTypes(_) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    return { u17.SHADOW_COIN }
end
function u21.pickDisplayModel(_, p26, _) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u18
        [4] = u12
    --]]
    local v27
    if u11.LocalPlayer.Character then
        v27 = u5.Controllers.KitController:getKitSkin(u11.LocalPlayer.Character)
    else
        v27 = nil
    end
    local v28
    if v27 == u18.HALLOWEEN_WREN then
        v28 = u12.Assets.Misc.BlackMarketTraderCoinHalloween
    elseif v27 == u18.TIDAL_WREN then
        v28 = u12.Assets.Misc.BlackMarketTraderCoinTidal
    else
        v28 = u12.Assets.Misc.BlackMarketTraderCoin
    end
    return {
        ["repStorageModel"] = v28,
        ["collectionTag"] = p26
    }
end
function u21.onWillRemoveEntity(p29, _, _, p30, p31) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u5
        [4] = u18
        [5] = u10
        [6] = u13
        [7] = u11
        [8] = u16
        [9] = u15
        [10] = u2
        [11] = u19
    --]]
    if not p30 then
        return nil
    end
    local u32 = u6.new()
    local u33 = p31:Clone()
    u33.Parent = u14
    u32:GiveTask(u33)
    u33:PivotTo(p31:GetPivot())
    if not u33.PrimaryPart then
        u32:DoCleaning()
        return nil
    end
    local v34
    if p30.Character then
        v34 = u5.Controllers.KitController:getKitSkin(p30.Character) == u18.HALLOWEEN_WREN
    else
        v34 = false
    end
    if v34 then
        p29:playCoffinEffect(p30)
    end
    local u35 = 0
    local u36
    if v34 then
        u36 = p30.Character
        if u36 ~= nil then
            u36 = u36:FindFirstChild("coffin")
            if u36 ~= nil then
                u36 = u36:FindFirstChild("Handle")
                if u36 ~= nil then
                    u36 = u36:FindFirstChild("GhostTarget")
                end
            end
        end
    else
        u36 = p30.Character
        if u36 ~= nil then
            u36 = u36:FindFirstChild("UpperTorso")
        end
    end
    if u36 == nil then
        u32:DoCleaning()
        return nil
    end
    local v37 = math.random(-2, 2)
    local v38 = math.random(3, 4)
    local v39 = math.random
    local u40 = Vector3.new(v37, v38, v39(-2, 2))
    local u41 = u10:GenerateGUID(false)
    u13:BindToRenderStep(u41, Enum.RenderPriority.Last.Value, function(p42) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u33
            [3] = u32
            [4] = u35
            [5] = u40
        --]]
        if u36.Parent == nil or u33.PrimaryPart == nil then
            u32:DoCleaning()
            return nil
        end
        u35 = u35 + p42
        local v43 = u35 / 1
        local v44 = math.clamp(v43, 0, 1)
        local v45 = u33.PrimaryPart.Position:Lerp(u36.Position, (math.sqrt(v44)))
        local v46 = v44 * 3.141592653589793
        local v47 = math.sin(v46)
        local v48 = v45 + u40 * Vector3.new(v47, v47, v47)
        local v49 = CFrame.Angles(6.283185307179586 * (u35 % 2), 6.283185307179586 * (u35 % 3), 6.283185307179586 * (u35 % 1.2))
        u33:PivotTo(CFrame.new(v48) * v49)
    end)
    u32:GiveTask(function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u41
        --]]
        return u13:UnbindFromRenderStep(u41)
    end)
    task.delay(1, function() --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        u32:DoCleaning()
    end)
    if p30 == u11.LocalPlayer then
        u16:playAnimation(u11.LocalPlayer, u15.PUNCH)
        u2:playSound(u19.COIN_COLLECT)
    end
end
function u21.onCreatedEntity(_, _, _, u50) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u18
        [4] = u13
    --]]
    u50:PivotTo(CFrame.new(u50:GetPivot().Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.random(0, 3) / 2 * 3.141592653589793, 0))
    local u51
    if u11.LocalPlayer.Character then
        u51 = u5.Controllers.KitController:getKitSkin(u11.LocalPlayer.Character) == u18.HALLOWEEN_WREN
    else
        u51 = false
    end
    local u52 = 0
    if not u50.PrimaryPart then
        return nil
    end
    local u53 = u50.PrimaryPart.Position
    local u58 = u13.Heartbeat:Connect(function(p54) --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u50
            [3] = u51
            [4] = u53
        --]]
        u52 = u52 + p54
        local v55 = (os.clock() - 0) / 0.5
        local v56 = math.sin(v55) * 0.3 + 0
        local v57 = CFrame.new(u50.PrimaryPart.Position) * CFrame.Angles(0, 6.283185307179586 * u52 * 0.3, 0)
        if u51 then
            v57 = CFrame.new(u53.X, u53.Y + v56, u53.Z)
        end
        u50:PivotTo(v57)
    end)
    local u59 = nil
    u59 = u50.Destroying:Once(function() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u59
        --]]
        u58:Disconnect()
        u59:Disconnect()
    end)
end
function u21.listenToPickup(u60) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u60.pickupListenerActive then
        return nil
    end
    u60.pickupListenerActive = true
    u1.Promise.defer(function() --[[ Line: 189 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u1
        --]]
        while true do
            local v61 = task.wait(0.2)
            if v61 ~= 0 and (v61 == v61 and v61) then
                v61 = u60.pickupListenerActive
            end
            if v61 == 0 or (v61 ~= v61 or not v61) then
                return
            end
            u1.Promise.defer(function() --[[ Line: 198 ]]
                --[[
                Upvalues:
                    [1] = u60
                --]]
                u60:checkForPickup()
            end)
        end
    end)
    return {
        ["Destroy"] = function() --[[ Name: Destroy, Line 204 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            u60.pickupListenerActive = false
        end
    }
end
function u21.checkForPickup(u62) --[[ Line: 209 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u17
        [4] = u14
    --]]
    local u63 = u11.LocalPlayer.Character
    if u63 ~= nil then
        u63 = u63.PrimaryPart
    end
    if not u63 then
        return nil
    end
    local v64 = u9:GetTagged(u17.SHADOW_COIN)
    local function v67(p65) --[[ Line: 219 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u63
            [3] = u62
            [4] = u11
            [5] = u17
        --]]
        local v66 = p65:GetAttribute("SpawnTime")
        if u14:GetServerTimeNow() - v66 < 1 then
            return nil
        end
        if (u63.Position - p65:GetPivot().Position).Magnitude <= 5.5 then
            u62:collectEntity(u11.LocalPlayer, p65, u17.SHADOW_COIN)
        end
    end
    for v68, v69 in v64 do
        v67(v69, v68 - 1, v64)
    end
end
function u21.playCoffinEffect(_, p70) --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
        [3] = u15
    --]]
    local v71 = p70.Character
    if v71 ~= nil then
        v71 = v71:FindFirstChild("coffin")
        if v71 ~= nil then
            v71 = v71:FindFirstChild("Handle")
            if v71 ~= nil then
                v71 = v71:FindFirstChild("Rig")
                if v71 ~= nil then
                    v71 = v71:FindFirstChild("AnimationController")
                end
            end
        end
    end
    if not v71 then
        return nil
    end
    local v72
    if v71 == nil then
        v72 = v71
    else
        v72 = v71:FindFirstChild("Animator")
    end
    local v73 = v72 or u7("Animator", {
        ["Parent"] = v71
    })
    if v73 then
        u16:playAnimation(v73, u15.HALLOWEEN_WREN_COFFIN_OPEN_CLOSE, {
            ["looped"] = false,
            ["speed"] = 2
        })
    end
end
v4.CreateController(u21.new())
return nil