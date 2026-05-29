local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "ChickenController"
    end,
    ["__index"] = u12
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p23)
    p23.Name = "ChickenController"
end
function u20.KnitStart(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u11
        [3] = u14
        [4] = u13
        [5] = u6
        [6] = u9
        [7] = u15
        [8] = u19
        [9] = u3
        [10] = u18
        [11] = u17
        [12] = u10
        [13] = u4
        [14] = u7
        [15] = u16
    --]]
    u12.KnitStart(p24)
    u11.ProjectileLaunched:connect(function(p25) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u13
            [3] = u6
            [4] = u9
            [5] = u15
            [6] = u19
            [7] = u3
        --]]
        local v26 = p25.projectile
        if p25.projectileType ~= "deploy_chicken" then
            return nil
        end
        local v27 = v26:WaitForChild("AnimationController", 3)
        if v27 ~= nil then
            v27 = v27:WaitForChild("Animator", 3)
        end
        if not v27 then
            return nil
        end
        v27:LoadAnimation(u14:getAnimation(u13.CHICKEN_FLAP)):Play()
        local v28 = u15[u6.Controllers.KitController:getKitSkin(u9.LocalPlayer)].taliyah
        local v29 = u19.CHICKEN_DEPLOY
        local v30
        if v28 == nil then
            v30 = v28
        else
            v30 = v28.entity
            if v30 ~= nil then
                v30 = v30.sounds
                if v30 ~= nil then
                    v30 = v30.deploy
                end
            end
        end
        if v30 ~= "" and v30 then
            v29 = v28.entity.sounds.deploy
        end
        local v31 = u3:createSound(v29)
        if not v31 then
            return nil
        end
        v31.Looped = true
        v31.Parent = p25.projectile.PrimaryPart
        v31:Play()
    end)
    u18.Client:WaitFor("EntityDeathEvent"):andThen(function(p32) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u19
            [3] = u9
            [4] = u6
            [5] = u15
            [6] = u3
        --]]
        p32:Connect(function(p33) --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u19
                [3] = u9
                [4] = u6
                [5] = u15
                [6] = u3
            --]]
            if p33.entityInstance:GetAttribute("MonsterType") ~= u17.CHICKEN then
                return nil
            end
            local v34 = u19.CHICKEN_DEATH
            local v35 = p33.entityInstance:GetAttribute("PlacedByUserId")
            if v35 ~= 0 and (v35 == v35 and v35) then
                local v36 = u9:GetPlayerByUserId(v35)
                if v36 then
                    local v37 = u15[u6.Controllers.KitController:getKitSkin(v36)].taliyah
                    local v38
                    if v37 == nil then
                        v38 = v37
                    else
                        v38 = v37.entity
                        if v38 ~= nil then
                            v38 = v38.sounds
                            if v38 ~= nil then
                                v38 = v38.death
                            end
                        end
                    end
                    if v38 ~= "" and v38 then
                        v34 = v37.entity.sounds.death
                    end
                end
            end
            u3:playSound(v34, {
                ["position"] = p33.cframe.Position
            })
        end)
    end)
    u18.Client:Get("EntityDeathEvent"):Connect(function(p39) --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u19
            [3] = u10
            [4] = u6
            [5] = u15
            [6] = u3
        --]]
        if p39.entityInstance.Name ~= "EggEntity" then
            return nil
        end
        local v40 = p39.cframe.Position
        if p39.fromEntity and u9:GetPlayerFromCharacter(p39.fromEntity) == u9.LocalPlayer then
            v40 = nil
        end
        local v41 = u19.CHICKEN_EGG_CRACK
        local v42 = p39.entityInstance:GetAttribute("ReadyTime")
        if v42 ~= 0 and (v42 == v42 and v42) then
            v42 = v42 < u10:GetServerTimeNow()
        end
        if v42 ~= 0 and (v42 == v42 and v42) then
            v41 = u19.CHICKEN_DEATH
        end
        local v43 = p39.entityInstance:GetAttribute("PlacedByUserId")
        if v43 ~= 0 and (v43 == v43 and v43) then
            local v44 = u9:GetPlayerByUserId(v43)
            if v44 then
                local v45 = u15[u6.Controllers.KitController:getKitSkin(v44)].taliyah
                local v46
                if v45 == nil then
                    v46 = v45
                else
                    v46 = v45.entity
                    if v46 ~= nil then
                        v46 = v46.sounds
                        if v46 ~= nil then
                            v46 = v46.eggCrack
                        end
                    end
                end
                if v46 ~= "" and v46 then
                    v41 = v45.entity.sounds.eggCrack
                end
                local v47 = p39.entityInstance:GetAttribute("ReadyTime")
                if v47 ~= 0 and (v47 == v47 and v47) then
                    v47 = v47 < u10:GetServerTimeNow()
                end
                if v47 ~= 0 and (v47 == v47 and v47) then
                    local v48
                    if v45 == nil then
                        v48 = v45
                    else
                        v48 = v45.entity
                        if v48 ~= nil then
                            v48 = v48.sounds
                            if v48 ~= nil then
                                v48 = v48.death
                            end
                        end
                    end
                    if v48 ~= "" and v48 then
                        v41 = v45.entity.sounds.death
                    end
                end
            end
        end
        u3:playSound(v41, {
            ["position"] = v40
        })
        p39.noKillSound = true
    end)
    u4("Monster", function(u49) --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u19
            [3] = u9
            [4] = u6
            [5] = u15
            [6] = u7
        --]]
        if u49:GetAttribute("MonsterType") == u17.CHICKEN then
            local u50 = {
                u19.CHICKEN_WALK_1,
                u19.CHICKEN_WALK_2,
                u19.CHICKEN_WALK_3,
                u19.CHICKEN_WALK_4
            }
            local v51 = u49:GetAttribute("PlacedByUserId")
            if v51 ~= 0 and (v51 == v51 and v51) then
                local v52 = u9:GetPlayerByUserId(v51)
                if v52 then
                    local v53 = u15[u6.Controllers.KitController:getKitSkin(v52)].taliyah
                    local v54
                    if v53 == nil then
                        v54 = v53
                    else
                        v54 = v53.entity
                        if v54 ~= nil then
                            v54 = v54.sounds
                            if v54 ~= nil then
                                v54 = v54.walk
                            end
                        end
                    end
                    if v54 then
                        u50 = v53.entity.sounds.walk
                    end
                end
            end
            task.spawn(function() --[[ Line: 207 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u49
                    [3] = u50
                --]]
                local v55 = {
                    ["walk"] = u50,
                    ["run"] = u50
                }
                u7.Controllers.FootstepsController:hookCharacter(nil, u49, v55)
            end)
        end
    end)
    u4("HarvestableCrop", function(p56) --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u3
            [3] = u19
        --]]
        if p56.Name ~= u16.CHICKEN_EGG_BLOCK then
            return nil
        end
        local v57 = p56.Position
        if not v57 then
            return nil
        end
        u3:playSound(u19.CHICKEN_EGG_CRACK, {
            ["position"] = v57
        })
    end)
end
u6.CreateController(u20.new())
return nil