-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "PermissionController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy), Signal (copy)
    KnitController.constructor(p4);
    p4.Name = "PermissionController";
    p4.permissions = {};
    p4.isReady = false;
    p4.onPlayerReady = Signal.new();
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("PlayerPermsUpdate"):Connect(function(p6) -- Line: 32
        -- upvalues: u5 (copy)
        u5.permissions = p6;
        u5.isReady = true;
        u5.onPlayerReady:Fire(p6);
    end);
end;

function u2.waitForLocalPermissions(p7) -- Line: 38
    if p7.isReady then
        return p7.permissions;
    end;

    return p7.onPlayerReady:Wait();
end;

function u2.getLocalPermissions(p8) -- Line: 45
    return p8.permissions;
end;

function u2.hasPermission(p9, p10) -- Line: 48
    local v11 = p9:getLocalPermissions();

    if v11 then
        return table.find(v11, p10) ~= nil;
    end;

    return false;
end;

function u2.hasPermissions(p12, p13) -- Line: 56
    local u14 = p12:getLocalPermissions();

    if not u14 then
        return false;
    end;

    local function _(p15) -- Line: 62
        -- upvalues: u14 (copy)
        return table.find(u14, p15) ~= nil;
    end;

    local v16 = true;

    for i, v in p13 do
        local _ = i - 1;

        if table.find(u14, v) == nil then
            v16 = false;
            break;
        end;
    end;

    return v16;
end;

function u2.hasAnyPermissions(p17, p18) -- Line: 78
    local u19 = p17:getLocalPermissions();

    if not u19 then
        return false;
    end;

    local function _(p20) -- Line: 84
        -- upvalues: u19 (copy)
        return table.find(u19, p20) ~= nil;
    end;

    local v21 = false;

    for i, v in p18 do
        local _ = i - 1;

        if table.find(u19, v) ~= nil then
            v21 = true;
            break;
        end;
    end;

    return v21;
end;

function u2.isStaffMember(p22) -- Line: 100
    return p22:hasAnyPermissions({ "admin", "anticheat_mod", "artist", "director", "filmer", "mod" });
end;

function u2.hasAllKitsUnlocked(p23) -- Line: 103
    local v24 = p23:getLocalPermissions();

    if v24 ~= nil then
        v24 = table.find(v24, "all_kits") ~= nil;
    end;

    return v24 and true or false;
end;

function u2.hasAllKitSkinsUnlocked(p25) -- Line: 114
    local v26 = p25:getLocalPermissions();

    if v26 ~= nil then
        v26 = table.find(v26, "all_kit_skins") ~= nil;
    end;

    return v26 and true or false;
end;

function u2.canTesterAccessRankedSkins(p27) -- Line: 125
    -- upvalues: PlaceUtil (copy)
    local v28 = p27:waitForLocalPermissions();
    local v29 = PlaceUtil.isStaging();

    if v29 then
        v29 = table.find(v28, "tester") ~= nil;

        if v29 == nil then
            v29 = false;
        end;
    end;

    return v29;
end;

KnitClient.CreateController(u2.new());

return nil;