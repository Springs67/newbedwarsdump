-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local LobbyGadgetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "LobbyGadgetController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p3);
    p3.Name = "LobbyGadgetController";
    p3.lockerNamespace = default.Client:GetNamespace("Locker");
    p3.refillSet = {};
end;

function u1.KnitStart(u4) -- Line: 29
    -- upvalues: KnitController (copy), Players (copy)
    KnitController.KnitStart(u4);
    local LocalPlayer = Players.LocalPlayer;

    if LocalPlayer:GetAttribute("LobbyGadgetType") ~= nil then
        local v5 = LocalPlayer:GetAttribute("LobbyGadgetType");
        u4.lockerNamespace:Get("GiveLobbyGadget"):CallServer({
            lobbyGadget = v5
        });
        u4:setupGadgetRefill(LocalPlayer, v5);
    end;

    LocalPlayer:GetAttributeChangedSignal("LobbyGadgetType"):Connect(function() -- Line: 41
        -- upvalues: LocalPlayer (copy), u4 (copy)
        u4:setupGadgetRefill(LocalPlayer, (LocalPlayer:GetAttribute("LobbyGadgetType")));
    end);
end;

function u1.setupGadgetRefill(u6, u7, u8) -- Line: 46
    -- upvalues: LobbyGadgetMeta (copy)
    local u9 = {};
    local items = LobbyGadgetMeta[u8].items;

    if items ~= nil then
        local function _(p10) -- Line: 52
            -- upvalues: u9 (copy)
            if p10.refillable then
                table.insert(u9, p10);

                return nil;
            end;
        end;

        for i, v in items do
            local _ = i - 1;

            if v.refillable then
                table.insert(u9, v);
            end;
        end;
    end;

    local v11 = #u9 ~= 0;

    if v11 then
        v11 = not (u6.refillSet[u8] ~= nil);
    end;

    if v11 then
        u6.refillSet[u8] = true;

        local function _(p12) -- Line: 75
            -- upvalues: u6 (copy), u7 (copy), u8 (copy)
            u6:refillItemLoop(u7, p12, u8);
        end;

        for i, v in u9 do
            local _ = i - 1;
            u6:refillItemLoop(u7, v, u8);
        end;
    end;
end;

function u1.refillItemLoop(u13, u14, u15, u16) -- Line: 83
    -- upvalues: InventoryUtil (copy)
    local refillCooldown = u15.refillCooldown;
    local u17 = refillCooldown == nil and 4 or refillCooldown;
    task.defer(function() -- Line: 90
        -- upvalues: u17 (copy), u14 (copy), u16 (copy), u13 (copy), InventoryUtil (ref), u15 (copy)
        while true do
            local v18 = task.wait(u17);

            if v18 == 0 or (v18 ~= v18 or not v18) then
                return;
            end;

            if u14:GetAttribute("LobbyGadgetType") ~= u16 then
                u13.refillSet[u16] = nil;

                return nil;
            end;

            local function _(p19) -- Line: 103
                -- upvalues: u15 (ref)
                return p19.itemType == u15.itemType;
            end;

            local v20 = nil;

            for i, v in InventoryUtil.getInventory(u14).items do
                local _ = i - 1;

                if v.itemType == u15.itemType == true then
                    v20 = v;
                    break;
                end;
            end;

            local v21 = not v20;

            if not v21 then
                local amount = u15.amount;
                v21 = v20.amount < (amount == nil and 1 or amount);
            end;

            if v21 then
                u13.lockerNamespace:Get("RefillLobbyGadgetItem"):CallServer({
                    lobbyGadgetItem = u15
                });
            end;
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;