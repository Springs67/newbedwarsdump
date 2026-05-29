local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-util").SpiritSummonerUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SpiritSummonerIndicatorController"
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
    p15.Name = "SpiritSummonerIndicatorController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p16)
end
function u12.showHitIndicator(u17, p18, p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u6
        [4] = u7
        [5] = u5
        [6] = u11
        [7] = u10
    --]]
    if u17.highlight == nil then
        u17.highlight = u3("Highlight", {
            ["FillTransparency"] = 1,
            ["OutlineTransparency"] = 0.2,
            ["Parent"] = nil,
            ["FillColor"] = Color3.fromRGB(255, 237, 0),
            ["OutlineColor"] = Color3.fromRGB(255, 255, 255)
        })
        p19:GiveTask(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            local v20 = u17.highlight
            if v20 ~= nil then
                v20:Destroy()
            end
            u17.highlight = nil
        end)
    end
    local u21 = u9.DEPLOY_RADIUS * 1.8
    if u17.hitIndicator == nil then
        u17.hitIndicator = u6.Assets.Misc.SpiritSummonerIndicator:Clone()
        u17.hitIndicator.Parent = u7
        local v22 = u17.hitIndicator:GetChildren()
        local function v30(p23) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            if p23.Name == "PrimaryLayer" and p23:IsA("UnionOperation") then
                local v24 = u21 * 0.87
                local v25 = u21 * 0.87
                p23.Size = Vector3.new(1, v24, v25)
                p23.Transparency = 0.5
            end
            if p23.Name == "SecondaryLayer" and p23:IsA("Part") then
                local v26 = u21 * 0.9
                local v27 = u21 * 0.9
                p23.Size = Vector3.new(1, v26, v27)
            end
            if p23.Name == "TertiaryLayer" and p23:IsA("UnionOperation") then
                local v28 = u21
                local v29 = u21
                p23.Size = Vector3.new(1, v28, v29)
            end
        end
        for v31, v32 in v22 do
            v30(v32, v31 - 1, v22)
        end
        p19:GiveTask(function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            local v33 = u17.hitIndicator
            if v33 ~= nil then
                v33:Destroy()
            end
            u17.hitIndicator = nil
        end)
    end
    local v34 = CFrame.new(p18) * CFrame.Angles(0, 0, -1.5707963267948966)
    u17.hitIndicator:PivotTo(v34)
    if u5.LocalPlayer:GetAttribute("SpiritSummonerAffinity") == u11.ATTACK then
        local v35 = u10.getClosestEntity(p18, u5.LocalPlayer, "attack")
        if v35 then
            u17.highlight.OutlineTransparency = 0.2
            u17.highlight.Parent = v35
            return nil
        end
        local v36 = u10.getClosestEntity(p18, u5.LocalPlayer, "heal")
        if v36 then
            u17.highlight.OutlineTransparency = 0.2
            u17.highlight.Parent = v36
            return nil
        end
    end
    if u5.LocalPlayer:GetAttribute("SpiritSummonerAffinity") == u11.HEAL then
        local v37 = u10.getClosestEntity(p18, u5.LocalPlayer, "heal")
        if v37 then
            u17.highlight.OutlineTransparency = 0.2
            u17.highlight.Parent = v37
            return nil
        end
        local v38 = u10.getClosestEntity(p18, u5.LocalPlayer, "attack")
        if v38 then
            u17.highlight.OutlineTransparency = 0.2
            u17.highlight.Parent = v38
            return nil
        end
    end
    if u10.getClosestItemDrop(p18) then
        local v39 = u10.getClosestItemDrop(p18)
        local v40
        if v39 == nil then
            v40 = v39
        else
            v40 = v39.Handle
        end
        if v40 then
            u17.highlight.OutlineTransparency = 0.2
            u17.highlight.Parent = v39.Handle
            return nil
        end
    end
    u17.highlight.OutlineTransparency = 1
    return nil
end
v2.CreateController(u12.new())
return nil