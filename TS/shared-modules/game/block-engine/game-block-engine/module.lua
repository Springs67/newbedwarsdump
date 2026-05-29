local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local v4 = v2.BlockEngineServerSyncEvents
local v5 = v2.BreakBlockDamageType
local u6 = v2.PrefabBlockHandler
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local v13 = v11.ReplicatedStorage
local v14 = v11.RunService
local u15 = v11.Workspace
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "custom-match", "custom-match-role")
local u18 = v17.CustomMatchRole
local u19 = v17.CustomMatchRoleAttribute
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local v21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta")
local u22 = v21.getItemSkinMeta
local u23 = v21.getItemSkins
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPlayerKitSkin
local v31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "barrier-block-handler").BarrierBlockHandler
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "beds-block-handler").BedBlockHandler
local v33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "bedwars-greedy-block-handler").BedwarsGreedyBlockHandler
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "black-market-shop-block-handler").BlackMarketShopBlockHandler
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "camera-turret-block-handler").CameraTurretBlockHandler
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "cannon-block-handler").CannonBlockHandler
local v37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "crop-block-handler").CropBlockHandler
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "cursed-coffin-handler").CursedCoffinHandler
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "diamond-capture-block-handler").DiamondCaptureBlockHandler
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "fire-sheep-statue-block-handler").FireSheepStatueBlockHandler
local v41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "glass-block-handler").GlassBlockHandler
local u42 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "grave-trap-block-handler").GraveTrapBlockHandler
local u43 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "grove-plant-handler").GrovePlantHandler
local u44 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "healing-fountain-block-handler").HealingFountainBlockHandler
local u45 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "huge-lucky-block-handler").HugeLuckyBlockHandler
local u46 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "jump-pad-handler").JumpPadBlockHandler
local u47 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "lightning-coil-block-handler").LightningCoilBlockHandler
local v48 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "magic-glass-handler").MagicGlassHandler
local u49 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "merchant-region-block-handler").MerchantRegionBlockHandler
local u50 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "ogbed-block-handler").OgBedBlockHandler
local u51 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "pinata-block-handler").PinataBlockHandler
local u52 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "pit-block-handler").PitBlockHandler
local u53 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "random-foliage-block-handler").RandomFoliageBlockHandler
local v54 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "rotatable-greedy-block-handler").RotatableGreedyBlockHandler
local v55 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "smoke-block-handler").SmokeBlockHandler
local u56 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "snow-cone-machine-block-handler").SnowConeMachineBlockHandler
local v57 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "stone-player-block-handler").StonePlayerBlockHandler
local u58 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "target-dummy-block-handler").TargetDummyBlockHandler
local u59 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "tesla-trap-block-handler").TeslaTrapBlockHandler
local u60 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "zipline-block-handler").ZiplineBlockHandler
for _, v61 in v8.values(u26) do
    local v62 = u25(v61)
    if v62.block then
        local v63 = {
            ["placeSound"] = function() --[[ Name: placeSound, Line 71 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u27
                --]]
                return { u7:createSound(u27.GENERIC_BLOCK_PLACE) }
            end,
            ["hitSound"] = function() --[[ Name: hitSound, Line 74 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u27
                --]]
                return { u7:createSound(u27.GENERIC_BLOCK_HIT) }
            end,
            ["breakType"] = v5.WOOD
        }
        v62.block = v8.assign(v63, v62.block)
        local v64 = false
        if v61 == u26.GLASS then
            u3:getHandlerRegistry():registerHandler(v41.new(v61, 1, v62.block))
        else
            local v65 = v61 == u26.PUMPKIN and true or v64
            local v66 = (v65 or v61 == u26.MELON) and true or v65
            if (v66 or v61 == u26.CHICKEN_EGG_BLOCK) and true or v66 or v61 == u26.CARROT then
                u3:getHandlerRegistry():registerHandler(v37.new(v61, 1, v62.block))
            elseif v61 == u26.SMOKE_BLOCK then
                u3:getHandlerRegistry():registerHandler(v55.new(v61, 1, v62.block))
            elseif v61 == u26.STONE_PLAYER_BLOCK then
                u3:getHandlerRegistry():registerHandler(v57.new(v61, 1, v62.block))
            elseif v61 == u26.BARRIER then
                u3:getHandlerRegistry():registerHandler(v31.new(v61, 1, v62.block))
            elseif v61 == u26.MAGIC_GLASS then
                u3:getHandlerRegistry():registerHandler(v48.new(v61, 1, v62.block))
            elseif v62.block.greedyMesh then
                if v62.block.greedyMesh.rotation then
                    u3:getHandlerRegistry():registerHandler(v54.new(v61, 1, v62.block))
                else
                    u3:getHandlerRegistry():registerHandler(v33.new(v61, 1, v62.block))
                end
            end
        end
    end
end
if v14:IsClient() then
    v10("BoolValue", {
        ["Name"] = "BlockHandlersReady",
        ["Value"] = true,
        ["Parent"] = u15
    })
