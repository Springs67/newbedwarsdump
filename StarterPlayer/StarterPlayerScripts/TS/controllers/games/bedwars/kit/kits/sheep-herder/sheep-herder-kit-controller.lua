local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ExpireList
local u4 = v2.WatchCharacterAnimation
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u15 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "SheepHerderKitController"
    end,
    ["__index"] = u15
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u12
        [3] = u13
        [4] = u3
    --]]
    u15.constructor(p19, u12.SHEEP_HERDER)
    p19.Name = "SheepHerderKitController"
    p19.sheepNamespace = u13.Client:GetNamespace("SheepHerder")
    p19.animationCooldowns = u3.new(2)
end
function u16.KnitStart(p20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.KnitStart(p20)
end
function u16.onKitLocalActivated(_, _) --[[ Line: 40 ]] end
function u16.onKitLocalDeactivated(_) --[[ Line: 42 ]] end
function u16.onKitReplicationActivated(u21, _) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u10
        [4] = u8
        [5] = u6
        [6] = u9
        [7] = u14
    --]]
    u4({ u11:getAssetId(u10.TAME_SHEEP) }, function(p22, p23) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u8
            [3] = u6
            [4] = u9
            [5] = u14
        --]]
        local v24 = p22.Character
        if not v24 then
            return nil
        end
        if u21.animationCooldowns:has(p22.UserId) and p22.UserId ~= u8.LocalPlayer.UserId then
            return nil
        end
        u21.animationCooldowns:add(p22.UserId)
        local v25 = v24.PrimaryPart
        if v25 ~= nil then
            v25 = v25.Position
        end
        if not v25 then
            return nil
        end
        local u26 = u6.new()
        local u27 = u9.Assets.Effects.Crook:Clone()
        u27.Parent = v24
        u14:weldCharacterAccessories(v24)
        p23.Stopped:Connect(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u26
            --]]
            u27:Destroy()
            u26:DoCleaning()
        end)
    end)
end
function u16.onKitReplicationDeactivated(_) --[[ Line: 72 ]] end
function u16.onInnateAbilityEnabled(_, _, _) --[[ Line: 74 ]] end
function u16.onAbilityUsed(_, _, _) --[[ Line: 76 ]] end
function u16.tameSheep(p28, p29) --[[ Line: 78 ]]
    local v30 = p29.SheepData.Value
    if not v30 then
        return nil
    end
    p28.sheepNamespace:Get("TameSheep"):SendToServer(v30)
end
v5.CreateController(u16.new())
return nil