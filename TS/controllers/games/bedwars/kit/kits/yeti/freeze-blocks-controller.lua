-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuart = v2.InQuart;
local OutQuad = v2.OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "partcache", "out");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BreakBlockEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").BreakBlockEventZap;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GetTarmacAssetFromPath = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAssetFromPath;
local u5 = ConstantManager.registerConstants(script, {
    TweenInTime = 0.5
});
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "FreezeBlocksController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 35
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 39
    -- upvalues: KnitController (copy), GetTarmacAssetFromPath (copy), u3 (copy), BLOCK_SIZE (copy), u4 (copy), Workspace (copy)
    KnitController.constructor(p8);
    p8.Name = "FreezeBlocksController";
    p8.random = Random.new();
    p8.frozenBlockParts = {};
    local v9 = GetTarmacAssetFromPath({ "blocks", "ice_frost_1" });
    local v10 = {};

    for _, v in Enum.NormalId:GetEnumItems() do
        local v11 = u3("Decal", {
            ZIndex = 2,
            Transparency = 1,
            Texture = v9.s,
            Face = v
        });
        table.insert(v10, v11);
    end;

    local v12 = u3("Part", {
        Position = Vector3.new(0, 0, 0),
        CanCollide = false,
        Anchored = true,
        Transparency = 1,
        Size = Vector3.new(BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE),
        Children = v10
    });
    p8.partCache = u4.new(v12, 100);
    local v13 = u3("Folder", {
        Name = "FrozenBlockCache",
        Parent = Workspace.Terrain
    });
    p8.partCache:SetCacheParent(v13);
end;

function u6.KnitStart(u14) -- Line: 70
    -- upvalues: KnitController (copy), BreakBlockEventZap (copy), BlockEngine (copy), SoundManager (copy), GameSound (copy), default2 (copy)
    KnitController.KnitStart(u14);
    BreakBlockEventZap.On(function(p15, p16, p17, p18, p19) -- Line: 72
        -- upvalues: BlockEngine (ref), u14 (copy), SoundManager (ref), GameSound (ref)
        local v20 = tostring(BlockEngine:getWorldPosition(p15));
        local v21 = u14.frozenBlockParts[v20];

        if v21 then
            SoundManager:playSound(GameSound.BREAK_FROZEN_BLOCK, {
                position = v21.Position
            });
            u14.frozenBlockParts[v20] = nil;
            u14.partCache:ReturnPart(v21);
        end;
    end);
    default2.Client:OnEvent("FreezeBlocks", function(p22) -- Line: 94
        -- upvalues: u14 (copy)
        u14:freezeBlocks(p22.position, p22.frozenBlocks);
    end);
end;

function u6.freezeBlocks(u23, p24, p25) -- Line: 98
    -- upvalues: Workspace (copy)
    for _, v in p25 do
        local u26 = tostring(v.position);

        if u23.frozenBlockParts[u26] == nil then
            local u27 = u23:makeIceBlock(v.position);
            u23.frozenBlockParts[u26] = u27;
            u23:tweenInIce(u27, (v.position - p24).Magnitude);
            task.delay(v.expirationTime - Workspace:GetServerTimeNow(), function() -- Line: 110
                -- upvalues: u23 (copy), u26 (copy), u27 (copy)
                if u23.frozenBlockParts[u26] ~= nil then
                    u23:tweenOutIce(u27):andThen(function() -- Line: 114
                        -- upvalues: u23 (ref), u26 (ref), u27 (ref)
                        u23.frozenBlockParts[u26] = nil;
                        u23.partCache:ReturnPart(u27);
                    end);
                end;
            end);
        end;
    end;
end;

u6.tweenInIce = RuntimeLib.async(function(p28, p29, p30) -- Line: 123
    -- upvalues: OutQuad (copy), u5 (copy), default (copy), InQuart (copy)
    local v31 = OutQuad(p30, u5.TweenInTime, 2.5, 35);

    local function _(p32) -- Line: 126
        return p32:IsA("Decal");
    end;

    local v33 = 0;
    local u34 = {};

    for i, child in p29:GetChildren() do
        local _ = i - 1;

        if child:IsA("Decal") == true then
            v33 = v33 + 1;
            u34[v33] = child;
        end;
    end;

    default(v31, InQuart, function(p35) -- Line: 140
        -- upvalues: u34 (copy)
        for _, v in u34 do
            v.Transparency = p35;
        end;
    end, 1, 0.45 + p28.random:NextNumber(-0.1, 0.2)):Wait();
end);
u6.tweenOutIce = RuntimeLib.async(function(p36, p37) -- Line: 147
    -- upvalues: default (copy), InQuart (copy)
    local v38 = p36.random:NextNumber(1, 3);

    local function _(p39) -- Line: 150
        return p39:IsA("Decal");
    end;

    local v40 = 0;
    local u41 = {};

    for i, child in p37:GetChildren() do
        local _ = i - 1;

        if child:IsA("Decal") == true then
            v40 = v40 + 1;
            u41[v40] = child;
        end;
    end;

    default(v38, InQuart, function(p42) -- Line: 164
        -- upvalues: u41 (copy)
        for _, v in u41 do
            v.Transparency = p42;
        end;
    end, u41[1].Transparency, 1):Wait();
end);

function u6.makeIceBlock(p43, p44) -- Line: 171
    -- upvalues: GameQueryUtil (copy)
    local v45 = p43.partCache:GetPart();
    v45.Position = p44;
    GameQueryUtil:setQueryIgnored(v45, true);

    return v45;
end;

KnitClient.CreateController(u6.new());

return nil;