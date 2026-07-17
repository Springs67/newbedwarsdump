-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local UILayers = v1.UILayers;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local PlayerInfoBillboard = RuntimeLib.import(script, script.Parent, "ui", "player-info-billboard").PlayerInfoBillboard;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "PlayerProfileHighlightController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 28
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 32
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p8);
    p8.Name = "PlayerProfileHighlightController";
    p8.highlightMaid = u3.new();
end;

function u6.KnitStart(u9) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient (copy), Flamework (copy), UILayers (copy), u4 (copy), PlaceUtil (copy), GameQueryUtil (copy), Players (copy), DeviceUtil (copy), KnitClient2 (copy)
    KnitController.KnitStart(u9);
    KnitClient.Controllers.EntityHoverController:enable();
    KnitClient.Controllers.EntityHoverController:watchEntityMouseHover(function(p10) -- Line: 41
        -- upvalues: Flamework (ref), UILayers (ref), u9 (copy), u4 (ref), KnitClient (ref)
        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isLayerOpen(UILayers.MAIN) then
            return nil;
        end;

        local v11 = p10:getInstance();

        if v11:FindFirstChild("PlayerProfileHighlight") then
            return nil;
        end;

        local u12 = p10:getPlayer();

        if u12 then
            u9.highlightMaid:GiveTask(u4("Highlight", {
                Name = "PlayerProfileHighlight",
                FillTransparency = 1,
                OutlineTransparency = 0,
                Parent = v11,
                OutlineColor = Color3.fromRGB(255, 255, 255),
                FillColor = Color3.fromRGB(255, 255, 255),
                DepthMode = Enum.HighlightDepthMode.Occluded
            }));
            u9.highlightMaid:GiveTask(KnitClient.Controllers.MouseController:hookToMouseMovement(function(p13) -- Line: 60
                -- upvalues: u9 (ref), u12 (copy)
                u9:mountPlayerInfoBillboard(u12, (Vector3.new(p13.X * 1.02, p13.Y * 1.02, 0)));
            end));
        end;
    end);
    KnitClient.Controllers.EntityHoverController:watchEntityMouseUnHover(function(p14) -- Line: 67
        -- upvalues: u9 (copy)
        u9.highlightMaid:DoCleaning();
        u9:unmountPlayerInfoBillboard();
    end);

    if PlaceUtil.isLobbyServer() then
        KnitClient.Controllers.MouseController:hookToMouseClick(function(u15, u16) -- Line: 74
            -- upvalues: GameQueryUtil (ref), Players (ref), DeviceUtil (ref), KnitClient2 (ref), u9 (copy)
            local UnitRay = u15.UnitRay;
            local v17 = RaycastParams.new();
            local u18 = GameQueryUtil:raycast(UnitRay.Origin, UnitRay.Direction.Unit * 1000, v17);
            local v19 = Players:GetPlayers();
            local u20 = false;

            local function v23(p21) -- Line: 80
                -- upvalues: u18 (copy), Players (ref), DeviceUtil (ref), u16 (copy), KnitClient2 (ref), u15 (copy), u9 (ref), u20 (ref)
                local Character = p21.Character;
                local v22;

                if Character then
                    v22 = u18;

                    if v22 ~= nil then
                        v22 = v22.Instance;

                        if v22 ~= nil then
                            v22 = v22:IsDescendantOf(Character);
                        end;
                    end;
                else
                    v22 = Character;
                end;

                if v22 then
                    if p21 == Players.LocalPlayer then
                        return nil;
                    end;

                    if DeviceUtil.isMobileControls() then
                        if u16 then
                            KnitClient2.Controllers.PlayerProfileUIController:openPlayerProfile(p21);
                        else
                            u9:mountPlayerInfoBillboard(p21, (Vector3.new(u15.X * 1.02, u15.Y * 1.02, 0)));
                        end;
                    else
                        KnitClient2.Controllers.PlayerProfileUIController:openPlayerProfile(p21);
                    end;

                    u20 = true;

                    return nil;
                end;
            end;

            for i, v in v19 do
                v23(v, i - 1, v19);
            end;

            if not u20 then
                u9:unmountPlayerInfoBillboard();
            end;
        end);
    end;
end;

function u6.mountPlayerInfoBillboard(p24, p25, p26) -- Line: 121
    -- upvalues: DeviceUtil (copy), u5 (copy), PlayerInfoBillboard (copy), Players (copy)
    local Character = p25.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local v27 = DeviceUtil.isMobileControls() and "Double Tap" or "Click";

    if p24.playerInfoBillboard then
        p24.playerInfoBillboard = u5.update(p24.playerInfoBillboard, u5.createElement(PlayerInfoBillboard, {
            UserId = p25.UserId,
            HelperText = v27,
            ScreenPosition = p26
        }));

        return;
    end;

    p24.playerInfoBillboard = u5.mount(u5.createElement(PlayerInfoBillboard, {
        UserId = p25.UserId,
        HelperText = v27,
        ScreenPosition = p26
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u6.unmountPlayerInfoBillboard(p28) -- Line: 147
    -- upvalues: u5 (copy)
    if p28.playerInfoBillboard then
        u5.unmount(p28.playerInfoBillboard);
        p28.playerInfoBillboard = nil;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;