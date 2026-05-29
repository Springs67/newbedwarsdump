local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.ReplicatedStorage
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ninja", "ninja-kit-util").NinjaKitUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = { v13.NINJA_CHAKRAM_HIT_BLOCK_1, v13.NINJA_CHAKRAM_HIT_BLOCK_2, v13.NINJA_CHAKRAM_HIT_BLOCK_3 }
local u16 = { v13.NINJA_CHAKRAM_HIT_PLAYER_1, v13.NINJA_CHAKRAM_HIT_PLAYER_2, v13.NINJA_CHAKRAM_HIT_PLAYER_3 }
local u17 = { v13.NINJA_CHAKRAM_RETURN_1, v13.NINJA_CHAKRAM_RETURN_2, v13.NINJA_CHAKRAM_RETURN_3 }
local u18 = { v13.NINJA_CHAKRAM_THROW_1, v13.NINJA_CHAKRAM_THROW_2, v13.NINJA_CHAKRAM_THROW_3 }
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "ChakramController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p22)
    p22.Name = "ChakramController"
    p22.chakramIsLaunched = false
end
function u19.KnitStart(u23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u15
        [4] = u16
        [5] = u17
        [6] = u18
        [7] = u9
        [8] = u11
        [9] = u2
        [10] = u7
        [11] = u8
        [12] = u14
        [13] = u4
        [14] = u12
        [15] = u6
    --]]
    u10.KnitStart(u23)
    local v24 = u3.Controllers.PreloadController
    local v25 = {}
    local v26 = {}
    local v27 = #v26
    local v28 = #u15
    table.move(u15, 1, v28, v27 + 1, v26)
    local v29 = v27 + v28
    local v30 = #u16
    table.move(u16, 1, v30, v29 + 1, v26)
    local v31 = v29 + v30
    local v32 = #u17
    table.move(u17, 1, v32, v31 + 1, v26)
    local v33 = v31 + v32
    table.move(u18, 1, #u18, v33 + 1, v26)
    v25.sounds = v26
    v24:runPreload(v25)
    u9.ProjectileHit:connect(function(p34) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u2
            [3] = u15
            [4] = u7
            [5] = u8
            [6] = u14
        --]]
        if p34:isCancelled() then
            return nil
        end
        if not u11:isProjectileTypeChakram(p34.projectileType) then
            return nil
        end
        if p34.projectileModel:GetAttribute("ChakramHitBlock") then
            return nil
        end
        if p34.hitData.part and p34.hitData.part:GetAttribute("Block") then
            u2:playSound(u15[math.random(0, #u15 - 1) + 1], {
                ["position"] = p34.hitData.hitCFrame.Position
            })
            local u35 = u7.Assets.Effects.ChakramHitWallParticle:Clone()
            u35.Parent = u8
            u35:PivotTo(p34.hitData.hitCFrame)
            u14:playEffects({ u35 }, nil)
            task.delay(0.3, function() --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u35
                --]]
                u14:disableEffects({ u35 })
            end)
            task.delay(1, function() --[[ Line: 86 ]]
                --[[
                Upvalues:
                    [1] = u35
                --]]
                u35:Destroy()
            end)
            p34.projectileModel:SetAttribute("ChakramHitBlock", true)
        end
    end)
    u9.ProjectileLaunched:connect(function(p36) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        if not u11:isProjectileTypeChakram(p36.projectileType) then
            return nil
        end
        local v37 = p36.projectile.PrimaryPart
        if v37 ~= nil then
            v37 = v37:FindFirstChild("Trail")
        end
        if v37 then
            v37.Enabled = true
        end
    end)
    u9.BeginProjectileTargeting:setPriority(u4.HIGHEST):connect(function(p38) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u23
        --]]
        if not u11:isItemTypeChakram(p38.handItem.itemType) then
            return nil
        end
        if u23.chakramIsLaunched then
            p38:setCancelled(true)
            return nil
        end
    end)
    u12.Client:Get("NinjaSetChakramLaunchedState"):Connect(function(p39) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u23
            [3] = u2
            [4] = u18
            [5] = u17
        --]]
        if p39.player == u6.LocalPlayer then
            u23.chakramIsLaunched = p39.isLaunched
        end
        if p39.isLaunched then
            local v40 = p39.player.Character
            if v40 ~= nil then
                v40 = v40.PrimaryPart
            end
            if v40 then
                local v41 = u2
                local v42 = u18[math.random(0, #u18 - 1) + 1]
                local v43 = {}
                local v44 = p39.player.Character.PrimaryPart
                if v44 ~= nil then
                    v44 = v44.Position
                end
                v43.position = v44
                v41:playSound(v42, v43)
            end
        else
            local v45 = p39.player.Character
            if v45 ~= nil then
                v45 = v45.PrimaryPart
            end
            if v45 then
                local v46 = u2
                local v47 = u17[math.random(0, #u17 - 1) + 1]
                local v48 = {}
                local v49 = p39.player.Character.PrimaryPart
                if v49 ~= nil then
                    v49 = v49.Position
                end
                v48.position = v49
                v46:playSound(v47, v48)
            end
        end
        u23:setVisibilityOfThirdPersonChakram(p39.player, p39.isLaunched)
        if p39.player == u6.LocalPlayer then
            u23:setVisibilityOfFirstPersonChakram(p39.player, p39.isLaunched)
        end
    end)
end
function u19.setVisibilityOfThirdPersonChakram(p50, p51, p52) --[[ Line: 170 ]]
    local v53 = p50:getChakramChildPart(p51.Character)
    local v54 = v53 and v53:FindFirstChild("Handle")
    if v54 then
        v54.Transparency = p52 and 1 or 0
        local v55 = v54:FindFirstChild("Spikes")
        if v55 then
            v55.Transparency = p52 and 1 or 0
        end
        local v56 = v54:FindFirstChild("Trail")
        if v56 then
            v56.Enabled = not p52
        end
    end
end
function u19.setVisibilityOfFirstPersonChakram(p57, _, p58) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v59 = u8.CurrentCamera
    if v59 ~= nil then
        v59 = v59:FindFirstChild("Viewmodel")
    end
    if v59 then
        local v60 = p57:getChakramChildPart(v59)
        local v61 = v60 and v60:FindFirstChild("Handle")
        if v61 then
            v61.Transparency = p58 and 1 or 0
            local v62 = v61:FindFirstChild("Spikes")
            if v62 then
                v62.Transparency = p58 and 1 or 0
            end
            local v63 = v61:FindFirstChild("Trail")
            if v63 then
                v63.Enabled = not p58
            end
        end
    end
end
function u19.getChakramChildPart(_, p64) --[[ Line: 215 ]]
    if p64 then
        return p64:FindFirstChild("ninja_chakram") or p64:FindFirstChild("ninja_chakram_1") or p64:FindFirstChild("ninja_chakram_2") or p64:FindFirstChild("ninja_chakram_3") or p64:FindFirstChild("ninja_chakram_4")
    else
        return nil
    end
end
u3.CreateController(u19.new())
return nil