-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local PvPArenaBaseAugmentController = RuntimeLib.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController;
local BullyStacksUi = RuntimeLib.import(script, script.Parent, "ui", "bully-stack-ui").BullyStacksUi;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "PvpArenaBullyAugmentController";
    end,

    __index = PvPArenaBaseAugmentController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: PvPArenaBaseAugmentController (copy), PvPArenaAugmentType (copy)
    PvPArenaBaseAugmentController.constructor(p4, PvPArenaAugmentType.BULLY);
    p4.Name = "PvpArenaBullyAugmentController";
    p4.settingUpStackTree = false;
end;

function u2.onActivated(u5) -- Line: 28
    -- upvalues: Players (copy), u1 (copy), BullyStacksUi (copy)
    if not (u5.bullyStackTree or u5.settingUpStackTree) then
        u5.settingUpStackTree = true;
        local v6 = Players.LocalPlayer:GetAttribute("BullyStack");
        local v7 = u1.createElement(BullyStacksUi, {
            bullyStacks = v6 == nil and 0 or v6
        });
        local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui", 3);

        if PlayerGui ~= nil then
            PlayerGui = PlayerGui:WaitForChild("StatusInfoListGui", 3);

            if PlayerGui ~= nil then
                PlayerGui = PlayerGui:WaitForChild("FakeHotbar", 3);
            end;
        end;

        u5.bullyStackTree = u1.mount(v7, PlayerGui);
    end;

    Players.LocalPlayer:GetAttributeChangedSignal("BullyStack"):Connect(function(p8) -- Line: 56
        -- upvalues: u5 (copy)
        u5:updateTree();
    end);
end;

function u2.updateTree(p9) -- Line: 60
    -- upvalues: Players (copy), u1 (copy), BullyStacksUi (copy)
    if p9.bullyStackTree then
        local v10 = Players.LocalPlayer:GetAttribute("BullyStack");
        u1.update(p9.bullyStackTree, u1.createElement(BullyStacksUi, {
            bullyStacks = v10
        }));
    end;
end;

KnitClient.CreateController(u2.new());

return nil;