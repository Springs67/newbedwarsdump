local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.WatchCollectionTag
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, script.Parent, "ui", "spirit-gardener-flower-health-ui").SpiritGardenerFlowerHealthUi
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SpiritGardenerFlowerController"
    end,
    ["__index"] = u9
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
        [1] = u9
    --]]
    u9.constructor(p15)
    p15.Name = "SpiritGardenerFlowerController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u5
        [4] = u8
        [5] = u10
        [6] = u6
        [7] = u3
        [8] = u7
        [9] = u11
    --]]
    u9.KnitStart(u16)
    u4("SpiritGardenerFlower", function(p17) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u10
            [4] = u6
            [5] = u3
            [6] = u7
            [7] = u11
        --]]
        if not u5.Controllers.KitController:isUsingKit(u8.LocalPlayer, u10.SPIRIT_GARDENER) then
            return nil
        end
        if p17:GetAttribute("PlacedByUserId") ~= u8.LocalPlayer.UserId then
            return nil
        end
        p17:SetAttribute("NoHealthbar", true)
        local v18 = u6("Part", {
            ["Name"] = "FlowerHealth",
            ["Size"] = Vector3.new(1, 1, 1),
            ["Transparency"] = 1,
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CFrame"] = CFrame.new(p17.Position),
            ["Parent"] = p17
        })
        u3:setQueryIgnored(v18, true)
        u7.mount(u7.createElement(u11, {
            ["billboardPart"] = v18,
            ["spiritGardenerFlower"] = p17
        }), v18, "FlowerHealthBillboard")
    end)
    u4("SpiritGardenerFlower", function(u19) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        local u20 = u19:WaitForChild("stage_1")
        local u21 = u19:WaitForChild("stage_2")
        local u22 = u19:WaitForChild("stage_3")
        if not (u20 and (u21 and u22)) then
            return nil
        end
        u19:GetAttributeChangedSignal("FlowerDamaged"):Connect(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u16
                [3] = u21
                [4] = u22
            --]]
            local v23 = u19:GetAttribute("FlowerDamaged")
            if v23 == 0 or (v23 ~= v23 or (v23 == "" or not v23)) then
                u16:changeTransparencyOfDescendants(u21, 0)
                u16:changeTransparencyOfDescendants(u22, 1)
                u19:SetAttribute("CurrentStage", 2)
            else
                u16:changeTransparencyOfDescendants(u21, 1)
                u16:changeTransparencyOfDescendants(u22, 0)
                u19:SetAttribute("CurrentStage", 3)
            end
        end)
        u19:GetAttributeChangedSignal("HasFullyGrown"):Connect(function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u16
                [3] = u20
                [4] = u21
            --]]
            local v24 = u19:GetAttribute("HasFullyGrown")
            if v24 ~= 0 and (v24 == v24 and (v24 ~= "" and v24)) then
                u16:changeTransparencyOfDescendants(u20, 1)
                u16:changeTransparencyOfDescendants(u21, 0)
                u19:SetAttribute("CurrentStage", 2)
            end
        end)
    end)
end
function u12.changeTransparencyOfDescendants(_, p25, p26) --[[ Line: 87 ]]
    for v27, v28 in p25:GetDescendants() do
        local _ = v27 - 1
        if v28 ~= p25 then
            if v28:IsA("MeshPart") then
                v28.Transparency = p26
            end
            if v28:IsA("ParticleEmitter") then
                v28.Enabled = p26 == 0
            end
        end
    end
end
u5.CreateController(u12.new())
return nil