local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ExpireList
local u5 = v3.GameQueryUtil
local u6 = v3.SoundManager
local u7 = v3.WatchCharacterAnimation
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.ReplicatedStorage
local u15 = v12.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u25 = Color3.fromRGB(237, 69, 41)
local u26 = Color3.new(0, 0, 0)
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "BobaBlasterController"
    end,
    ["__index"] = u16
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30, ...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p30, ...)
    p30.Name = "BobaBlasterController"
    p30.effectCooldown = {}
end
function u27.KnitStart(u31) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u21
        [3] = u11
        [4] = u15
        [5] = u5
        [6] = u24
        [7] = u25
        [8] = u26
        [9] = u6
        [10] = u22
        [11] = u7
        [12] = u18
        [13] = u17
        [14] = u19
        [15] = u2
        [16] = u4
    --]]
    u16.KnitStart(u31)
    u21.Client:OnEvent("BobaStickEvent", function(p32) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u15
            [3] = u5
            [4] = u24
            [5] = u25
            [6] = u26
            [7] = u6
            [8] = u22
            [9] = u31
        --]]
        local v33 = u11("Part", {
            ["Name"] = "BobaPearl",
            ["Transparency"] = 0.5,
            ["Size"] = Vector3.new(1, 1, 1),
            ["CanQuery"] = false,
            ["CanCollide"] = false,
            ["Position"] = p32.position,
            ["Color"] = Color3.fromRGB(0, 0, 0),
            ["Material"] = Enum.Material.Neon,
            ["Shape"] = Enum.PartType.Ball,
            ["Parent"] = u15
        })
        if p32.hitEntity then
            v33.Parent = p32.hitEntity
        end
        if p32.hitEntity then
            local v34 = RaycastParams.new()
            local v35 = {}
            local v36 = #v35
            local v37 = 0
            local v38 = {}
            for v39, v40 in p32.hitEntity:GetChildren() do
                local _ = v39 - 1
                if v40.Name ~= "BobaPearl" == true then
                    v37 = v37 + 1
                    v38[v37] = v40
                end
            end
            table.move(v38, 1, #v38, v36 + 1, v35)
            v34.FilterDescendantsInstances = v35
            v34.FilterType = Enum.RaycastFilterType.Whitelist
            local v41 = u5:raycast(v33.Position, p32.hitPart.Position - v33.Position, v34)
            local v42
            if v41 == nil then
                v42 = v41
            else
                v42 = v41.Position
            end
            if v42 then
                local v43 = v41.Position
                local v44 = v41.Position
                local v45 = v41.Normal
                v33.CFrame = CFrame.new(v43, v44 + v45)
            end
        end
        u24:weldParts(p32.hitPart, v33)
        local v46 = time()
        local v47 = 0.22
        local v48 = false
        while time() - v46 < 3 do
            v47 = v47 - 0.007
            local v49
            if v48 then
                v49 = u25
            else
                v49 = u26
            end
            v33.Color = v49
            v33.Transparency = v48 and 0 or 0.5
            local v50
            if v48 then
                v50 = Enum.Material.Neon
            else
                v50 = Enum.Material.Glass
            end
            v33.Material = v50
            if v48 then
                u6:playSound(u22.BEEPING, {
                    ["rollOffMaxDistance"] = 45,
                    ["volumeMultiplier"] = 0.25,
                    ["position"] = v33.Position
                })
            end
            task.wait(v47)
            v48 = not v48
        end
        u31:playEffect(v33.CFrame)
        v33:Destroy()
    end)
    u7({ u18:getAssetId(u17.BOBA_BLASTER_FIRE) }, function(p51, _) --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u2
            [3] = u31
            [4] = u4
        --]]
        local v52 = p51.Character
        if not v52 then
            return nil
        end
        local v53 = u19.getInventory(p51).hand
        if v53 ~= nil then
            v53 = v53.tool
        end
        if v53 then
            local v54 = u2.getOrCreate(u31.effectCooldown, p51.UserId, u4.new(0.35))
            if #v54:getValues() >= 1 then
                return nil
            end
            v54:add(math.random())
            u31:playBlastEffect(v52)
        end
    end)
end
function u27.playEffect(_, p55) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u22
        [3] = u14
        [4] = u15
        [5] = u23
    --]]
    u6:playSound(u22.GOO_SPLAT, {
        ["rollOffMaxDistance"] = 45,
        ["position"] = p55.Position
    })
    u6:playSound(u22.FIREWORK_EXPLODE_1, {
        ["rollOffMaxDistance"] = 45,
        ["volumeMultiplier"] = 0.1,
        ["position"] = p55.Position
    })
    local v56 = u14.Assets.Effects.BobaPearlPop:Clone()
    v56.CFrame = p55
    v56.Parent = u15
    u23:playEffects({ v56 }, nil, {
        ["destroyAfterSec"] = 1,
        ["sizeMultiplier"] = 1.4
    })
end
function u27.playBlastEffect(_, p57) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u10
        [4] = u20
        [5] = u23
    --]]
    local v58 = u15.CurrentCamera
    if v58 ~= nil then
        v58 = v58.CFrame.Position
    end
    if not v58 or (p57:GetPrimaryPartCFrame().Position - v58).Magnitude > 300 then
        return nil
    end
    if p57 == u13.LocalPlayer.Character and u10.Controllers.ViewmodelController:isVisible() then
        p57 = u10.Controllers.ViewmodelController:getViewModel() or p57
    end
    local v59 = p57:FindFirstChild(u20.BOBA_BLASTER)
    if not v59 then
        return nil
    end
    u23:playEffects(v59:GetDescendants(), nil)
end
v9.CreateController(u27.new())
return nil