local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.RunService
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "VoidArmorController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "VoidArmorController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u2
        [4] = u11
        [5] = u10
    --]]
    u8.KnitStart(u16)
    for _, v17 in { u9.VOID_CHESTPLATE, u9.VOID_HELMET, u9.VOID_BOOTS } do
        u2.Controllers.PreloadController:preloadForItemType(v17, {
            ["sounds"] = { u11.VOID_SHIELD_BREAK }
        })
    end
    u10.Client:Get("VoidArmorShieldTrigger"):Connect(function(u18) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16:playEffect(u18.player)
        u16:putOnCooldown(u18.player)
        task.delay(30, function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u18
            --]]
            u16:shieldReady(u18.player)
        end)
    end)
end
function u12.putOnCooldown(p19, p20) --[[ Line: 46 ]]
    p19:changeArmorMaterial(p20, Enum.Material.Sand)
end
function u12.shieldReady(p21, p22) --[[ Line: 49 ]]
    p21:changeArmorMaterial(p22, Enum.Material.Neon)
end
function u12.changeArmorMaterial(_, p23, p24) --[[ Line: 52 ]]
    if p23.Character == nil then
        return nil
    end
    local v25 = p23.Character
    if v25 ~= nil then
        v25 = v25:GetChildren()
    end
    for _, v26 in v25 do
        if #{ string.find(v26:GetFullName(), "void_") } ~= 0 then
            local v27 = v26:WaitForChild("Handle", 3)
            if v27 ~= nil then
                v27 = v27:WaitForChild("Neon", 3)
            end
            if v27 then
                v27.Material = p24
            end
        end
    end
end
function u12.playEffect(_, u28) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u6
        [4] = u3
    --]]
    if u28.Character == nil then
        return nil
    end
    local u29 = u5.Assets.Effects.VoidShieldBreak:Clone()
    u29:PivotTo(u28.Character:GetPrimaryPartCFrame())
    u29.Parent = u7
    local u30 = u29:WaitForChild("Shield", 3)
    u30.Transparency = 0.4
    local u31 = tick() + 1
    local u32 = 1
    u6.Heartbeat:Connect(function(p33) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u30
            [3] = u29
            [4] = u28
            [5] = u3
            [6] = u32
        --]]
        if u31 < tick() + p33 then
            u30:Destroy()
            return nil
        end
        u29:PivotTo(u28.Character:GetPrimaryPartCFrame())
        local v34 = u30
        v34.Transparency = v34.Transparency + p33 * 2.5
        u3(u29, u32)
        u32 = u32 + p33
    end)
end
u2.CreateController(u12.new())
return nil