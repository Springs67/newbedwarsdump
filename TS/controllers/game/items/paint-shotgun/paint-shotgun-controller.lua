-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MobileButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileButton;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local HttpService = v4.HttpService;
local Players = v4.Players;
local UserInputService = v4.UserInputService;
local Workspace = v4.Workspace;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local PaintShotgunConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "paint-shotgun", "paint-shotgun-constants").PaintShotgunConstants;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "PaintShotgunController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 37
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "PaintShotgunController";
    p7.maid = u2.new();
end;

function u5.KnitStart(p8) -- Line: 42
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p8);
end;

function u5.isRelevantItem(p9, p10) -- Line: 45
    -- upvalues: ItemType (copy)
    return p10.itemType == ItemType.PAINT_SHOTGUN;
end;

function u5.onEnable(u11, p12, p13) -- Line: 48
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), UserInputService (copy), u3 (copy), MobileButton (copy), BedwarsUI (copy), HttpService (copy), Flamework (copy)
    u11:setupYield(function() -- Line: 49
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), u11 (copy)
        local u14 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.PAINT_SHOTGUN_IDLE);

        if u14 then
            u11.maid:GiveTask(function() -- Line: 52
                -- upvalues: u14 (copy)
                u14:Stop();
            end);
        end;

        return function() -- Line: 56
            -- upvalues: u14 (copy)
            local v15 = u14;

            if v15 ~= nil then
                v15:Stop();
            end;
        end;
    end);

    if UserInputService.TouchEnabled then
        u11.maid:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p16, p17) -- Line: 65
            -- upvalues: u11 (copy)
            if not p17 then
                u11:fire();
            end;
        end));
        u11:setupYield(function() -- Line: 70
            -- upvalues: u3 (ref), MobileButton (ref), BedwarsUI (ref), u11 (copy), Players (ref)
            local u18 = u3.mount(u3.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u3.createElement(MobileButton, {
                    Image = "rbxassetid://6862310392",
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnPressDown = function() -- Line: 77, Name: OnPressDown
                        -- upvalues: u11 (ref)
                        u11:fire();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 82
                -- upvalues: u3 (ref), u18 (copy)
                u3.unmount(u18);
            end;
        end);
    end;

    local v19 = "shoot-shotgun:" .. HttpService:GenerateGUID(false);
    local v23 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = v19,

        boundFunction = function(p20, p21, p22) -- Line: 92, Name: boundFunction
            -- upvalues: u11 (copy)
            if p21 == Enum.UserInputState.Begin then
                u11:fire();
            end;
        end
    });
    u11.maid:GiveTask(v23);
end;

function u5.onDisable(p24) -- Line: 100
    p24.maid:DoCleaning();
end;

function u5.fire(u25) -- Line: 103
    -- upvalues: Flamework (copy), CooldownId (copy), PaintShotgunConstants (copy), Players (copy), Workspace (copy), default (copy), KnitClient2 (copy), KnitClient (copy), AnimationType (copy), GameAnimationUtil (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.PAINT_SHOTGUN) then
        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.PAINT_SHOTGUN) < 0.2 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(CooldownId.PAINT_SHOTGUN, "buffered-paint-shot", function() -- Line: 106
                -- upvalues: u25 (copy)
                u25:fire();
            end);
        end;

        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.PAINT_SHOTGUN, PaintShotgunConstants.COOLDOWN);
    local Character = Players.LocalPlayer.Character;

    if Character then
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.LookVector;
        end;

        if not CurrentCamera then
            return nil;
        end;

        local Position = Character:GetPrimaryPartCFrame().Position;
        local Position2 = Character:GetPrimaryPartCFrame().Position;
        Character:PivotTo(CFrame.new(Position, Position2 + CurrentCamera * Vector3.new(1, 0, 1)));
        local u26 = Character:GetPrimaryPartCFrame();
        default.Client:Get("ShootShotgun"):SendToServer(u26.Position, CurrentCamera);

        local function u27() -- Line: 131
            -- upvalues: u26 (copy), KnitClient2 (ref), KnitClient (ref), AnimationType (ref), GameAnimationUtil (ref), Players (ref), Character (copy)
            if u26 then
                KnitClient2.Controllers.ScreenShakeController:shake(u26.Position, u26 * Vector3.new(-0.25, 0, -1) - u26.Position, {
                    magnitude = 0.07,
                    duration = 0.15,
                    cycles = 2
                });
            end;

            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_PAINT_SHOTGUN_SHOOT);
            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.PAINT_SHOTGUN_SHOOT);
            KnitClient2.Controllers.PaintShotgunEffectsController:playShotgunEffect(Character);
        end;

        u27();
        task.delay(0.15, function() -- Line: 149
            -- upvalues: u27 (copy)
            u27();
        end);
    end;
end;

KnitClient.CreateController(u5.new());

return nil;