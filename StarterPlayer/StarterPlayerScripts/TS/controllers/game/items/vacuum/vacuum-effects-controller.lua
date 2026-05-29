local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCharacterAnimation
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.TweenService
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "VacuumEffectsController"
    end,
    ["__index"] = u10
})
u18.__index = u18
function u18.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21, ...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p21, ...)
    p21.Name = "VacuumEffectsController"
    p21.fullBagPlayers = {}
end
function u18.KnitStart(u22) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u12
        [4] = u11
        [5] = u14
        [6] = u1
        [7] = u13
        [8] = u6
        [9] = u16
        [10] = u3
        [11] = u17
        [12] = u8
        [13] = u9
        [14] = u15
    --]]
    u10.KnitStart(u22)
    u4({ u12:getAssetId(u11.VACUUM_SUCK), u12:getAssetId(u11.VACUUM_GHOST_CAPTURED), u12:getAssetId(u11.VACUUM_LAUNCH) }, function(p23, p24) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u1
            [3] = u13
            [4] = u12
            [5] = u11
            [6] = u6
            [7] = u16
            [8] = u3
            [9] = u17
            [10] = u8
            [11] = u9
            [12] = u15
            [13] = u22
        --]]
        local v25 = p23.Character
        if not v25 then
            return nil
        end
        local v26 = u14:getEntity(p23)
        if not (v26 and u1.instanceof(v26, u13)) then
            return nil
        end
        local v27 = p24.Animation
        if v27 ~= nil then
            v27 = v27.AnimationId
        end
        if v27 == u12:getAssetId(u11.VACUUM_SUCK) then
            local u28 = u6.new()
            local v29 = v26:getHandItemInstanceFromCharacter()
            local v30
            if v29 then
                local v31
                if v29 == nil then
                    v31 = v29
                else
                    v31 = v29.Name
                end
                v30 = v31 == u16.VACUUM
            else
                v30 = v29
            end
            if v30 then
                local v32 = u3
                local v33 = u17.GHOST_VACUUM_SUCKING_LOOP
                local v34 = {}
                local v35
                if p23 == u8.LocalPlayer then
                    v35 = nil
                else
                    v35 = v25:GetPivot().Position
                end
                v34.position = v35
                u28:GiveTask((v32:playSound(v33, v34)))
                local v36 = v29:GetDescendants()
                local function v38(u37) --[[ Line: 75 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u28
                    --]]
                    if u37:IsA("ParticleEmitter") then
                        u37.TimeScale = 0.35
                        u9:Create(u37, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                            ["TimeScale"] = 1
                        })
                        u37.Enabled = true
                        u28:GiveTask(function() --[[ Line: 82 ]]
                            --[[
                            Upvalues:
                                [1] = u37
                            --]]
                            u37.Enabled = false
                        end)
                    end
                end
                for v39, v40 in v36 do
                    v38(v40, v39 - 1, v36)
                end
                p24.Destroying:Connect(function() --[[ Line: 90 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    u28:Destroy()
                end)
            end
        end
        if v27 == u12:getAssetId(u11.VACUUM_GHOST_CAPTURED) then
            local v41 = u3
            local v42 = u17.GHOST_VACUUM_CATCH
            local v43 = {}
            local v44
            if p23 == u8.LocalPlayer then
                v44 = nil
            else
                v44 = v25:GetPrimaryPartCFrame().Position
            end
            v43.position = v44
            v41:playSound(v42, v43)
            local v45 = u15.getInventory(p23).hand
            local v46
            if v45 == nil then
                v46 = v45
            else
                v46 = v45.tool
            end
            if v46 then
                v46 = v45.itemType == u16.VACUUM
            end
            if v46 then
                local v47 = v45.tool
                v47.Handle.Empty.Transparency = 1
                v47.Handle.Full.Transparency = 0
                u22.fullBagPlayers[p23.UserId] = true
            end
        end
        if v27 == u12:getAssetId(u11.VACUUM_LAUNCH) then
            local v48 = u15.getInventory(p23).hand
            local v49
            if v48 == nil then
                v49 = v48
            else
                v49 = v48.tool
            end
            if v49 then
                v49 = v48.itemType == u16.VACUUM
            end
            if v49 then
                local v50 = v48.tool
                v50.Handle.Empty.Transparency = 0
                v50.Handle.Full.Transparency = 1
                u22.fullBagPlayers[p23.UserId] = nil
            end
        end
    end)
end
v5.CreateController(u18.new())
return nil