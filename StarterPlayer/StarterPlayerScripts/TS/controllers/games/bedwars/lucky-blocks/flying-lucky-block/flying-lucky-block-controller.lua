local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "flying-lucky-block", "flying-lucky-block-util").FlyingLuckyBlockUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "FlyingLuckyBlockController"
    end,
    ["__index"] = u14
})
u23.__index = u23
function u23.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p26)
    p26.Name = "FlyingLuckyBlockController"
    p26.partMap = {}
end
function u23.KnitStart(u27) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u21
        [3] = u2
        [4] = u5
        [5] = u22
        [6] = u11
        [7] = u19
        [8] = u1
        [9] = u8
        [10] = u10
        [11] = u17
    --]]
    u14.KnitStart(u27)
    u21.Client:Get("FlyingLuckyBlockDestroy"):Connect(function(p28) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u2
        --]]
        local v29 = u27.partMap[p28.uuid]
        if v29 ~= nil then
            v29:Destroy()
        end
        u27.partMap[p28.uuid] = nil
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. p28.uuid)
    end)
    u21.Client:Get("FlyingLuckyBlockCreate"):Connect(function(p30) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:initializeFlyingLuckyBlock(p30.uuid, p30.serverInstance, p30.spawnPosition, p30.endPosition, p30.perchPosition, p30.height, p30.spawning, p30.direction)
    end)
    u21.Client:Get("FlyingLuckyBlockBreak"):Connect(function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u22
        --]]
        u5:playSound(u22.LUCKY_BLOCK_BREAK)
    end)
    u21.Client:Get("FlyingLuckyBlockReceiveItem"):Connect(function(u31) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u19
            [3] = u1
            [4] = u8
            [5] = u5
            [6] = u22
            [7] = u10
            [8] = u17
        --]]
        local u32 = u31.player.Character
        if u32 ~= nil then
            u32 = u32.PrimaryPart
        end
        if not u32 then
            return nil
        end
        for _, u33 in u31.drops do
            local v34 = math
            local v35 = u33.amount
            local v36 = v35 == nil and 1 or v35
            local v37 = v34.floor(v36)
            local v38 = math.min(v37, 4)
            local v39 = u11:WaitForChild("Items"):WaitForChild(u33.item)
            local u40 = u19.cloneItemIntoModel(v39)
            local u41 = u31.blockWorldPos
            local v42 = false
            local v43 = 0
            local u44 = 0
            while true do
                if true then
                    if v42 then
                        v43 = v43 + 1
                    else
                        v42 = true
                    end
                end
                if v43 >= v38 then
                    break
                end
                task.spawn(function() --[[ Line: 101 ]]
                    --[[
                    Upvalues:
                        [1] = u1
                        [2] = u8
                        [3] = u40
                        [4] = u41
                        [5] = u32
                        [6] = u5
                        [7] = u22
                        [8] = u31
                        [9] = u10
                        [10] = u44
                        [11] = u17
                        [12] = u33
                    --]]
                    u1.Promise.delay(math.random() * 0.2):await()
                    u8.Controllers.ReceiveItemEffectController:playEffect(u40, u41, function() --[[ Line: 103 ]]
                        --[[
                        Upvalues:
                            [1] = u32
                        --]]
                        return u32.CFrame
                    end, 0.5 + math.random() * 0.2):andThen(function(p45) --[[ Line: 106 ]]
                        --[[
                        Upvalues:
                            [1] = u5
                            [2] = u22
                            [3] = u31
                            [4] = u10
                            [5] = u32
                            [6] = u44
                            [7] = u17
                            [8] = u33
                        --]]
                        if p45 then
                            local v46 = u5
                            local v47 = u22.PICKUP_ITEM_DROP
                            local v48 = {
                                ["volumeMultiplier"] = 0.8
                            }
                            local v49
                            if u31.player == u10.LocalPlayer then
                                v49 = nil
                            else
                                v49 = u32.Position
                            end
                            v48.position = v49
                            local v50 = v46:playSound(v47, v48)
                            if v50 then
                                local v51 = u44
                                u44 = u44 + 1
                                v50:setProperty("PlaybackSpeed", v51 / 50 + 1)
                            end
                            local v52 = u17(u33.item).pickUpOverlaySound
                            if v52 ~= "" and v52 then
                                local v53 = u5
                                local v54 = {
                                    ["volumeMultiplier"] = 0.9
                                }
                                local v55
                                if u31.player == u10.LocalPlayer then
                                    v55 = nil
                                else
                                    v55 = u32.Position
                                end
                                v54.position = v55
                                local v56 = v53:playSound(v52, v54)
                                if v56 then
                                    local v57 = u44
                                    u44 = u44 + 1
                                    v56:setProperty("PlaybackSpeed", v57 / 50 + 1)
                                end
                            end
                        end
                    end)
                end)
            end
        end
    end)
