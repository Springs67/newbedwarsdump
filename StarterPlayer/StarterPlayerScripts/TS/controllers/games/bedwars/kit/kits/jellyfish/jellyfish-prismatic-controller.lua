local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.WatchCharacter
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util").PrismaticMarinaColors
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "JellyfishPrismaticController"
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
    p16.Name = "JellyfishPrismaticController"
end
function u13.KnitStart(u17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
    --]]
    u8.KnitStart(u17)
    u4(function(u18, u19, p20) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        if u17:isPrismaticSkinEquipped(u18) then
            u17:applyRGBEffect(u19)
        else
            p20:GiveTask(u19:GetAttributeChangedSignal("KitSkin"):Connect(function() --[[ Line: 38 ]]
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
function u13.isPrismaticSkinEquipped(_, p21) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u12
        [3] = u10
        [4] = u9
    --]]
    local v22 = p21.Character
    if not v22 then
        return false
    end
    local v23 = u5.Controllers.KitController:getKitSkin(v22)
    u5.Controllers.KitController:getActiveKits(p21)
    local v24 = u12(p21, u10.JELLYFISH)
    if v24 then
        v24 = v23 == u9.JELLYFISH_PRISMATIC
    end
    return v24
end
function u13.applyRGBEffect(_, u25) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u3
        [4] = u7
    --]]
    local v26 = u25:WaitForChild("3DClothing")
    local u27 = { v26:WaitForChild("Head"):WaitForChild("Prismatic_InnerHat"), v26:WaitForChild("Head"):WaitForChild("Prismatic_Tentacles"), v26:WaitForChild("LowerTorso"):WaitForChild("Prismatic_Skirt") }
    local v28 = 0
    local u29 = {}
    for v30, v31 in v26:WaitForChild("Head"):WaitForChild("Prismatic_Tentacles"):GetChildren() do
        local _ = v30 - 1
        if v31:IsA("Decal") == true then
            v28 = v28 + 1
            u29[v28] = v31
        end
    end
    task.spawn(function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u11
            [3] = u27
            [4] = u3
            [5] = u29
            [6] = u25
            [7] = u7
        --]]
        local v32 = u6.new()
        local v33 = Instance.new("Color3Value")
        v33.Value = u11[1]
        v32:GiveTask(v33.Changed:Connect(function(p34) --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u3
                [3] = u29
            --]]
            for v35, v36 in u27 do
                local _ = v35 - 1
                v36.Color = p34
            end
            for v37, v38 in u29 do
                local _ = v37 - 1
                v38.Color3 = u3.darken(p34, 0.3)
            end
        end))
        local v39 = 1
        while u25.Parent ~= nil do
            local v40 = u7:Create(v33, TweenInfo.new(2), {
                ["Value"] = u11[v39 + 1]
            })
            v40:Play()
            v40.Completed:Wait()
            local v41 = v39 + 1
            v39 = #u11 <= v41 and 0 or v41
        end
        v32:DoCleaning()
    end)
end
u5.CreateController(u13.new())
return nil