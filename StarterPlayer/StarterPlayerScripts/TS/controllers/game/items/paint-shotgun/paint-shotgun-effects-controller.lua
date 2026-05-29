local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ExpireList
local u5 = v3.SoundManager
local u6 = v3.WatchCharacterAnimation
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.RunService
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "paint-shotgun", "paint-shotgun-constants").PaintShotgunConstants
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "PaintShotgunEffectsController"
    end,
    ["__index"] = u14
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p26)
    p26.Name = "PaintShotgunEffectsController"
    p26.hitMarkerOverflow = 0
    p26.effectCooldown = {}
end
function u23.KnitStart(u27) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u17
        [4] = u16
        [5] = u11
        [6] = u19
        [7] = u2
        [8] = u4
        [9] = u18
        [10] = u15
        [11] = u12
        [12] = u5
        [13] = u21
    --]]
    u14.KnitStart(u27)
    u6({ u17:getAssetId(u16.PAINT_SHOTGUN_SHOOT) }, function(p28, _) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u19
            [3] = u2
            [4] = u27
            [5] = u4
            [6] = u18
        --]]
        local v29 = p28.Character
        if not v29 then
            return nil
        end
        if p28 == u11.LocalPlayer then
            return nil
        end
        local v30 = u19.getInventory(p28).hand
        if v30 ~= nil then
            v30 = v30.tool
        end
        if v30 then
            local v31 = u2.getOrCreate(u27.effectCooldown, p28.UserId, u4.new(u18.COOLDOWN * 0.9))
            if #v31:getValues() >= 2 then
                return nil
            end
            v31:add(math.random())
            u27:playShotgunEffect(v29)
        end
    end)
    u15.On(function(p32, _, _, _, p33, _, _, p34, _, _, _, _, _, _) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u27
        --]]
        if p32.PrimaryPart and p33 then
            local v35 = u11:GetPlayerFromCharacter(p33) == u11.LocalPlayer
            if v35 then
                if p34 ~= nil then
                    p34 = p34.paintBlast
                end
            else
                p34 = v35
            end
            if p34 then
                local v36 = u27
                local v37 = u27.hitMarkerOverflow + 1
                v36.hitMarkerOverflow = math.min(v37, 3)
            end
        end
    end)
    local u38 = 0
    u12.Heartbeat:Connect(function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u27
            [3] = u5
            [4] = u21
        --]]
        if tick() - u38 < 0.1 then
            return nil
        end
        if u27.hitMarkerOverflow > 0 then
            local v39 = u27
            v39.hitMarkerOverflow = v39.hitMarkerOverflow - 1
            u5:playSound(u21.ARROW_HIT, {
                ["volumeMultiplier"] = 0.2
            })
            u38 = tick()
        end
    end)
end
function u23.playShotgunEffect(_, p40) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
        [3] = u21
        [4] = u11
        [5] = u9
        [6] = u20
        [7] = u22
    --]]
    local v41 = u13.CurrentCamera
    if v41 ~= nil then
        v41 = v41.CFrame.Position
    end
    if not v41 or (p40:GetPrimaryPartCFrame().Position - v41).Magnitude > 300 then
        return nil
    end
    local v42 = u5
    local v43 = u21.PAINT_SHOTGUN_BLAST
    local v44 = {}
    local v45
    if p40 == u11.LocalPlayer.Character then
        v45 = nil
    else
        v45 = p40:GetPrimaryPartCFrame().Position
    end
    v44.position = v45
    v42:playSound(v43, v44)
    if p40 == u11.LocalPlayer.Character and u9.Controllers.ViewmodelController:isVisible() then
        p40 = u9.Controllers.ViewmodelController:getViewModel() or p40
    end
    local v46 = p40:FindFirstChild(u20.PAINT_SHOTGUN)
    if not v46 then
        return nil
    end
    u22:playEffects(v46:GetDescendants(), nil)
end
v8.CreateController(u23.new())
return nil