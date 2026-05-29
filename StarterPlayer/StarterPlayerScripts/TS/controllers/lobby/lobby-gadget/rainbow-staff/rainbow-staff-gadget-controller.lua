local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "sound", "sound-manager").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.TweenService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "RainbowStaffGadgetController"
    end,
    ["__index"] = u8
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p16)
    p16.Name = "RainbowStaffGadgetController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u6
        [4] = u7
        [5] = u2
        [6] = u12
        [7] = u5
    --]]
    u8.KnitStart(p17)
    u11.Client:OnEvent("RainbowBridgeCreate", function(u18) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u7
            [3] = u2
            [4] = u12
            [5] = u5
        --]]
        local v19 = u6.Assets.Misc.RainbowBridge:Clone():GetChildren()
        local function v22(p20) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u7
            --]]
            p20.Parent = u18.part
            if p20:IsA("Decal") then
                local v21 = p20.Transparency
                p20.Transparency = 1
                u7:Create(p20, TweenInfo.new(1), {
                    ["Transparency"] = v21
                }):Play()
            end
            if p20:IsA("ParticleEmitter") then
                p20.Enabled = u18.usable
            end
        end
        for v23, v24 in v19 do
            v22(v24, v23 - 1, v19)
        end
        local v25 = u18.part.Transparency
        u18.part.Transparency = 1
        u7:Create(u18.part, TweenInfo.new(1), {
            ["Transparency"] = v25
        }):Play()
        if u18.usable then
            u2:playSound(u12.RAINBOW_BRIDGE_AURA, {
                ["rollOffMaxDistance"] = 40,
                ["looped"] = true,
                ["position"] = u18.part.Position,
                ["parent"] = u18.part
            })
        end
        if u18.creator == u5.LocalPlayer then
            u2:playSound(u12.RAINBOW_BRIDGE_CREATE, {
                ["position"] = u18.part.Position
            })
        end
    end)
    u11.Client:OnEvent("RainbowBridgeDestroy", function(u26) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v27 = u26.part:GetChildren()
        local function v29(p28) --[[ Line: 79 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u26
            --]]
            if p28:IsA("Decal") then
                u7:Create(p28, TweenInfo.new(u26.fadeTime), {
                    ["Transparency"] = 1
                }):Play()
            end
        end
        for v30, v31 in v27 do
            v29(v31, v30 - 1, v27)
        end
        u7:Create(u26.part, TweenInfo.new(u26.fadeTime - 1), {
            ["Transparency"] = 1
        }):Play()
    end)
end
function u13.getProjectileSource(_, p32) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v33 = u9(p32.itemType).multiProjectileSource
    if v33 ~= nil then
        v33 = v33.rainbow_bridge_gadget
    end
    return v33
end
function u13.isRelevantItem(_, p34) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return p34.itemType == u10.RAINBOW_STAFF
end
function u13.onEnable(p35, p36, p37) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.onEnable(p35, p36, p37)
end
function u13.onDisable(p38) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.onDisable(p38)
end
function u13.onStartCharging(_) --[[ Line: 112 ]] end
function u13.onStopCharging(_) --[[ Line: 114 ]] end
function u13.onLaunch(_, _) --[[ Line: 116 ]] end
function u13.onStartReload(_, _) --[[ Line: 118 ]] end
v3.CreateController(u13.new())
return nil