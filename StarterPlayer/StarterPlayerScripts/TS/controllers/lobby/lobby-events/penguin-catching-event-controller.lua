local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.ColorUtil
local v6 = v3.ConstantManager
local u7 = v3.GameQueryUtil
local u8 = v3.RandomUtil
local u9 = v3.SoundManager
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.Workspace
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v6.registerConstants(script, {
    ["P1XRange"] = NumberRange.new(-30, 30),
    ["P1YRange"] = NumberRange.new(-15, 15),
    ["P1ZRange"] = NumberRange.new(-15, 15)
})
local u33 = { u31.PENGUIN_ATTACK_1, u31.PENGUIN_ATTACK_2, u31.PENGUIN_ATTACK_3 }
local u34 = {
    u31.PENGUIN_DAMAGED_5,
    u31.PENGUIN_DAMAGED_6,
    u31.PENGUIN_DAMAGED_7,
    u31.PENGUIN_DAMAGED_8
}
local u35 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "PenguinCatchingEventController"
    end,
    ["__index"] = u19
})
u35.__index = u35
function u35.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v36 = u35
    local v37 = setmetatable({}, v36)
    return v37:constructor(...) or v37
end
function u35.constructor(p38) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.constructor(p38)
    p38.Name = "PenguinCatchingEventController"
    p38.nextCheck = -1
    p38.cooldown = 0.3
    p38.random = Random.new()
end
function u35.KnitStart(u39) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u18
        [3] = u2
        [4] = u23
        [5] = u27
        [6] = u28
        [7] = u30
        [8] = u15
        [9] = u9
        [10] = u31
        [11] = u16
        [12] = u25
        [13] = u26
        [14] = u14
        [15] = u29
        [16] = u22
        [17] = u24
        [18] = u12
        [19] = u8
        [20] = u33
        [21] = u34
        [22] = u4
        [23] = u21
        [24] = u20
        [25] = u5
    --]]
    u19.KnitStart(u39)
    u18.ProjectileLaunched:connect(function(p40) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u23
            [3] = u27
            [4] = u28
        --]]
        if p40:isLocalShooter() and p40.projectileType == "penguin_web" then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u23.WEB_LAUNCHER, u27(u28.WEB_LAUNCHER).projectileSource.fireDelaySec)
        end
    end)
    u18.ProjectileLaunched:connect(function(p41) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u23
            [3] = u27
            [4] = u28
        --]]
        if p41:isLocalShooter() and p41.projectileType == "big_web" then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u23.BIG_WEB_LAUNCHER, u27(u28.BIG_WEB_LAUNCHER).projectileSource.fireDelaySec)
        end
    end)
    u30.Client:Get("WebHitPlayer"):Connect(function(p42) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u9
            [3] = u31
            [4] = u16
        --]]
        local u43 = u15.Assets.Effects.PenguinWebEffect:Clone()
        u43.Size = u43.Size * 2
        local v44 = p42.player.Character
        if v44 ~= nil then
            v44 = v44.PrimaryPart
            if v44 ~= nil then
                v44 = v44.Position
            end
        end
        if not v44 then
            return nil
        end
        u9:playSound(u31.WEB_CAUGHT, {
            ["position"] = v44
        })
        u43.Position = v44 - Vector3.new(0, 1, 0)
        u43.Parent = u16
        task.delay(0.75, function() --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            u43:Destroy()
        end)
    end)
    if not u25[u26.PENGUIN_CATCHING_LOBBY_EVENT].active then
        return false
    end
    u30.Client:OnEvent("PlunderProc", function(p45, p46, _, p47) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
            [3] = u31
            [4] = u39
            [5] = u15
            [6] = u29
            [7] = u27
        --]]
        local u48 = p45.PrimaryPart
        if not u48 then
            return nil
        end
        local u49 = p45 == u14.LocalPlayer.Character
        if u49 and not p47 then
            u9:playSound(u31.CONFETTI)
        end
        local u50 = 0
        local u51 = u48.Position
        if u39.eventNpcPosition then
            u51 = u39.eventNpcPosition
        end
        u14:GetPlayerFromCharacter(p45)
        for _, u52 in p46 do
            local v53 = u52.amount
            local v54 = math.min(v53, 5)
            local v55 = u15:WaitForChild("Items"):WaitForChild(u52.itemType)
            local u56 = u29.cloneItemIntoModel(v55)
            local v57 = false
            local v58 = 0
            while true do
                if true then
                    if v57 then
                        v58 = v58 + 1
                    else
                        v57 = true
                    end
                end
                if v58 >= math.ceil(v54) then
                    break
                end
                task.spawn(function() --[[ Line: 132 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                        [2] = u56
                        [3] = u51
                        [4] = u48
                        [5] = u9
                        [6] = u31
                        [7] = u49
                        [8] = u50
                        [9] = u27
                        [10] = u52
                    --]]
                    task.wait(math.random() * 0.2)
                    u39:playEffect(u56, u51, function() --[[ Line: 134 ]]
                        --[[
                        Upvalues:
                            [1] = u48
                        --]]
                        return u48.CFrame
                    end, 0.5 + math.random() * 0.2):andThen(function(p59) --[[ Line: 137 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u31
                            [3] = u49
                            [4] = u48
                            [5] = u50
                            [6] = u27
                            [7] = u52
                        --]]
                        if p59 then
                            local v60 = u9
                            local v61 = u31.PICKUP_ITEM_DROP
                            local v62 = {
                                ["volumeMultiplier"] = 0.8
                            }
                            local v63
                            if u49 then
                                v63 = nil
                            else
                                v63 = u48.Position
                            end
                            v62.position = v63
                            local v64 = u50
                            u50 = u50 + 1
                            v62.playbackSpeedMultiplier = v64 / 50 + 1
                            v60:playSound(v61, v62)
                            local v65 = u27(u52.itemType).pickUpOverlaySound
                            if v65 ~= "" and v65 then
                                local v66 = u9
                                local v67 = {
                                    ["volumeMultiplier"] = 0.9
                                }
                                local v68
                                if u49 then
                                    v68 = nil
                                else
                                    v68 = u48.Position
                                end
                                v67.position = v68
                                local v69 = u50
                                u50 = u50 + 1
                                v67.playbackSpeedMultiplier = v69 / 50 + 1
                                v66:playSound(v65, v67)
                            end
                        end
                    end)
                end)
            end
        end
    end)
    u22("LobbyBabyPenguin", function(u70) --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u9
            [3] = u31
            [4] = u12
            [5] = u16
            [6] = u8
            [7] = u33
        --]]
        local u71 = u24:getEntity(u70)
        local u72 = u70.PrimaryPart
        if u72 ~= nil then
            u72 = u72.Position
        end
        if u72 then
            u9:playSound(u31.PENGUIN_SQUAWK_1, {
                ["position"] = u72
            })
        end
        u12("Highlight", {
            ["Name"] = "PenguinHighlight",
            ["FillTransparency"] = 0.7,
            ["OutlineTransparency"] = 0.2,
            ["FillColor"] = Color3.fromRGB(255, 61, 0),
            ["OutlineColor"] = Color3.fromRGB(255, 0, 0),
            ["Parent"] = u70,
            ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
        })
        task.spawn(function() --[[ Line: 209 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u70
                [3] = u16
                [4] = u9
                [5] = u8
                [6] = u33
                [7] = u72
            --]]
            while true do
                local v73 = task.wait(math.random(5, 10))
                if v73 == 0 or (v73 ~= v73 or not v73) then
                    break
                end
                local v74 = u71
                if v74 ~= nil then
                    v74 = v74:isDead()
                end
                if v74 or (u70.Parent ~= u16 and true or not u71) then
                    break
                end
                local v75 = u33
                local v76 = {
                    ["position"] = u72
                }
                u9:playSound(u8.fromList(unpack(v75)), v76)
            end
        end)
    end)
    u30.Client:Get("PenguinCaptured"):Connect(function(p77) --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u9
            [3] = u8
            [4] = u34
            [5] = u31
            [6] = u4
            [7] = u21
            [8] = u20
            [9] = u12
            [10] = u5
        --]]
        local v78 = u15.Assets.Effects.PenguinWebEffect:Clone()
        local v79 = p77.penguinModel.PrimaryPart
        if v79 ~= nil then
            v79 = v79.Position
        end
        if not v79 then
            return nil
        end
        local v80 = u34
        u9:playSound(u8.fromList(unpack(v80)), {
            ["position"] = v79
        })
        u9:playSound(u31.WEB_CAUGHT, {
            ["position"] = v79
        })
        v78.Position = v79
        v78.Parent = p77.penguinModel
        u4:playAnimation(p77.penguinModel, u21:getAssetId(u20.PENGUIN_IDLE_2), {
            ["looped"] = true
        })
        local v81 = u12
        local v82 = {
            ["StudsOffset"] = Vector3.new(0, 3, 0),
            ["Brightness"] = 1.5,
            ["ResetOnSpawn"] = false,
            ["Size"] = UDim2.new(4, 20, 4, 20),
            ["Parent"] = p77.penguinModel.PrimaryPart,
            ["Children"] = { u12("TextLabel", {
                    ["Name"] = "Name",
                    ["TextSize"] = 14,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 10,
                    ["Text"] = "Caught by " .. p77.player.Name,
                    ["Size"] = UDim2.fromScale(1, 0.25),
                    ["TextColor3"] = u5.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Top,
                    ["Font"] = Enum.Font.Arial
                }) }
        }
        v81("BillboardGui", v82)
    end)
