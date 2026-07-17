-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ServerStorage = v4.ServerStorage;
local Workspace = v4.Workspace;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local u5 = RuntimeLib.import(script, script.Parent, "effects", "carrot-splosion-kill-effect");

return function(p6) -- Line: 13
    -- upvalues: u2 (copy), RandomUtil (copy), ServerStorage (copy), BedwarsKit (copy), Workspace (copy), u3 (copy), GameQueryUtil (copy), u5 (copy)
    local u7 = u2.new();
    local v8 = CFrame.new(30.913, 303.437, 469.703);

    local function _(p9) -- Line: 22
        -- upvalues: BedwarsKit (ref)
        local v10 = p9:IsA("Model") and BedwarsKit[p9.Name] ~= nil;

        return v10;
    end;

    local v11 = 0;
    local v12 = {};

    for i, descendant in ServerStorage.Assets.Villagers:GetDescendants() do
        local _ = i - 1;
        local v13 = descendant:IsA("Model") and BedwarsKit[descendant.Name] ~= nil;

        if v13 == true then
            v11 = v11 + 1;
            v12[v11] = descendant;
        end;
    end;

    local v14 = RandomUtil.shuffleArray(v12)[1];
    u7:GiveTask(v14);
    local u15 = v14:Clone();
    u15.PrimaryPart.Anchored = true;
    u15.Name = "KillEffectVictimCharacter";
    u15.Parent = Workspace;
    u15:PivotTo(v8 + Vector3.new(0, 3, 0));
    u7:GiveTask(u15);
    local v16 = v14:Clone();
    v16.PrimaryPart.Anchored = true;
    v16.Name = "KillEffectKillerCharacter";
    v16.Parent = Workspace;
    v16:PivotTo(v8 + u15:GetPivot().LookVector * -16);
    u7:GiveTask(v16);
    local v17 = u3("Part", {
        Name = "Baseplate",
        Size = Vector3.new(30, 1, 30),
        Material = Enum.Material.SmoothPlastic,
        Position = v8.Position - Vector3.new(0, 8, 0),
        Anchored = true,
        Parent = Workspace
    });
    v17.Parent = Workspace;
    u7:GiveTask(v17);
    local u18 = {
        DisplayName = "OnlyTwentyCharacters",
        Character = v16
    };

    for _, descendant in u15:GetDescendants() do
        if descendant:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    local success, result = pcall(function() -- Line: 79
        -- upvalues: u5 (ref), u18 (copy), u15 (copy)
        return u5.new(u18):onKill(u18, u15, u15:GetPivot());
    end);

    if success and result then
        result:GiveTask(u15);
        result:GiveTask(v16);
        u7:GiveTask(result);
    end;

    return function() -- Line: 89
        -- upvalues: u7 (copy)
        u7:DoCleaning();
    end;
end;