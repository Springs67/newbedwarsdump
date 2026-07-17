-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v2.MarketplaceService;
local Players = v2.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local DevProduct = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "KitContractController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 26
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p5);
    p5.Name = "KitContractController";
    p5.remotes = default.Client:GetNamespace("KitStat");
end;

function u3.KnitStart(p6) -- Line: 31
    -- upvalues: KnitController (copy), ClientStore (copy)
    KnitController.KnitStart(p6);
    p6.remotes:Get("UpdateKitStats"):Connect(function(p7) -- Line: 33
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "LobbyUpdateAllKitStatsProfiles",
            kitStatsProfiles = p7.kitStatsProfiles
        });
    end);
end;

function u3.getKitContractProfile(u8, u9, p10) -- Line: 40
    -- upvalues: ClientStore (copy), RuntimeLib (copy)
    local function _() -- Line: 41
        -- upvalues: u8 (copy), u9 (copy), ClientStore (ref)
        local v11 = u8.remotes:Get("GetKitContractProfile"):CallServerAsync(u9);
        v11:andThen(function(p12) -- Line: 43
            -- upvalues: ClientStore (ref), u9 (ref)
            if p12 then
                ClientStore:dispatch({
                    type = "LobbySetKitContractProfile",
                    kit = u9,
                    kitContractProfile = p12
                });
            end;
        end);

        return v11;
    end;

    if p10 then
        local v13 = u8.remotes:Get("GetKitContractProfile"):CallServerAsync(u9);
        v13:andThen(function(p14) -- Line: 43
            -- upvalues: ClientStore (ref), u9 (copy)
            if p14 then
                ClientStore:dispatch({
                    type = "LobbySetKitContractProfile",
                    kit = u9,
                    kitContractProfile = p14
                });
            end;
        end);

        return v13;
    end;

    local u15 = ClientStore:getState().Lobby.kitContractProfiles[u9];

    if u15 then
        return RuntimeLib.Promise.new(function(p16) -- Line: 62
            -- upvalues: u15 (copy)
            return p16(u15);
        end);
    end;

    local v17 = u8.remotes:Get("GetKitContractProfile"):CallServerAsync(u9);
    v17:andThen(function(p18) -- Line: 43
        -- upvalues: ClientStore (ref), u9 (copy)
        if p18 then
            ClientStore:dispatch({
                type = "LobbySetKitContractProfile",
                kit = u9,
                kitContractProfile = p18
            });
        end;
    end);

    return v17;
end;

function u3.getKitStats(u19, u20, p21) -- Line: 70
    -- upvalues: ClientStore (copy), RuntimeLib (copy)
    local function _() -- Line: 71
        -- upvalues: u19 (copy), u20 (copy), ClientStore (ref)
        local v22 = u19.remotes:Get("GetKitStats"):CallServerAsync(u20);
        v22:andThen(function(p23) -- Line: 73
            -- upvalues: ClientStore (ref), u20 (ref)
            if p23 then
                ClientStore:dispatch({
                    type = "LobbySetKitStatsProfile",
                    kit = u20,
                    kitStatsProfile = p23
                });
            end;
        end);

        return v22;
    end;

    if p21 then
        local v24 = u19.remotes:Get("GetKitStats"):CallServerAsync(u20);
        v24:andThen(function(p25) -- Line: 73
            -- upvalues: ClientStore (ref), u20 (copy)
            if p25 then
                ClientStore:dispatch({
                    type = "LobbySetKitStatsProfile",
                    kit = u20,
                    kitStatsProfile = p25
                });
            end;
        end);

        return v24;
    end;

    local u26 = ClientStore:getState().Lobby.kitStatsProfiles[u20];

    if u26 then
        return RuntimeLib.Promise.new(function(p27) -- Line: 92
            -- upvalues: u26 (copy)
            return p27(u26);
        end);
    end;

    local v28 = u19.remotes:Get("GetKitStats"):CallServerAsync(u20);
    v28:andThen(function(p29) -- Line: 73
        -- upvalues: ClientStore (ref), u20 (copy)
        if p29 then
            ClientStore:dispatch({
                type = "LobbySetKitStatsProfile",
                kit = u20,
                kitStatsProfile = p29
            });
        end;
    end);

    return v28;
end;

