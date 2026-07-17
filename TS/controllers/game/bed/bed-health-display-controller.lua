-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BedHealthBarUi = RuntimeLib.import(script, script.Parent, "ui", "bed-health-bar-ui").BedHealthBarUi;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "BedHealthDisplayController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "BedHealthDisplayController";
    p5.bedHealthBillboardsDisabled = false;
end;

function u3.KnitStart(u6) -- Line: 36
    -- upvalues: KnitController (copy), KnitClient (copy), GameSound (copy), WatchCollectionTag (copy), BlockEngine (copy), getItemMeta (copy), ItemType (copy), ClientStore (copy), ClientSyncEvents (copy), default (copy)
    KnitController.KnitStart(u6);

    if u6.bedHealthBillboardsDisabled then
        return nil;
    end;

    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.BED_DAMAGED_ALERT_OVERLAY, GameSound.BED_DAMAGED_ALERT_OVERLAY }
    });
    WatchCollectionTag("bed", function(u7) -- Line: 44
        -- upvalues: u6 (copy), BlockEngine (ref), getItemMeta (ref), ItemType (ref), ClientStore (ref), ClientSyncEvents (ref)
        u6:mountBedHealthBarDisplay(u7);
        local u8 = BlockEngine:getStore():getBlockData(BlockEngine:getBlockPosition(u7.Position));
        local u9 = u7:GetAttribute("TeamId");

        if not u8 then
            return nil;
        end;

        local u10 = u8:GetAttribute("Health");

        if u10 == nil then
            u10 = u7:GetAttribute("MaxHealth");

            if u10 == nil then
                local block = getItemMeta(ItemType.BED).block;

                if block ~= nil then
                    block = block.health;
                end;

                u10 = block == nil and 24 or block;
            end;
        end;

        local u11 = u10;
        ClientStore:dispatch({
            type = "SetBedHealth",
            teamId = u9,
            bedHealth = u11,
            maxBedHealth = u10
        });
        local v12 = u7:GetAttribute("BedPlatingAmount");
        local u13 = v12 == nil and 0 or v12;
        local u14 = u13;
        u8:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 80
            -- upvalues: u8 (copy), u11 (ref), ClientSyncEvents (ref), u9 (copy), u14 (ref), ClientStore (ref), u10 (copy)
            local v15 = u8:GetAttribute("Health");
            local v16;

            if v15 == 0 or (v15 ~= v15 or not v15) then
                v16 = v15;
            else
                v16 = v15 < u11;
            end;

            if v16 ~= 0 and (v16 == v16 and v16) then
                u11 = v15;
                ClientSyncEvents.BedDamaged:fire(u9, u11, u14, false);
                ClientStore:dispatch({
                    type = "SetBedHealth",
                    teamId = u9,
                    bedHealth = u11,
                    maxBedHealth = u10
                });
            end;
        end);
        u7:GetAttributeChangedSignal("BedPlatingAmount"):Connect(function() -- Line: 97
            -- upvalues: u7 (copy), u13 (ref), u14 (ref), ClientSyncEvents (ref), u9 (copy), u11 (ref), ClientStore (ref)
            local v17 = u7:GetAttribute("BedPlatingAmount");
            local v18 = v17 == nil and 0 or v17;

            if u13 < v18 then
                u13 = v18;
            end;

            local v19;

            if v18 == 0 or (v18 ~= v18 or not v18) then
                v19 = v18;
            else
                v19 = v18 < u14;
            end;

            if v19 ~= 0 and (v19 == v19 and v19) then
                u14 = v18;
                ClientSyncEvents.BedDamaged:fire(u9, u11, u14, true);
                ClientStore:dispatch({
                    type = "SetBedPlatingHealth",
                    teamId = u9,
                    platingHealth = u14,
                    maxPlatingHealth = u13
                });
            end;
        end);
    end);
    WatchCollectionTag("InflatableBed", function(u20) -- Line: 122
        -- upvalues: u6 (copy), BlockEngine (ref), getItemMeta (ref), ItemType (ref), ClientStore (ref), ClientSyncEvents (ref)
        u6:mountBedHealthBarDisplay(u20);
        local u21 = u20:GetAttribute("TeamId");
        local v22 = BlockEngine:getStore():getBlockData(BlockEngine:getBlockPosition(u20.Position));

        if not v22 then
            return nil;
        end;

        local u23 = v22:GetAttribute("Health");

        if u23 == nil then
            u23 = u20:GetAttribute("MaxHealth");

            if u23 == nil then
                local block = getItemMeta(ItemType.INFLATABLE_BED).block;

                if block ~= nil then
                    block = block.health;
                end;

                u23 = block == nil and 24 or block;
            end;
        end;

        local u24 = u23;
        ClientStore:dispatch({
            type = "SetBedHealth",
            teamId = u21,
            bedHealth = u24,
            maxBedHealth = u23
        });
        local v25 = u20:GetAttribute("BedPlatingAmount");
        local u26 = v25 == nil and 0 or v25;
        local u27 = u26;
        v22:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 157
            -- upvalues: u20 (copy), u24 (ref), ClientSyncEvents (ref), u21 (copy), u27 (ref), ClientStore (ref), u23 (copy)
            local v28 = u20:GetAttribute("Health");
            local v29;

            if v28 == 0 or (v28 ~= v28 or not v28) then
                v29 = v28;
            else
                v29 = v28 < u24;
            end;

            if v29 ~= 0 and (v29 == v29 and v29) then
                u24 = v28;
                ClientSyncEvents.BedDamaged:fire(u21, u24, u27, false);
                ClientStore:dispatch({
                    type = "SetBedHealth",
                    teamId = u21,
                    bedHealth = u24,
                    maxBedHealth = u23
                });
            end;
        end);
        u20:GetAttributeChangedSignal("BedPlatingAmount"):Connect(function() -- Line: 174
            -- upvalues: u20 (copy), u26 (ref), u27 (ref), ClientSyncEvents (ref), u21 (copy), u24 (ref), ClientStore (ref)
            local v30 = u20:GetAttribute("BedPlatingAmount");
            local v31 = v30 == nil and 0 or v30;

            if u26 < v31 then
                u26 = v31;
            end;

            local v32;

            if v31 == 0 or (v31 ~= v31 or not v31) then
                v32 = v31;
            else
                v32 = v31 < u27;
            end;

            if v32 ~= 0 and (v32 == v32 and v32) then
                u27 = v31;
                ClientSyncEvents.BedDamaged:fire(u21, u24, u27, true);
                ClientStore:dispatch({
                    type = "SetBedPlatingHealth",
                    teamId = u21,
                    platingHealth = u27,
                    maxPlatingHealth = u26
                });
            end;
        end);
    end);
    default.Client:Get("AddBedPlating"):Connect(function(p33) -- Line: 200
        -- upvalues: ClientStore (ref)
        local v34 = p33:GetAttribute("TeamId");
        local v35 = p33:GetAttribute("BedPlatingAmount");
        local v36 = v35 == nil and 0 or v35;
        ClientStore:dispatch({
            type = "SetBedPlatingHealth",
            teamId = v34,
            platingHealth = v36,
            maxPlatingHealth = v36
        });
    end);
