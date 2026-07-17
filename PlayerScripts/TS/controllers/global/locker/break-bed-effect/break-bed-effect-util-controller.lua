-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local v5 = {};
local u6 = setmetatable({}, {
    __index = v5
});
u6.NORMAL = 0;
v5[0] = "NORMAL";
u6.SLICED = 1;
v5[1] = "SLICED";
u6.SPIN = 2;
v5[2] = "SPIN";
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "BreakBedEffectUtilController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 44
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 48
    -- upvalues: KnitController (copy), u2 (copy), Workspace (copy)
    KnitController.constructor(p9);
    p9.Name = "BreakBedEffectUtilController";
    p9.bedMap = {};
    p9.bedFolder = u2("Folder", {
        Name = "BedModels",
        Parent = Workspace
    });
end;

function u7.KnitStart(p10) -- Line: 57
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p10);
end;

function u7.createBedClone(p11, p12, p13, p14) -- Line: 60
    -- upvalues: KnitClient2 (copy), PlaceUtil (copy), ColorUtil (copy), TeamColorHex (copy), u6 (ref), ReplicatedStorage (copy), u4 (copy)
    local u15 = KnitClient2.Controllers.TeamController:getTeamById(p12);

    if u15 ~= nil then
        u15 = u15.color;
    end;

    if u15 == nil then
        u15 = p14 or Color3.fromRGB(0, 0, 0);
    end;

    if PlaceUtil.isLobbyServer() and not p14 then
        u15 = ColorUtil.hexColor(TeamColorHex.red);
    end;

    local v16;

    if p13 == u6.SLICED then
        v16 = ReplicatedStorage.Assets.Misc.SlicedBed:Clone();
        local v17 = v16.Pivot.Align:GetChildren();

        local function v19(p18) -- Line: 79
            -- upvalues: u4 (ref), ColorUtil (ref), u15 (ref)
            if not p18:IsA("MeshPart") then
                return nil;
            end;

            if u4.includes(string.lower(p18.Name), "blanket") then
                p18.Color = ColorUtil.brighten(u15, 0.2);

                return nil;
            end;

            if u4.includes(string.lower(p18.Name), "mattress") then
                p18.Color = u15;
            end;
        end;

        for i, v in v17 do
            v19(v, i - 1, v17);
        end;
    elseif p13 == u6.SPIN then
        v16 = ReplicatedStorage.Assets.Misc.SpinBed:Clone();
        v16.Root.Bed.Color = u15;
        v16.Root.Blanket.Color = ColorUtil.brighten(u15, 0.2);
    else
        v16 = ReplicatedStorage.Assets.Blocks.bed:Clone();
        v16.Root.Bed.Color = u15;
        v16.Root.Blanket.Color = ColorUtil.brighten(u15, 0.2);
    end;

    return v16;
end;

KnitClient.CreateController(u7.new());

return {
    BedBreakBedType = u6
};