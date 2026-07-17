-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GiveItemOnCooldownApp = RuntimeLib.import(script, script.Parent, "ui", "item-on-cooldown-timer").GiveItemOnCooldownApp;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "GiveItemOnCooldownController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 23
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p5);
    p5.Name = "GiveItemOnCooldownController";
    p5.createItemOnCdRemote = default.Client:Get("CreateItemOnCd");
    p5.destroyItemOnCdRemote = default.Client:Get("DestroyItemOnCd");
    p5.itemMaidMap = {};
end;

function u3.KnitStart(u6) -- Line: 30
    -- upvalues: KnitController (copy), u1 (copy), KnitClient (copy), u2 (copy), GiveItemOnCooldownApp (copy)
    KnitController.KnitStart(u6);
    u6.createItemOnCdRemote:Connect(function(p7) -- Line: 32
        -- upvalues: u1 (ref), KnitClient (ref), u2 (ref), GiveItemOnCooldownApp (ref), u6 (copy)
        local v8 = u1.new();
        local u9 = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u2.createElement(GiveItemOnCooldownApp, {
            itemType = p7.itemType,
            interval = p7.interval,
            maxAmount = p7.maxAmount
        }));
        v8:GiveTask(function() -- Line: 39
            -- upvalues: u2 (ref), u9 (copy)
            u2.unmount(u9);
        end);
        u6.itemMaidMap[p7.itemType] = v8;
    end);
    u6.destroyItemOnCdRemote:Connect(function(p10) -- Line: 46
        -- upvalues: u6 (copy)
        local v11 = u6.itemMaidMap[p10.itemType];

        if v11 ~= nil then
            v11:DoCleaning();
        end;

        u6.itemMaidMap[p10.itemType] = nil;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;