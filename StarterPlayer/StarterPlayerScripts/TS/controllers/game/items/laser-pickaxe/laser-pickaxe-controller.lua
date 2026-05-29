local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.BreakBlockDamageType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u7 = v6.DeviceUtil
local u8 = v6.GameQueryUtil
local u9 = v6.RandomUtil
local u10 = v6.SoundManager
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.ReplicatedStorage
local u17 = v14.RunService
local u18 = v14.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "LaserPickaxeController"
    end,
    ["__index"] = u20
})
u29.__index = u29
function u29.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.constructor(p32)
    p32.Name = "LaserPickaxe"
    p32.laserMaidMap = {}
    p32.laserOnMap = {}
    p32.laserOriginMap = {}
    p32.laserEndMap = {}
    p32.lastBlockDamageTimeMap = {}
    p32.damageBlockPositionMap = {}
    p32.shouldEmitPulseMap = {}
end
function u29.KnitStart(u33) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u11
        [3] = u25
        [4] = u28
        [5] = u27
        [6] = u23
        [7] = u15
        [8] = u22
        [9] = u21
        [10] = u19
        [11] = u24
        [12] = u3
        [13] = u18
        [14] = u8
        [15] = u26
        [16] = u5
        [17] = u12
        [18] = u4
        [19] = u10
        [20] = u9
    --]]
    u20.KnitStart(u33)
    u11.Controllers.PreloadController:preloadForItemType(u25.LASER_PICKAXE, {
        ["sounds"] = {
            u28.LASER_PICKAXE_LOOP,
            u28.LASER_PICKAXE_CONTACT_LOOP,
            u28.LASER_PICKAXE_STONE_BREAK_1,
            u28.LASER_PICKAXE_STONE_BREAK_2,
            u28.LASER_PICKAXE_STONE_BREAK_3,
            u28.LASER_PICKAXE_STONE_BREAK_4,
            u28.LASER_PICKAXE_WOOD_BREAK_1,
            u28.LASER_PICKAXE_WOOD_BREAK_2,
            u28.LASER_PICKAXE_WOOD_BREAK_3,
            u28.LASER_PICKAXE_WOOD_BREAK_4,
            u28.LASER_PICKAXE_WOOL_BREAK_1,
            u28.LASER_PICKAXE_WOOL_BREAK_2,
            u28.LASER_PICKAXE_WOOL_BREAK_3,
            u28.LASER_PICKAXE_WOOL_BREAK_4
        }
    })
    u27.BeforeAnimationPlayEvent:connect(function(p34) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u15
            [3] = u25
            [4] = u22
            [5] = u21
        --]]
        local v35 = u23.getInventory(u15.LocalPlayer).hand
        if v35 ~= nil then
            v35 = v35.itemType
        end
        if v35 ~= u25.LASER_PICKAXE then
            return nil
        end
        local v36 = {
            u22:getAssetId(u21.BREAK_BLOCK),
            u22:getAssetId(u21.PUNCH),
            u22:getAssetId(u21.FP_USE_ITEM),
            u22:getAssetId(u21.FP_WALK)
        }
        local v37 = p34.animationAssetId
        if table.find(v36, v37) ~= nil then
            p34:setCancelled(true)
            return nil
        end
    end)
    u19.DamageBlock:connect(function(p38) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u15
            [3] = u33
            [4] = u24
            [5] = u3
            [6] = u18
            [7] = u8
            [8] = u26
        --]]
        local v39 = u23.getInventory(u15.LocalPlayer).hand
        if not (v39 and u33:isRelevantItem(v39)) then
            return nil
        end
        local v40 = u24(v39.itemType)
        local v41 = not v40
        if not v41 then
            local v42 = v40.breakBlockRange
            if v42 == 0 then
                v42 = false
            elseif v42 ~= v42 then
                v42 = false
            end
            v41 = not v42
        end
        if v41 then
            return nil
        end
        local v43 = u3:getWorldPosition(p38.blockPosition)
        local v44 = u15.LocalPlayer.Character
        if not v44 then
            return nil
        end
        if not u18.CurrentCamera then
            return nil
        end
        local v45 = RaycastParams.new()
        v45.FilterType = Enum.RaycastFilterType.Blacklist
        v45.FilterDescendantsInstances = { v44 }
        local v46 = v40.breakBlockRange
        local v47 = u15.LocalPlayer:GetMouse().UnitRay
        local v48 = u8:raycast(v47.Origin, v47.Direction * v46, v45)
        local v49 = u26.Client:Get("LaserPickaxeStartSpinningFromClient")
        local v50 = {
            ["laserIsOn"] = true
        }
        if v48 ~= nil then
            v48 = v48.Position
        end
        if v48 ~= nil then
            v43 = v48
        end
        v50.targetBlockPos = v43
        v49:SendToServer(v50)
    end)
    u26.Client:Get("LaserPickaxeStartSpinningFromServer"):Connect(function(u51) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u5
            [3] = u12
        --]]
        if u51.laserIsOn and u51.laserEndPoint then
            u33.damageBlockPositionMap[u51.player] = u51.laserEndPoint
            local v52 = u33.laserEndMap[u51.player]
            if v52 ~= nil then
                v52:PivotTo(CFrame.new(u51.laserEndPoint))
            end
            u33.lastBlockDamageTimeMap[u51.player] = time()
            u33.shouldEmitPulseMap[u51.player] = true
        end
        if u33.laserOnMap[u51.player] ~= u51.laserIsOn then
            if u51.laserIsOn then
                u33.laserOnMap[u51.player] = true
                local v53 = u5.getOrCreate(u33.laserMaidMap, u51.player, u12.new())
                u33.laserMaidMap[u51.player] = v53
                v53:GiveTask(function() --[[ Line: 156 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u51
                    --]]
                    u33.laserOnMap[u51.player] = false
                end)
                u33.lastBlockDamageTimeMap[u51.player] = time()
                u33:startLaser(u51.player)
                return
            end
            local v54 = u33.laserMaidMap[u51.player]
            if v54 ~= nil then
                v54:DoCleaning()
            end
        end
    end)
    u19.DamageBlockEffect:connect(function(p55) --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u33
            [3] = u24
            [4] = u4
            [5] = u10
            [6] = u9
            [7] = u28
        --]]
        if p55.fromPlayer then
            local v56 = u23.getInventory(p55.fromPlayer).hand
            if v56 and u33:isRelevantItem(v56) then
                local v57 = u24(p55.blockType)
                if v57 ~= nil then
                    v57 = v57.block
                    if v57 ~= nil then
                        v57 = v57.breakType
                    end
                end
                if v57 then
                    if v57 == u4.STONE then
                        local v58 = u10
                        local v59 = u9.fromList
                        local v60 = {
                            u28.LASER_PICKAXE_STONE_BREAK_1,
                            u28.LASER_PICKAXE_STONE_BREAK_2,
                            u28.LASER_PICKAXE_STONE_BREAK_3,
                            u28.LASER_PICKAXE_STONE_BREAK_4
                        }
                        p55.sound = v58:createSound(v59(unpack(v60)))
                        return
                    elseif v57 == u4.WOOD then
                        local v61 = u10
                        local v62 = u9.fromList
                        local v63 = {
                            u28.LASER_PICKAXE_WOOD_BREAK_1,
                            u28.LASER_PICKAXE_WOOD_BREAK_2,
                            u28.LASER_PICKAXE_WOOD_BREAK_3,
                            u28.LASER_PICKAXE_WOOD_BREAK_4
                        }
                        p55.sound = v61:createSound(v62(unpack(v63)))
                        return
                    elseif v57 == u4.WOOL then
                        local v64 = u10
                        local v65 = u9.fromList
                        local v66 = {
                            u28.LASER_PICKAXE_WOOL_BREAK_1,
                            u28.LASER_PICKAXE_WOOL_BREAK_2,
                            u28.LASER_PICKAXE_WOOL_BREAK_3,
                            u28.LASER_PICKAXE_WOOL_BREAK_4
                        }
                        p55.sound = v64:createSound(v65(unpack(v66)))
                    end
                else
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
end
function u29.isRelevantItem(_, p67) --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    return p67.itemType == u25.LASER_PICKAXE
end
function u29.onEnable(p68, _, _) --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u15
        [3] = u21
    --]]
    p68:setupYield(function() --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u15
            [3] = u21
        --]]
        local u69 = u22:playAnimation(u15.LocalPlayer, u21.FLAMETHROWER_IDLE, {
            ["looped"] = true
        })
        return function() --[[ Line: 220 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            local v70 = u69
            if v70 ~= nil then
                v70:Stop()
            end
        end
    end)
end
function u29.onDisable(_) --[[ Line: 228 ]] end
function u29.startLaser(u71, u72) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u12
        [3] = u18
        [4] = u13
        [5] = u16
        [6] = u8
        [7] = u7
        [8] = u28
        [9] = u17
    --]]
    local v73 = u72.Character
    if v73 ~= nil then
        v73 = v73.PrimaryPart
    end
    if not v73 then
        return nil
    end
    local u74 = u5.getOrCreate(u71.laserMaidMap, u72, u12.new())
    local v75 = {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = false,
        ["Parent"] = u18
    }
    u71.laserOriginMap[u72] = u13("Part", v75)
    local u76 = u16.Assets.Effects.LaserPickaxeHit:Clone()
    u76.Parent = u18
    u71.laserEndMap[u72] = u76
    u74:GiveTask(u76)
    local u77 = u71.laserOriginMap[u72]
    if not u77 then
        return nil
    end
    local u78 = u71.laserEndMap[u72]
    if not u78 then
        return nil
    end
    local v79 = nil
    for v80, v81 in u72.Character:GetDescendants() do
        local _ = v80 - 1
        if v81.Name == "LaserPickaxeBeamStartPart" == true then
            v79 = v81
            break
        end
    end
    if v79 == nil then
        v79 = u72.Character.PrimaryPart
    end
    u77:PivotTo(v79:GetPivot())
    local v82 = u71.damageBlockPositionMap[u72]
    if v82 then
        u78:PivotTo(CFrame.new(v82))
    end
    local v83 = u13("WeldConstraint", {
        ["Part0"] = u77,
        ["Part1"] = v79,
        ["Parent"] = u72.Character
    })
    u71.laserMaidMap[u72] = u74
    u74:GiveTask(v83)
    u8:setQueryIgnored(u77, true)
    u8:setQueryIgnored(u78, true)
    u78.Transparency = 1
    local v84 = u13("Attachment", {
        ["Parent"] = u77
    })
    local v85 = u13("Attachment", {
        ["Parent"] = u78
    })
    local v86 = u7.isMobileControls() and 3 or 1
    local u87 = u13("Beam", {
        ["FaceCamera"] = true,
        ["Segments"] = 10,
        ["Brightness"] = 5,
        ["LightEmission"] = 1,
        ["Texture"] = "rbxassetid://10525762007",
        ["TextureSpeed"] = 5,
        ["TextureLength"] = 0.8,
        ["Attachment0"] = v84,
        ["Attachment1"] = v85,
        ["Color"] = ColorSequence.new(Color3.fromRGB(255, 107, 38)),
        ["Transparency"] = NumberSequence.new(0),
        ["Width0"] = v86 * 0.5,
        ["Width1"] = v86 * 0.5,
        ["Parent"] = u18
    })
    u74:GiveTask(u87)
    local v88 = u13("Sound", {
        ["Name"] = "LaserSound",
        ["Looped"] = true,
        ["Volume"] = 0.3,
        ["RollOffMaxDistance"] = 25,
        ["SoundId"] = u28.LASER_PICKAXE_LOOP,
        ["Parent"] = u72.Character.PrimaryPart
    })
    v88:Play()
    u74:GiveTask(v88)
    local v89 = u13("Sound", {
        ["Name"] = "LaserContactSound",
        ["Looped"] = true,
        ["Volume"] = 0.2,
        ["RollOffMaxDistance"] = 25,
        ["SoundId"] = u28.LASER_PICKAXE_LOOP,
        ["Parent"] = u76
    })
    v89:Play()
    u74:GiveTask(v89)
    u74:GiveTask((u17.Heartbeat:Connect(function() --[[ Line: 348 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u72
            [3] = u77
            [4] = u78
            [5] = u87
            [6] = u76
            [7] = u74
        --]]
        local v90 = u71.damageBlockPositionMap[u72]
        local v91 = u77
        if v91 ~= nil then
            v91 = v91.Position
        end
        if not (v91 and (u78 and v90)) then
            u87:Destroy()
            u76:Destroy()
            return nil
        end
        local v92 = u78
        if v92 ~= nil then
            v92:PivotTo(CFrame.new(v90))
        end
        if u71.shouldEmitPulseMap[u72] then
            u76.Attachment.Specs:Emit(10)
            u71.shouldEmitPulseMap[u72] = false
        end
        local v93 = u71.lastBlockDamageTimeMap[u72]
        local v94 = (v93 == 0 or (v93 ~= v93 or not v93)) and 0 or v93
        if time() - v94 > 0.25 then
            u74:DoCleaning()
        end
    end)))
end
u11.CreateController(u29.new())
return nil