-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local HotPotatoConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "hot-potato", "hot-potato-config").HotPotatoConfig;
local HotPotatoTeamId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "hot-potato", "hot-potato-team-id").HotPotatoTeamId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "HotPotatoGameController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 32
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 36
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p8, { GameType.HOT_POTATO });
    p8.Name = "HotPotatoGameController";
    p8.potatoHeads = {};
    p8.roundEndTime = (1 / 0);
    p8.startTime = nil;
    p8.effectMap = {};
end;

function u6.onGameInit(u9) -- Line: 44
    -- upvalues: KnitClient (copy), GameSound (copy), WatchCharacter (copy), Players (copy), EntityUtil (copy), u4 (copy), default (copy), u3 (copy), ReplicatedStorage (copy), ImageId (copy), RunService (copy), HotPotatoConfig (copy), HotPotatoTeamId (copy), u2 (copy), SoundManager (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.SPEED_BOOST }
    });
    WatchCharacter(function(u10, u11) -- Line: 48
        -- upvalues: u9 (copy), Players (ref), KnitClient (ref)
        u11:GetAttributeChangedSignal("ItemSpeedBoost"):Connect(function() -- Line: 49
            -- upvalues: u11 (copy), u9 (ref), u10 (copy), Players (ref), KnitClient (ref)
            if u11:GetAttribute("ItemSpeedBoost") ~= nil then
                u9:createSpeedBoostEffect(u10);

                if Players.LocalPlayer == u10 then
                    u9.speedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                        blockSprint = false,
                        moveSpeedMultiplier = u11:GetAttribute("ItemSpeedBoost")
                    });
                end;
            else
                u9:removeSpeedBoostEffect(u10);

                if Players.LocalPlayer == u10 then
                    local speedMaid = u9.speedMaid;

                    if speedMaid ~= nil then
                        speedMaid:Destroy();
                    end;

                    u9.speedMaid = nil;
                end;
            end;
        end);
    end);
    WatchCharacter(function(p12, p13) -- Line: 71
        -- upvalues: EntityUtil (ref), u4 (ref)
        local v14 = EntityUtil:getEntity(p12);

        if not v14 then
            return nil;
        end;

        v14:hideNametag();
        u4("Highlight", {
            Name = "HotPotatoHighlight",
            FillTransparency = 1,
            OutlineTransparency = 1,
            Parent = p12.Character,
            OutlineColor = Color3.fromRGB(71, 217, 255)
        });
    end);
    default.Client:OnEvent("HotPotatoHead", function(p15) -- Line: 85
        -- upvalues: u3 (ref), ReplicatedStorage (ref), u4 (ref), ImageId (ref), u9 (copy)
        local Character = p15.player.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("HotPotatoHighlight");
        end;

        if p15.giveHotPotato then
            local v16 = u3.new();
            local v17 = ReplicatedStorage.Assets.Misc.HotPotatoHead:Clone();
            v17.Parent = p15.player.Character;
            v16:GiveTask(v17);

            for _, v in Enum.NormalId:GetEnumItems() do
                u4("Decal", {
                    Transparency = 1,
                    Parent = v17.Handle,
                    Texture = ImageId.PIXEL,
                    Face = v,
                    Color3 = Color3.fromRGB(255, 66, 66)
                });
            end;

            u9.potatoHeads[p15.player.UserId] = v16;

            if Character then
                Character.OutlineColor = Color3.fromRGB(255, 66, 66);
                Character.OutlineTransparency = 1;
            end;
        else
            local v18 = u9.potatoHeads[p15.player.UserId];

            if v18 ~= nil then
                v18:DoCleaning();
            end;

            u9.potatoHeads[p15.player.UserId] = nil;

            if Character then
                Character.OutlineColor = Color3.fromRGB(71, 217, 255);
                Character.OutlineTransparency = 1;
            end;
        end;
    end);
    default.Client:OnEvent("HotPotatoSetRoundEnd", function(p19) -- Line: 128
        -- upvalues: u9 (copy)
        local startTime = u9.startTime;

        if startTime == 0 or (startTime ~= startTime or not startTime) then
            u9.startTime = os.time();
        end;

        u9.roundEndTime = u9.startTime + p19.roundEndTime;
    end);
    local u20 = 0;
    local u21 = 0;
    RunService.Heartbeat:Connect(function(p22) -- Line: 137
        -- upvalues: u9 (copy), HotPotatoConfig (ref), u20 (ref), u21 (ref), KnitClient (ref), HotPotatoTeamId (ref), Players (ref), u2 (ref), ReplicatedStorage (ref), SoundManager (ref), GameSound (ref)
        local v23 = u9.roundEndTime - os.time();

        if v23 >= HotPotatoConfig.TRIGGER__EXPLOSION_WARNING_THRESOLD_SECONDS then
            u20 = 0;
            u21 = 0;

            return;
        end;

        local v24 = v23 / HotPotatoConfig.TRIGGER__EXPLOSION_WARNING_THRESOLD_SECONDS;

        if v24 <= HotPotatoConfig.MAX_FLASHING_RATE_SECONDS then
            v24 = HotPotatoConfig.MAX_FLASHING_RATE_SECONDS;
        end;

        u20 = v24;
        u21 = u21 + p22;

        if u21 <= u20 then
            return nil;
        end;

        u21 = 0;
        local v25 = KnitClient.Controllers.TeamController:getTeamById(HotPotatoTeamId.COLD);

        if v25 ~= nil then
            local function _(p26) -- Line: 150
                -- upvalues: Players (ref), u20 (ref)
                local v27 = Players:GetPlayerByUserId(p26.userId);

                if v27 ~= nil then
                    v27 = v27.Character;

                    if v27 ~= nil then
                        v27 = v27:FindFirstChildWhichIsA("Highlight");
                    end;
                end;

                if v27 then
                    v27.OutlineTransparency = u20;
                end;
            end;

            for _, v in v25.members do
                local v28 = Players:GetPlayerByUserId(v.userId);

                if v28 ~= nil then
                    v28 = v28.Character;

                    if v28 ~= nil then
                        v28 = v28:FindFirstChildWhichIsA("Highlight");
                    end;
                end;

                if v28 then
                    v28.OutlineTransparency = u20;
                end;
            end;
        end;

        for _, v in u2.keys(u9.potatoHeads) do
            local v29 = Players:GetPlayerByUserId(v);

            if v29 then
                local Character = v29.Character;

                if Character then
                    local v30 = Character:WaitForChild(ReplicatedStorage.Assets.Misc.HotPotatoHead.Name);

                    if v30 then
                        local v31 = v30:GetAttribute("toggle");
                        local v32;

                        if v31 == 0 or v31 ~= v31 then
                            v32 = false;
                        elseif v31 == "" then
                            v32 = false;
                        else
                            v32 = v31;
                        end;

                        v30:SetAttribute("toggle", not v32);

                        if v31 ~= 0 and (v31 == v31 and (v31 ~= "" and v31)) then
                            SoundManager:playSound(GameSound.BEEPING, {
                                volumeMultiplier = 0.3,
                                position = v30.Handle.Position,
                                playbackSpeedMultiplier = math.log(1 / u20) + 0.5
                            });
                        end;

                        for _, child in v30.Handle:GetChildren() do
                            if child:IsA("Decal") then
                                child.Transparency = (v31 == 0 or (v31 ~= v31 or (v31 == "" or not v31))) and 1 or 0;
                            end;
                        end;

                        local HotPotatoHighlight = Character:FindFirstChild("HotPotatoHighlight");

                        if HotPotatoHighlight then
                            HotPotatoHighlight.OutlineTransparency = (v31 == 0 or (v31 ~= v31 or (v31 == "" or not v31))) and 1 or 0;
                        end;
                    end;
                end;
            end;
        end;
    end);
end;

function u6.createSpeedBoostEffect(p33, p34) -- Line: 206
    -- upvalues: ReplicatedStorage (copy), u4 (copy)
    local Character = p34.Character;

    if not (Character and Character.PrimaryPart) then
        return nil;
    end;

    local v35 = ReplicatedStorage.Assets.Effects.SpeedBoostEffect:Clone();
    v35.Position = Character.PrimaryPart.Position;
    v35.Parent = Character;
    u4("WeldConstraint", {
        Part0 = v35,
        Part1 = Character.PrimaryPart,
        Parent = v35
    });
    p33.effectMap[p34] = v35;
end;

function u6.removeSpeedBoostEffect(p36, p37) -- Line: 223
    local v38 = p36.effectMap[p37];

    if v38 ~= nil then
        v38:Destroy();
    end;

    p36.effectMap[p37] = nil;
end;

KnitClient.CreateController(u6.new());

return nil;