function u3.getKitsStats(u30, p31, p32) -- Line: 100
    -- upvalues: u1 (copy), ClientStore (copy), RuntimeLib (copy)
    local function _(p33) -- Line: 101
        -- upvalues: u30 (copy), u1 (ref), ClientStore (ref)
        local v34 = u30.remotes:Get("GetKitsStats"):CallServerAsync(p33);
        v34:andThen(function(p35) -- Line: 103
            -- upvalues: u1 (ref), ClientStore (ref)
            local function _(p36) -- Line: 105
                -- upvalues: ClientStore (ref)
                ClientStore:dispatch({
                    type = "LobbySetKitStatsProfile",
                    kit = p36[1],
                    kitStatsProfile = p36[2]
                });
            end;

            for i, v in u1.entries(p35) do
                local _ = i - 1;
                ClientStore:dispatch({
                    type = "LobbySetKitStatsProfile",
                    kit = v[1],
                    kitStatsProfile = v[2]
                });
            end;
        end);

        return v34;
    end;

    if p32 then
        local v37 = u30.remotes:Get("GetKitsStats"):CallServerAsync(p31);
        v37:andThen(function(p38) -- Line: 103
            -- upvalues: u1 (ref), ClientStore (ref)
            local function _(p39) -- Line: 105
                -- upvalues: ClientStore (ref)
                ClientStore:dispatch({
                    type = "LobbySetKitStatsProfile",
                    kit = p39[1],
                    kitStatsProfile = p39[2]
                });
            end;

            for i, v in u1.entries(p38) do
                local _ = i - 1;
                ClientStore:dispatch({
                    type = "LobbySetKitStatsProfile",
                    kit = v[1],
                    kitStatsProfile = v[2]
                });
            end;
        end);

        return v37;
    end;

    local u40 = {};

    local function _(p41) -- Line: 127
        -- upvalues: ClientStore (ref), u40 (copy)
        local v42 = ClientStore:getState().Lobby.kitStatsProfiles[p41];

        if v42 then
            u40[p41] = v42;
        end;
    end;

    for i, v in p31 do
        local _ = i - 1;
        local v43 = ClientStore:getState().Lobby.kitStatsProfiles[v];

        if v43 then
            u40[v] = v43;
        end;
    end;

    local v44 = 0;

    for _ in u40 do
        v44 = v44 + 1;
    end;

    if v44 == #p31 then
        return RuntimeLib.Promise.new(function(p45) -- Line: 147
            -- upvalues: u40 (copy)
            return p45(u40);
        end);
    end;

    local u46 = u1.keys(u40);

    local function _(p47) -- Line: 154
        -- upvalues: u46 (copy)
        return table.find(u46, p47) == nil;
    end;

    local v48 = 0;
    local v49 = {};

    for i, v in p31 do
        local _ = i - 1;

        if table.find(u46, v) == nil == true then
            v48 = v48 + 1;
            v49[v48] = v;
        end;
    end;

    local all = RuntimeLib.Promise.all;
    local v50 = {};
    local v52 = RuntimeLib.Promise.new(function(p51) -- Line: 169
        -- upvalues: u40 (copy)
        return p51(u40);
    end);
    local v53 = u30.remotes:Get("GetKitsStats"):CallServerAsync(v49);
    v53:andThen(function(p54) -- Line: 103
        -- upvalues: u1 (ref), ClientStore (ref)
        local function _(p55) -- Line: 105
            -- upvalues: ClientStore (ref)
            ClientStore:dispatch({
                type = "LobbySetKitStatsProfile",
                kit = p55[1],
                kitStatsProfile = p55[2]
            });
        end;

        for i, v in u1.entries(p54) do
            local _ = i - 1;
            ClientStore:dispatch({
                type = "LobbySetKitStatsProfile",
                kit = v[1],
                kitStatsProfile = v[2]
            });
        end;
    end);
    v50[1], v50[2] = v52, v53;

    return all(v50):andThen(function(p56) -- Line: 172
        local v57 = p56[2];
        local v58 = {};

        for i, v in p56[1] do
            v58[i] = v;
        end;

        for i, v in v57 do
            v58[i] = v;
        end;

        return v58;
    end);
end;

function u3.promptPurchaseToContract(p59, p60) -- Line: 188
    -- upvalues: default (copy), MarketplaceService (copy), Players (copy), DevProduct (copy)
    default.Client:Get("AttemptKitContractPurchase"):SendToServer({
        kit = p60
    });
    MarketplaceService:PromptProductPurchase(Players.LocalPlayer, DevProduct.KIT_CONTRACT);
end;

KnitClient.CreateController(u3.new());

return nil;