end
u3:getBlockDamageHook():connect(function(p67) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u29
        [3] = u28
        [4] = u3
        [5] = u25
        [6] = u19
        [7] = u18
        [8] = u15
    --]]
    if p67.player.Character then
        if p67.player.Character:GetAttribute("AxolotlBreakSpeed") == true then
            p67.damage = p67.damage * u16.AXOLOTL.AXOLOTL_BREAK_SPEED_MULT
        end
        local v68 = u29:getStacks(p67.player.Character, u28.SNOW_CONE)
        if u16.SNOW_CONE_BLOCK_COST <= v68 then
            p67.damage = p67.damage * (u16.SNOW_CONE_BLOCK_BASE_DMG + u16.SNOW_CONE_BLOCK_STACK_BONUS * v68)
        end
        local v69 = u3:getStore():getBlockAt(p67.blockRef.blockPosition)
        if v69 then
            local v70 = u25(v69.Name)
            local v71 = v70.block
            if v71 ~= nil then
                v71 = v71.breakableOnlyByHosts
            end
            if v71 and (p67.player:GetAttribute(u19) ~= u18.HOST and p67.player:GetAttribute(u19) ~= u18.COHOST) then
                p67.damage = 0
                return nil
            end
            local v72 = v70.block
            if v72 ~= nil then
                v72 = v72.breakableOnlyByOwner
            end
            if v72 and v69:GetAttribute("PlacedByUserId") ~= p67.player.UserId then
                p67.damage = 0
                return nil
            end
            local v73 = v69:GetAttribute("BedShieldEndTime")
            if v73 ~= 0 and (v73 == v73 and v73) then
                v73 = u15:GetServerTimeNow() < v73
            end
            if v73 ~= 0 and (v73 == v73 and v73) then
                p67.damage = 0
                return nil
            end
        end
    end
end)
v4.PlaceBlock:connect(function(p74) --[[ Line: 179 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u23
        [3] = u30
        [4] = u24
        [5] = u22
    --]]
    if p74:isCancelled() then
        return nil
    end
    local u75 = p74:getBlockType()
    local v76 = u25(u75)
    local u77 = u23(u75)
    if not (v76 and (v76.block and u77)) then
        return nil
    end
    local v78 = p74:getPlayer()
    local u79 = v78 and u30(v78)
    if u79 then
        local v80 = u24[u79].itemSkins
        local v81
        if v80 == nil then
            v81 = v80
        else
            local function v86(p82) --[[ Line: 198 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u75
                    [3] = u77
                    [4] = u79
                --]]
                local v83 = u22(p82)
                local v84 = v83.itemType == u75
                if v84 then
                    v84 = u77
                    if v84 ~= nil then
                        v84 = table.find(v84, p82) ~= nil
                    end
                    if v84 then
                        local v85 = v83.skinTag
                        v84 = string.find(u79, v85) ~= nil
                    end
                end
                return v84
            end
            v81 = nil
            for v87, v88 in v80 do
                if v86(v88, v87 - 1, v80) == true then
                    v81 = v88
                    break
                end
            end
        end
        if v81 then
            p74:setData((table.find(u77, v81) or 0) - 1 + 1)
        end
    end
end)
v4.PlaceBlockComplete:connect(function(p89) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u12
    --]]
    local v90 = u25(p89.blockType)
    if not v90.block then
        return nil
    end
    if v90.block.canReplace then
        p89.blockInstance:SetAttribute("BlockEngine_Select_IgnorePlaceMode", true)
    end
    if v90.block.ignoreProjectileCollision then
        p89.blockInstance:SetAttribute("IgnoreProjectileCollision", true)
    end
    if v90.block.ignoreSwordRaycast then
        u12:AddTag(p89.blockInstance, "DontBlockSwordRaycast")
    end
    if v90.block.ignoreAbilityRaycast then
        u12:AddTag(p89.blockInstance, "DontBlockAbilityRaycast")
    end
end)
v4.PlaceBlockComplete:connect(function(p91) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u23
        [3] = u30
        [4] = u24
        [5] = u22
    --]]
    local v92 = p91.blockType
    local v93 = u25(v92)
    local v94 = u23(v92)
    if not (v93.block and v94) then
        return nil
    end
    local v95 = p91.player
    local v96 = v95 and u30(v95)
    if v96 then
        local v97 = u24[v96].itemSkins
        if v97 ~= nil then
            v97 = nil
            for v98, v99 in v97 do
                local _ = v98 - 1
                local v100 = u22(v99).itemType == v92
                if v100 then
                    if v94 == nil then
                        v100 = v94
                    else
                        v100 = table.find(v94, v99) ~= nil
                    end
                end
                if v100 == true then
                    v97 = v99
                    break
                end
            end
        end
        if v97 then
            p91.blockInstance:SetAttribute("ItemSkin", v97)
        end
    end
