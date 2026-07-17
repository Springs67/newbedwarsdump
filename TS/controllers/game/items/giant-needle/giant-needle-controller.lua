-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "GiantNeedleController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 23
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p5);
    p5.Name = "GiantNeedleController";
    p5.maid = u1.new();
    p5.recycledHighlight = {};
end;

function u3.KnitStart(p6) -- Line: 29
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p6);
end;

function u3.onEnable(u7, p8, p9) -- Line: 32
    -- upvalues: KnitClient (copy), Players (copy), u2 (copy)
    local u10 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

    local function _(p11) -- Line: 35
        -- upvalues: u10 (copy)
        local v12 = u10;

        if v12 ~= nil then
            v12 = v12.id;
        end;

        return p11.id ~= v12;
    end;

    local v13 = 0;
    local v14 = {};

    for i, v in KnitClient.Controllers.TeamController:getTeams() do
        local _ = i - 1;
        local v15;

        if u10 == nil then
            v15 = u10;
        else
            v15 = u10.id;
        end;

        if v.id ~= v15 == true then
            v13 = v13 + 1;
            v14[v13] = v;
        end;
    end;

    local function v26(p16) -- Line: 53
        -- upvalues: KnitClient (ref), u7 (copy), u2 (ref)
        local v17 = KnitClient.Controllers.BedwarsController:getTeamBed(p16.id);

        if v17 then
            local function _(p18) -- Line: 57
                return p18:IsA("MeshPart");
            end;

            local v19 = 0;
            local v20 = {};

            for i, child in v17:GetChildren() do
                local _ = i - 1;

                if child:IsA("MeshPart") == true then
                    v19 = v19 + 1;
                    v20[v19] = child;
                end;
            end;

            local function v25(p21) -- Line: 70
                -- upvalues: u7 (ref), u2 (ref)
                local recycledHighlight = u7.recycledHighlight;
                local v22 = #recycledHighlight;
                local v23 = recycledHighlight[v22];
                recycledHighlight[v22] = nil;
                local u24 = v23 or u2("Highlight", {
                    Name = "BedHighlight",
                    FillTransparency = 1,
                    OutlineTransparency = 0,
                    OutlineColor = Color3.fromRGB(0, 237, 255),
                    DepthMode = Enum.HighlightDepthMode.Occluded
                });
                u24.Parent = p21;
                u7.maid:GiveTask(function() -- Line: 88
                    -- upvalues: u24 (ref), u7 (ref)
                    if u24 then
                        u24.Parent = nil;
                        table.insert(u7.recycledHighlight, u24);
                    end;
                end);
            end;

            for i, v in v20 do
                v25(v, i - 1, v20);
            end;
        end;
    end;

    for i, v in v14 do
        v26(v, i - 1, v14);
    end;
end;

function u3.onDisable(p27) -- Line: 106
    p27.maid:DoCleaning();
end;

function u3.isRelevantItem(p28, p29) -- Line: 109
    -- upvalues: ItemType (copy)
    return p29.itemType == ItemType.GIANT_NEEDLE;
end;

KnitClient.CreateController(u3.new());

return nil;