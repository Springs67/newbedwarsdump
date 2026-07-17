-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local Indicator = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "items", "metal-detector", "indicator").Indicator;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local BlockHuntTeamId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-team-id").BlockHuntTeamId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local NearbyIndicator = RuntimeLib.import(script, script.Parent, "nearby-indicator").NearbyIndicator;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "BlockRadarController";
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
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p7);
    p7.Name = "BlockRadarController";
end;

function u5.KnitStart(p8) -- Line: 41
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p8);
end;

function u5.isRelevantItem(p9, p10) -- Line: 44
    -- upvalues: ItemType (copy)
    return p10.itemType == ItemType.BLOCK_RADAR;
end;

function u5.onEnable(u11, p12, p13) -- Line: 47
    -- upvalues: u1 (copy), u2 (copy), u4 (copy), Indicator (copy), Players (copy), RunService (copy), EntityUtil (copy), KnitClient (copy), BlockHuntTeamId (copy), Workspace (copy), NearbyIndicator (copy), SoundManager (copy), GameSound (copy)
    u11.directionalMaid = u1.new();
    local v14, u15 = u2.createBinding(UDim2.fromScale(0.5, 0.5));
    local v16, u17 = u2.createBinding(0);
    local u18 = u4.new();
    local u19 = u4.new();
    local u20 = u2.createRef();
    u11.directionalMaid:GiveTask(u18);
    u11.directionalMaid:GiveTask(u19);
    local u21 = u2.mount(u2.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true
    }, { u2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1,
            [u2.Ref] = u20
        }), u2.createElement(Indicator, {
            position = v14,
            rotation = v16,
            activatedSignal = u18
        }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
    u11.directionalMaid:GiveTask(function() -- Line: 72
        -- upvalues: u2 (ref), u21 (copy)
        u2.unmount(u21);
    end);
    u11.directionalMaid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 76
        -- upvalues: EntityUtil (ref), u11 (copy), KnitClient (ref), BlockHuntTeamId (ref), u20 (copy), Workspace (ref), u15 (copy), u17 (copy), u1 (ref), u2 (ref), NearbyIndicator (ref), u19 (copy), Players (ref), SoundManager (ref), GameSound (ref), u18 (copy)
        local v22 = EntityUtil:getLocalPlayerEntity();
        local v23;

        if v22 == nil then
            v23 = v22;
        else
            v23 = v22:getInstance():GetPivot().Position;
        end;

        if v22 == nil or v23 == nil then
            return nil;
        end;

        if u11.lastTrackedHiddenPlayer == nil then
            for _, v in KnitClient.Controllers.BlockDisguiseController:getDisguisedPlayers() do
                if not v.Character then
                    return nil;
                end;

                if (v.Character:GetPivot().Position - v23).Magnitude < 180 then
                    u11.lastTrackedHiddenPlayer = {
                        player = v,
                        nextBeep = time() + 2
                    };
                end;
            end;
        else
            local v24 = KnitClient.Controllers.TeamController:getPlayerTeam(u11.lastTrackedHiddenPlayer.player);

            if v24 ~= nil then
                v24 = v24.id;
            end;

            if u11.lastTrackedHiddenPlayer.player.Parent == nil or (not u11.lastTrackedHiddenPlayer.player.Character or (v24 == "" or (not v24 or v24 ~= BlockHuntTeamId.HIDERS))) then
                u11.lastTrackedHiddenPlayer = nil;

                return nil;
            end;

            local Position = u11.lastTrackedHiddenPlayer.player.Character:GetPivot().Position;
            local Magnitude = (Position - v23).Magnitude;

            if Magnitude > 180 then
                u11.lastTrackedHiddenPlayer = nil;

                return nil;
            end;

            if Magnitude > 45 then
                local nearbyMaid = u11.nearbyMaid;

                if nearbyMaid ~= nil then
                    nearbyMaid:DoCleaning();
                end;

                local v25 = u20:getValue();
                local AbsolutePosition = v25.AbsolutePosition;
                local AbsoluteSize = v25.AbsoluteSize;
                local v26 = Workspace.CurrentCamera:WorldToViewportPoint(Position);
                local v27 = Vector2.new(v26.X, v26.Y);

                if v26.Z < 0 then
                    v27 = AbsoluteSize + AbsolutePosition - v27 + AbsolutePosition;
                end;

                local v28 = v27 - AbsolutePosition;
                local v29 = math.atan2(v28.Y, v28.X);
                local v30 = AbsolutePosition + Vector2.new(math.cos(v29) * 80, math.sin(v29) * 80);
                u15(UDim2.fromOffset(v30.X, v30.Y));
                u17((math.deg(v29)));
            elseif not u11.nearbyMaid then
                u11.nearbyMaid = u1.new();
                local u31 = u2.mount(u2.createElement("ScreenGui", {
                    ResetOnSpawn = false,
                    IgnoreGuiInset = true
                }, { u2.createElement("Frame", {
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    }), u2.createElement(NearbyIndicator, {
                        activatedSignal = u19
                    }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
                u11.nearbyMaid:GiveTask(function() -- Line: 145
                    -- upvalues: u2 (ref), u31 (copy)
                    u2.unmount(u31);
                end);
            end;

            if u11.lastTrackedHiddenPlayer.nextBeep < time() then
                local v32 = {};

                for i, v in u11.lastTrackedHiddenPlayer do
                    v32[i] = v;
                end;

                v32.nextBeep = time() + 2;
                u11.lastTrackedHiddenPlayer = v32;

                if Magnitude > 45 then
                    SoundManager:playSound(GameSound.BLOCK_RADAR_FAR, {
                        position = nil,
                        volumeMultiplier = 0.5
                    });
                    u18:Fire(1);

                    return;
                end;

                SoundManager:playSound(GameSound.BLOCK_RADAR_NEAR, {
                    position = nil,
                    volumeMultiplier = 0.5
                });
                u19:Fire(1);
            end;
        end;
    end));
end;

function u5.onDisable(p33) -- Line: 190
    if p33.directionalMaid then
        p33.directionalMaid:DoCleaning();
        p33.directionalMaid = nil;
    end;

    if p33.nearbyMaid then
        local nearbyMaid = p33.nearbyMaid;

        if nearbyMaid ~= nil then
            nearbyMaid:DoCleaning();
        end;

        p33.nearbyMaid = nil;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;