end;

function u3.mountBedHealthBarDisplay(p37, u38) -- Line: 216
    -- upvalues: u1 (copy), u2 (copy), BedHealthBarUi (copy), Players (copy)
    if p37.bedHealthBillboardsDisabled then
        return nil;
    end;

    local u39 = u1.new();
    local u40 = u2.mount(u2.createElement(BedHealthBarUi, {
        BedBlock = u38,
        PlatingExpireTime = u38:GetAttribute("BedPlatingExpireTime"),
        ShieldExpireTime = u38:GetAttribute("BedShieldEndTime")
    }), Players.LocalPlayer:WaitForChild("PlayerGui"), "BedHealthBarDisplay");

    local function u41() -- Line: 227
        -- upvalues: u40 (ref), u2 (ref), BedHealthBarUi (ref), u38 (copy)
        u40 = u2.update(u40, u2.createElement(BedHealthBarUi, {
            BedBlock = u38,
            PlatingExpireTime = u38:GetAttribute("BedPlatingExpireTime"),
            ShieldExpireTime = u38:GetAttribute("BedShieldEndTime")
        }));
    end;

    u39:GiveTask(u38:GetAttributeChangedSignal("BedPlatingExpireTime"):Connect(function() -- Line: 234
        -- upvalues: u41 (copy)
        u41();
    end));
    u39:GiveTask(u38:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function() -- Line: 237
        -- upvalues: u41 (copy)
        u41();
    end));
    u38.Destroying:Connect(function() -- Line: 240
        -- upvalues: u2 (ref), u40 (ref), u39 (copy)
        u2.unmount(u40);
        u39:DoCleaning();
    end);
end;

function u3.removeBedHealthBillboards(p42) -- Line: 245
    -- upvalues: Players (copy)
    local function _(p43) -- Line: 247
        if p43.Name == "BedHealthBillboard" then
            p43:Destroy();
        end;
    end;

    for i, child in Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren() do
        local _ = i - 1;

        if child.Name == "BedHealthBillboard" then
            child:Destroy();
        end;
    end;
end;

function u3.disableBedHealthBillboards(p44) -- Line: 256
    p44.bedHealthBillboardsDisabled = true;
end;

KnitClient.CreateController(u3.new());

return nil;