-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v1.MarketplaceService;
local Players = v1.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BattlePassLevelDevProducts = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-dev-products").BattlePassLevelDevProducts;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BattlePassController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p4);
    p4.Name = "BattlePassController";
    p4.remotes = default.Client:GetNamespace("BattlePass");
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: Players (copy), ClientStore (copy), BattlePassUtils (copy)
    Players.LocalPlayer:GetAttributeChangedSignal("BattlePassXP"):Connect(function() -- Line: 32
        -- upvalues: ClientStore (ref), Players (ref)
        ClientStore:dispatch({
            type = "BattlePassSetXP",
            experience = Players.LocalPlayer:GetAttribute("BattlePassXP")
        });
    end);
    ClientStore:dispatch({
        type = "BattlePassSetPaid",
        paid = Players.LocalPlayer:GetAttribute("BattlePassPaid")
    });
    Players.LocalPlayer:GetAttributeChangedSignal("BattlePassPaid"):Connect(function() -- Line: 42
        -- upvalues: ClientStore (ref), Players (ref)
        ClientStore:dispatch({
            type = "BattlePassSetPaid",
            paid = Players.LocalPlayer:GetAttribute("BattlePassPaid")
        });
    end);

    if BattlePassUtils.isActiveBattlePass() then
        p5.remotes:WaitFor("GetBattlePass"):andThen(function(p6) -- Line: 50
            -- upvalues: ClientStore (ref)
            ClientStore:dispatch({
                type = "BattlePassUpdateAll",
                battlePass = p6:CallServer()
            });
        end);
    end;
end;

function u2.promptPurchaseToLevel(p7, p8) -- Line: 60
    -- upvalues: BattlePassUtils (copy), ClientStore (copy), BattlePassLevelDevProducts (copy), MarketplaceService (copy), Players (copy)
    if not BattlePassUtils.isActiveBattlePass() then
        return nil;
    end;

    local v9 = p8 - ClientStore:getState().BattlePass.level;

    if v9 > 0 and v9 - 1 < #BattlePassLevelDevProducts then
        MarketplaceService:PromptProductPurchase(Players.LocalPlayer, BattlePassLevelDevProducts[v9 - 1 + 1]);
    end;
end;

function u2.promptBattlePassPurchase(p10) -- Line: 71
    -- upvalues: ClientStore (copy), BattlePassUtils (copy), MarketplaceService (copy), Players (copy)
    if not ClientStore:getState().BattlePass.paid and BattlePassUtils.isActiveBattlePassPaid() then
        MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, BattlePassUtils.BATTLE_PASS_SEASON_GAMEPASS);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;