end
u35.playEffect = v1.async(function(p83, p84, u85, u86, p87, p88) --[[ Line: 277 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u32
        [3] = u7
        [4] = u17
        [5] = u11
    --]]
    local v89 = u16:GetServerTimeNow()
    if p88 == 0 or (p88 ~= p88 or not p88) then
        p88 = v89
    end
    local v90 = v89 - p88
    local v91 = u86()
    if not v91 then
        return false
    end
    local u92 = (v91 * CFrame.new(p83.random:NextNumber(u32.P1XRange.Min, u32.P1XRange.Max), p83.random:NextNumber(u32.P1YRange.Min, u32.P1YRange.Max), p83.random:NextNumber(u32.P1ZRange.Min, u32.P1ZRange.Max))):Lerp(v91, 0.5).Position
    local u93 = p84:Clone()
    for v94, v95 in u93:GetDescendants() do
        local _ = v94 - 1
        u7:setQueryIgnored(v95, true)
    end
    u93.Parent = u16
    u17(p87 - v90, u11, function(p96) --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u86
            [2] = u85
            [3] = u92
            [4] = u93
        --]]
        local v97 = u86()
        if v97 ~= nil then
            v97 = v97.Position
        end
        if not v97 then
            return nil
        end
        local v98 = u85:Lerp(u92, p96):Lerp(u92:Lerp(v97, p96), p96)
        u93:PivotTo(CFrame.new(v98) * CFrame.Angles(0, 6.283185307179586 * p96, 0))
    end, v90, 1):Wait()
    u93:Destroy()
    return true
end)
v10.CreateController(u35.new())
return nil