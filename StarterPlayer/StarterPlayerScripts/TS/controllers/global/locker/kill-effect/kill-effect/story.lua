local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ServerStorage
local u9 = v7.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, script.Parent, "effects", "carrot-splosion-kill-effect")
return function(_) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u8
        [4] = u10
        [5] = u9
        [6] = u6
        [7] = u3
        [8] = u11
    --]]
    local u12 = u5.new()
    local v13 = CFrame.new(30.913, 303.437, 469.703)
    local v14 = u4
    local v15 = 0
    local v16 = {}
    for v17, v18 in u8.Assets.Villagers:GetDescendants() do
        local _ = v17 - 1
        local v19 = v18:IsA("Model")
        if v19 then
            v19 = u10[v18.Name] ~= nil
        end
        if v19 == true then
            v15 = v15 + 1
            v16[v15] = v18
        end
    end
    local v20 = v14.shuffleArray(v16)[1]
    u12:GiveTask(v20)
    local u21 = v20:Clone()
    u21.PrimaryPart.Anchored = true
    u21.Name = "KillEffectVictimCharacter"
    u21.Parent = u9
    u21:PivotTo(v13 + Vector3.new(0, 3, 0))
    u12:GiveTask(u21)
    local v22 = v20:Clone()
    v22.PrimaryPart.Anchored = true
    v22.Name = "KillEffectKillerCharacter"
    v22.Parent = u9
    v22:PivotTo(v13 + u21:GetPivot().LookVector * -16)
    u12:GiveTask(v22)
    local v23 = u6("Part", {
        ["Name"] = "Baseplate",
        ["Size"] = Vector3.new(30, 1, 30),
        ["Material"] = Enum.Material.SmoothPlastic,
        ["Position"] = v13.Position - Vector3.new(0, 8, 0),
        ["Anchored"] = true,
        ["Parent"] = u9
    })
    v23.Parent = u9
    u12:GiveTask(v23)
    local u24 = {
        ["DisplayName"] = "OnlyTwentyCharacters",
        ["Character"] = v22
    }
    for _, v25 in u21:GetDescendants() do
        if v25:IsA("BasePart") then
            u3:setQueryIgnored(v25, true)
        end
    end
    local v26, v27 = pcall(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u24
            [3] = u21
        --]]
        return u11.new(u24):onKill(u24, u21, u21:GetPivot())
    end)
    if v26 and v27 then
        v27:GiveTask(u21)
        v27:GiveTask(v22)
        u12:GiveTask(v27)
    end
    return function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:DoCleaning()
    end
end