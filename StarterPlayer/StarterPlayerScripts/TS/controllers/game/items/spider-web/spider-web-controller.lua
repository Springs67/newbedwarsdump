local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").SpiderWebBalance
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "SpiderWebController"
    end,
    ["__index"] = u12
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p21)
    p21.Name = "SpiderWebController"
end
function u18.KnitStart(u22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u15
        [3] = u4
        [4] = u3
        [5] = u16
        [6] = u5
        [7] = u9
        [8] = u11
        [9] = u7
    --]]
    u12.KnitStart(u22)
    u15.Client:Get("WebPlayer"):Connect(function(p23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:applyEffect(p23.player, p23.stun)
    end)
    u15.Client:Get("SpiderAttack"):Connect(function(p24) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u16
        --]]
        if not p24.position then
            return nil
        end
        u4:playSound(u3.fromList(u16.SPIDER_ATTACK_1, u16.SPIDER_ATTACK_2, u16.SPIDER_ATTACK_3), {
            ["volumeMultiplier"] = 0.2,
            ["rollOffMaxDistance"] = 45,
            ["position"] = p24.position
        })
    end)
    u5("spider_web", function(p25) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u11
            [3] = u7
        --]]
        local u26 = p25:WaitForChild("Web", 3)
        if not u26 then
            return nil
        end
        local v27 = p25:GetAttribute("SpiderWebTeamId")
        local v28 = 0.99
        local v29 = u9.LocalPlayer.Team
        if v29 ~= nil then
            v29 = v29.Name
        end
        if v29 == v27 then
            v28 = 0.8
            local v30 = p25:WaitForChild("Indicator", 3)
            if v30 then
                v30.Transparency = 0.8
            end
        end
        u11(2, u7, function(p31) --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26.Transparency = p31
        end, u26.Transparency, v28)
    end)
end
function u18.applyEffect(_, p32, p33) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u6
        [4] = u14
        [5] = u13
        [6] = u4
        [7] = u16
    --]]
    local v34 = p32.Character
    if not v34 then
        return nil
    end
    local u35 = {}
    if p33 then
        local u36 = u10.Assets.Effects.SpiderWebEffect:Clone()
        u36.Parent = v34
        task.delay(2, function() --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            u36:Destroy()
        end)
    end
    for _, v37 in u10.Assets.Effects.WebEffectFolder:GetChildren() do
        v37.Parent = v34
        table.insert(u35, v37)
    end
    u17:weldCharacterAccessories(v34)
    local u38 = u6.Controllers.StunController:showStatusBubble(v34, u14.SPIDER_WEB)
    task.delay(u13.SPIDER_WEB_DEBUFF_TIME, function() --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u38
        --]]
        for _, v39 in u35 do
            v39:Destroy()
        end
        u38:DoCleaning()
    end)
    local v40 = v34.PrimaryPart
    if v40 ~= nil then
        v40 = v40.Position
    end
    u4:playSound(u16.SPIDER_WEB, {
        ["position"] = v40
    })
end
u6.CreateController(u18.new())
return nil