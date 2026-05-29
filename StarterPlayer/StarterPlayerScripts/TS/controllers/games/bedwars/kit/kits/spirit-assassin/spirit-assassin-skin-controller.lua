local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.TweenService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u12 = {
    Color3.fromRGB(255, 89, 89),
    Color3.fromRGB(218, 133, 65),
    Color3.fromRGB(91, 154, 76),
    Color3.fromRGB(82, 124, 174),
    Color3.fromRGB(180, 128, 255)
}
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "SpiritAssassinSkinController"
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
    p16.Name = "SpiritAssassinSkinController"
end
function u13.KnitStart(u17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u2
    --]]
    u8.KnitStart(u17)
    local _ = u6.LocalPlayer
    u2(function(u18, u19, p20) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        if u17:isPrismaticSkinEquipped(u18) then
            u17:applyRGBEffect(u19)
        else
            p20:GiveTask(u19:GetAttributeChangedSignal("KitSkin"):Connect(function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u18
                    [3] = u19
                --]]
                if u17:isPrismaticSkinEquipped(u18) then
                    u17:applyRGBEffect(u19)
                end
            end))
        end
    end)
end
function u13.isPrismaticSkinEquipped(_, p21) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
        [3] = u10
        [4] = u9
    --]]
    local v22 = p21.Character
    if not v22 then
        return false
    end
    local v23 = u3.Controllers.KitController:getKitSkin(v22)
    u3.Controllers.KitController:getActiveKits(p21)
    local v24 = u11(p21, u10.SPIRIT_ASSASSIN)
    if v24 then
        v24 = v23 == u9.SPIRIT_ASSASSIN_PRISMATIC
    end
    return v24
end
function u13.applyRGBEffect(_, u25) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u7
    --]]
    local u26 = {
        u25:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("Hair"),
        u25:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon1"),
        u25:WaitForChild("3DClothing"):WaitForChild("UpperTorso"):WaitForChild("Neon2"),
        u25:WaitForChild("3DClothing"):WaitForChild("LeftUpperLeg"):WaitForChild("Neon"),
        u25:WaitForChild("3DClothing"):WaitForChild("RightUpperLeg"):WaitForChild("Neon"),
        u25:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon1"),
        u25:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon2"),
        u25:WaitForChild("3DClothing"):WaitForChild("LowerTorso"):WaitForChild("Neon3")
    }
    task.spawn(function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u12
            [3] = u26
            [4] = u25
            [5] = u7
        --]]
        local v27 = u4.new()
        local v28 = Instance.new("Color3Value")
        v28.Value = u12[1]
        v27:GiveTask(v28.Changed:Connect(function(p29) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            for v30, v31 in u26 do
                local _ = v30 - 1
                v31.Color = p29
            end
        end))
        local v32 = 1
        while u25.Parent ~= nil do
            local v33 = u7:Create(v28, TweenInfo.new(1), {
                ["Value"] = u12[v32 + 1]
            })
            v33:Play()
            v33.Completed:Wait()
            local v34 = v32 + 1
            v32 = #u12 <= v34 and 0 or v34
        end
        v27:DoCleaning()
    end)
end
u3.CreateController(u13.new())
return nil