end
u23.initializeFlyingLuckyBlock = u1.async(function(p58, p59, p60, p61, p62, p63, p64, p65, _) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v66 = p63.X
    local v67 = p63.Z
    local v68 = Vector3.new(v66, p64, v67)
    if p65 then
        local v69 = p58:createFlyingLuckyBlockModel(p61, p61, p62, p60, p59)
        p58.partMap[p59] = v69
        u20.moveFlyingLuckyBlock(v69, v68, false)
        u20.moveFlyingLuckyBlock(v69, p63, true)
        v69:Destroy()
    else
        local v70 = p58:createFlyingLuckyBlockModel(p63, p61, p62, p60, p59)
        p58.partMap[p59] = v70
        u20.moveFlyingLuckyBlock(v70, v68, true)
        u20.moveFlyingLuckyBlock(v70, p62, false)
        v70:Destroy()
    end
end)
function u23.createFlyingLuckyBlockModel(p71, p72, p73, p74, p75, p76) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u18
        [3] = u12
        [4] = u16
        [5] = u15
        [6] = u5
        [7] = u4
        [8] = u22
    --]]
    local u77 = u11.Assets.Blocks:FindFirstChild(u18.FLYING_LUCKY_BLOCK)
    if u77 ~= nil then
        u77 = u77:Clone()
    end
    u77.Parent = u12
    u77:SetAttribute("NoNametag", true)
    u77:PivotTo(CFrame.new(p73, p74))
    local v78 = u77:GetPivot().Rotation
    u77:PivotTo(CFrame.new(p72) * v78)
    local v79 = u77:FindFirstChild("Root")
    if v79 ~= nil then
        v79 = v79:FindFirstChild("Wings")
        if v79 ~= nil then
            v79 = v79:WaitForChild("AnimationController", 3)
            if v79 ~= nil then
                v79 = v79:WaitForChild("Animator", 3)
            end
        end
    end
    if v79 then
        local v80 = u16:playAnimation(v79, u15.FLYING_LUCKY_BLOCK_FLAP)
        if v80 ~= nil then
            v80:AdjustSpeed(0.5)
        end
        if v80 ~= nil then
            v80.DidLoop:Connect(function() --[[ Line: 199 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u4
                    [3] = u22
                    [4] = u77
                --]]
                u5:playSound(u4.fromList(u22.FLYING_LUCKY_BLOCK_WING_FLAP_1, u22.FLYING_LUCKY_BLOCK_WING_FLAP_2), {
                    ["volumeMultiplier"] = 0.5,
                    ["position"] = u77:GetPivot().Position
                })
            end)
        end
    end
    p71:createEntityHealthbar(p76, u77, p75, nil, 60)
    return u77
end
function u23.createEntityHealthbar(_, p81, p82, p83, p84, p85) --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u13
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["app"] = u13,
        ["appId"] = "StatefulEntityHpBarBillboard_" .. p81
    }, {
        ["hpBarOffset"] = Vector3.new(0, 3.5, 0),
        ["gameEntity"] = p82,
        ["serverInstance"] = p83,
        ["barColor"] = p84,
        ["maxDistance"] = p85
    }, nil, p82)
end
v7.CreateController(u23.new())
return nil