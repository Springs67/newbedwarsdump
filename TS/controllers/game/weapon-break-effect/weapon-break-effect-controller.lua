-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsMelees = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedwarsMelees;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeaponBreakEffect = RuntimeLib.import(script, script.Parent, "weapon-break-effect").WeaponBreakEffect;
local DIAMOND_SWORD = ItemType.DIAMOND_SWORD;

local function _(p2) -- Line: 15
    -- upvalues: DIAMOND_SWORD (copy)
    return p2 == DIAMOND_SWORD;
end;

local v3 = -1;

for i, v in BedwarsMelees do
    local _ = i - 1;

    if v == DIAMOND_SWORD == true then
        v3 = i - 1;
        break;
    end;
end;

local u4 = v3 == -1 and 6 or v3;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "WeaponBreakEffectController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 39
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 43
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "WeaponBreakEffectController";
end;

function u5.KnitStart(u8) -- Line: 47
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), BedwarsMelees (copy), u4 (copy), default (copy), Players (copy), getItemMeta (copy), u1 (copy), WeaponBreakEffect (copy)
    KnitController.KnitStart(u8);
    ClientSyncEvents.ItemAdded:connect(function(u9) -- Line: 49
        -- upvalues: BedwarsMelees (ref), u4 (ref), u8 (copy)
        local function _(p10) -- Line: 50
            -- upvalues: u9 (copy)
            return p10 == u9.item.Name;
        end;

        local v11 = -1;

        for i, v in BedwarsMelees do
            local _ = i - 1;

            if v == u9.item.Name == true then
                v11 = i - 1;
                break;
            end;
        end;

        if v11 ~= -1 then
            if v11 < u4 then
                u8.currentWeapon = nil;

                return;
            end;

            u8.currentWeapon = u9.item.Name;
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p12) -- Line: 72
        -- upvalues: Players (ref), u8 (copy), getItemMeta (ref), u1 (ref), WeaponBreakEffect (ref)
        if p12.entityInstance ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if not u8.currentWeapon then
            return nil;
        end;

        local image = getItemMeta(u8.currentWeapon).image;

        if image == "" or not image then
            return nil;
        end;

        local u13 = u1.mount(u1.createElement(WeaponBreakEffect, {
            WeaponImage = image
        }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        task.delay(5, function() -- Line: 86
            -- upvalues: u1 (ref), u13 (copy)
            u1.unmount(u13);
        end);
    end);
end;

KnitClient.CreateController(u5.new());

return nil;