end)
u3:getBlockDamageHook():setPriority(v9.HIGH):connect(function(p101) --[[ Line: 301 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u3
        [3] = u25
    --]]
    local v102 = u20:getEntity(p101.player)
    if v102 then
        local v103 = v102:getInstance().HandInvItem.Value
        local v104 = v103 and u3:getStore():getBlockAt(p101.blockRef.blockPosition)
        if v104 then
            local v105 = u25(v103.Name)
            local v106 = u25(v104.Name)
            local v107 = v106.block
            if v107 ~= nil then
                v107 = v107.breakType
            end
            if v107 then
                local v108 = v105.breakBlock
                if v108 ~= nil then
                    v108 = v108[v106.block.breakType]
                end
                if v108 ~= nil then
                    p101.damage = v108
                end
            end
        end
    end
end)
u3:hookCreateSourceBlockHandler(function(p109, p110, p111) --[[ Line: 328 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u26
        [3] = u32
        [4] = u50
        [5] = u34
        [6] = u60
        [7] = u59
        [8] = u42
        [9] = u36
        [10] = u35
        [11] = u45
        [12] = u53
        [13] = u56
        [14] = u51
        [15] = u40
        [16] = u49
        [17] = u38
        [18] = u47
        [19] = u44
        [20] = u58
        [21] = u39
        [22] = u46
        [23] = u52
        [24] = u43
        [25] = u6
    --]]
    local v112 = u25(p109)
    if v112 == nil then
        return nil
    elseif v112.block == nil then
        warn("Failed to find block meta for source block: " .. p109)
        return nil
    elseif p109 == u26.BED then
        return u32.new(p109, p110, v112.block, p111)
    elseif p109 == u26.OG_BED then
        return u50.new(p109, p110, v112.block, p111)
    elseif p109 == u26.BLACK_MARKET_SHOP then
        return u34.new(p109, p110, v112.block, p111)
    elseif p109 == u26.ZIPLINE_BASE then
        return u60.new(p109, p110, v112.block, p111)
    elseif p109 == u26.TESLA_TRAP then
        return u59.new(p109, p110, v112.block, p111)
    else
        local _ = p109 == u26.CANNON
        if p109 == u26.GRAVE_TRAP then
            return u42.new(p109, p110, v112.block, p111)
        elseif p109 == u26.CANNON then
            return u36.new(p109, p110, v112.block, p111)
        elseif p109 == u26.CAMERA_TURRET then
            return u35.new(p109, p110, v112.block, p111)
        elseif p109 == u26.HUGE_LUCKY_BLOCK then
            return u45.new(p109, p110, v112.block, p111)
        elseif p109 == u26.FLOWER_PURPLE then
            return u53.new(p109, 1, v112.block, {
                "flower_purple",
                "flower_orange",
                "flower_pink",
                "flower_blue"
            })
        elseif p109 == u26.SMALL_BUSH then
            return u53.new(p109, 1, v112.block, { "small_bush" })
        elseif p109 == u26.LARGE_BUSH then
            return u53.new(p109, 1, v112.block, { "large_bush" })
        elseif p109 == u26.SNOW_CONE_MACHINE or p109 == u26.BROKEN_SNOW_CONE_MACHINE then
            return u56.new(p109, p110, v112.block, p111)
        elseif p109 == u26.PINATA then
            return u51.new(p109, p110, v112.block, p111)
        elseif p109 == u26.FIRE_SHEEP_STATUE then
            return u40.new(p109, p110, v112.block, p111)
        elseif p109 == u26.MERCHANT_REGION then
            return u49.new(p109, p110, v112.block, p111)
        elseif p109 == u26.CURSED_COFFIN then
            return u38.new(p109, p110, v112.block, p111)
        elseif p109 == u26.LIGHTNING_COIL then
            return u47.new(p109, p110, v112.block, p111)
        elseif p109 == u26.HEALING_FOUNTAIN then
            return u44.new(p109, p110, v112.block, p111)
        elseif p109 == u26.TARGET_DUMMY_TIER_1 or (p109 == u26.TARGET_DUMMY_TIER_2 or (p109 == u26.TARGET_DUMMY_TIER_3 or p109 == u26.TARGET_DUMMY_TIER_4)) then
            return u58.new(p109, p110, v112.block, p111)
        elseif p109 == u26.DIAMOND_CAPTURE_BLOCK then
            return u39.new(p109, p110, v112.block, p111)
        elseif p109 == u26.JUMP_PAD then
            return u46.new(p109, p110, v112.block, p111)
        elseif p109 == u26.PIT then
            return u52.new(p109, p110, v112.block, p111)
        elseif p109 == u26.SOULVINE_FLOWER or (p109 == u26.CRYSTALHEART_FLOWER or p109 == u26.TEARBLOOM_FLOWER) then
            return u43.new(p109, 1, v112.block, p111)
        else
            return u6.new(p109, p110, v112.block, p111)
        end
    end
end)
u3:watchSourceFolder(v13:WaitForChild("Assets"):WaitForChild("Blocks"))
return {}