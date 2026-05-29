local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-effect-util").PartEffectUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SummonerKitSkinController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "SummonerKitSkinController"
end
function u11.KnitStart(u15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u5
        [4] = u10
    --]]
    u6.KnitStart(u15)
    u2(function(u16, u17, p18) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u15
            [3] = u10
        --]]
        if not u5.Controllers.KitSkinController:isUsingKitSkinModel(u16) then
            return nil
        end
        if not u15:isPrismaticSkin(u16) then
            p18:GiveTask(u17:GetAttributeChangedSignal("KitSkin"):Connect(function(_) --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u16
                    [3] = u17
                    [4] = u10
                --]]
                if u15:isPrismaticSkin(u16) then
                    local v19 = u15:getPrismaticParts(u17)
                    u10.applyRGB(v19)
                end
            end))
            return nil
        end
        local v20 = u15:getPrismaticParts(u17)
        p18:GiveTask(u10.applyRGB(v20))
    end)
end
function u11.getPrismaticParts(_, p21) --[[ Line: 50 ]]
    return {
        p21:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("hair"),
        p21:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("eye"),
        p21:WaitForChild("3DClothing"):WaitForChild("LeftLowerArm"):WaitForChild("detail"),
        p21:WaitForChild("3DClothing"):WaitForChild("LeftLowerArm"):WaitForChild("transparent"),
        p21:WaitForChild("3DClothing"):WaitForChild("LeftLowerArm"):WaitForChild("transparent"):WaitForChild("ParticleEmitter"),
        p21:WaitForChild("3DClothing"):WaitForChild("LeftLowerArm"):WaitForChild("transparent"):WaitForChild("ParticleEmitter2"),
        p21:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("purple"),
        p21:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("purple")
    }
end
function u11.isPrismaticSkin(_, p22) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u8
        [4] = u7
    --]]
    local v23 = p22.Character
    if not v23 then
        return false
    end
    local v24 = u4.Controllers.KitController:getKitSkin(v23)
    u4.Controllers.KitController:getActiveKits(p22)
    local v25 = u9(p22, u8.SUMMONER)
    if v25 then
        v25 = v24 == u7.PRISMATIC_KAIDA
    end
    return v25
end
function u11.applyClawRGB(_, p26) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v27 = p26:WaitForChild("dragon_claw_mesh")
    local v28 = p26:FindFirstChild("Portal1")
    if v28 ~= nil then
        v28 = v28:WaitForChild("Ring1"):WaitForChild("UI"):WaitForChild("Logo")
    end
    local v29 = p26:FindFirstChild("Portal1")
    if v29 ~= nil then
        v29 = v29:WaitForChild("Ring2"):WaitForChild("UI"):WaitForChild("Logo")
    end
    local v30 = p26:FindFirstChild("Portal1")
    if v30 ~= nil then
        v30 = v30:WaitForChild("Ring3"):WaitForChild("UI"):WaitForChild("Logo")
    end
    local v31 = p26:FindFirstChild("Portal1")
    if v31 ~= nil then
        v31 = v31:WaitForChild("PortalBottom"):WaitForChild("UI"):WaitForChild("Logo")
    end
    local v32 = p26:FindFirstChild("Portal1")
    if v32 ~= nil then
        v32 = v32:WaitForChild("PortalTop"):WaitForChild("PortalWhite"):WaitForChild("UI"):WaitForChild("Logo")
    end
    local v33 = p26:FindFirstChild("Portal1")
    if v33 ~= nil then
        v33 = v33:WaitForChild("PortalTop"):WaitForChild("UI"):WaitForChild("Logo")
    end
    local v34 = p26:WaitForChild("Portal2"):WaitForChild("Ring1"):WaitForChild("UI"):WaitForChild("Logo")
    local v35 = p26:WaitForChild("Portal2"):WaitForChild("Ring2"):WaitForChild("UI"):WaitForChild("Logo")
    local v36 = p26:WaitForChild("Portal2"):WaitForChild("Ring3"):WaitForChild("UI"):WaitForChild("Logo")
    local v37 = p26:FindFirstChild("Portal2")
    if v37 ~= nil then
        v37 = v37:WaitForChild("PortalBottom"):WaitForChild("UI"):WaitForChild("Logo")
    end
    local v38 = p26:FindFirstChild("Portal2")
    if v38 ~= nil then
        v38 = v38:WaitForChild("PortalTop"):WaitForChild("PortalWhite"):WaitForChild("UI"):WaitForChild("Logo")
    end
    local v39 = p26:FindFirstChild("Portal2")
    if v39 ~= nil then
        v39 = v39:WaitForChild("PortalTop"):WaitForChild("UI"):WaitForChild("Logo")
    end
    return u10.applyRGB({
        v27,
        v28,
        v29,
        v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39
    }, nil, {
        ["randomizeOrder"] = true
    })
end
function u11.applyCircleRGB(_, p40) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v41 = {
        p40:WaitForChild("Pivot"):WaitForChild("Ring1"):WaitForChild("UI"):WaitForChild("Logo"),
        p40:WaitForChild("Pivot"):WaitForChild("Ring2"):WaitForChild("UI"):WaitForChild("Logo"),
        p40:WaitForChild("Pivot"):WaitForChild("Ring3"):WaitForChild("UI"):WaitForChild("Logo"),
        p40:WaitForChild("Pivot"):WaitForChild("PortalBottom"):WaitForChild("UI"):WaitForChild("Logo"),
        p40:WaitForChild("Pivot"):WaitForChild("PortalTop"):WaitForChild("PortalWhite"):WaitForChild("UI"):WaitForChild("Logo"),
        p40:WaitForChild("Pivot"):WaitForChild("PortalTop"):WaitForChild("UI"):WaitForChild("Logo")
    }
    return u10.applyRGB(v41, nil, {
        ["randomizeOrder"] = true
    })
end
function u11.applyDragonHeadRGB(_, p42) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v43 = {
        p42:WaitForChild("tendril_glow_mesh"),
        p42:WaitForChild("tendril_hair_glow_mesh"),
        p42:WaitForChild("eye_gem_mesh"),
        p42:WaitForChild("eye_glow_mesh")
    }
    return u10.applyRGB(v43, nil, {
        ["randomizeOrder"] = true
    })
end
u4.CreateController(u11.new())
return nil