-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local teamBuffMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-meta").teamBuffMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "TeamBuffController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 32
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "TeamBuffController";
end;

function u3.KnitStart(u6) -- Line: 40
    -- upvalues: KnitController (copy), default (copy), ClientSyncEvents (copy), KnitClient (copy), Players (copy), teamBuffMeta (copy), ColorUtil (copy), Theme (copy), Flamework (copy), BedwarsImageId (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u6);
    default.Client:Get("TeamBuffApplied"):Connect(function(p7) -- Line: 42
        -- upvalues: ClientSyncEvents (ref), KnitClient (ref), Players (ref), teamBuffMeta (ref), ColorUtil (ref), Theme (ref), Flamework (ref), BedwarsImageId (ref), EntityUtil (ref), u6 (copy), SoundManager (ref), GameSound (ref)
        ClientSyncEvents.TeamBuffApplied:fire(p7.teamId, p7.teamBuff);
        local v8 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);
        local v9 = teamBuffMeta[p7.teamBuff];

        if v8 and v8.id == p7.teamId then
            local v10 = not p7.user and "" or "<font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\"><b>" .. p7.user.DisplayName .. "</b></font> prayed to the Snake Shrine for <font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(137, 246, 146)) .. "\"><b>" .. v9.displayName .. "</b></font>!";
            local description = v9.description;

            if description ~= "" and description then
                local v11 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController");
                local v12 = {};
                local image = v9.image;

                if image == nil then
                    image = BedwarsImageId.SNAKE_ICON;
                end;

                v12.image = image;
                v12.message = v10;
                v11:sendInfoNotification(v12);
            end;

            local v13 = EntityUtil:getLocalPlayerEntity();

            if v9.applyVisualEffect and v13 then
                u6:playBlessEffect(v13);
                SoundManager:playSound(GameSound.SNAKE_BUFF);
            end;
        end;
    end);
end;

function u3.playBlessEffect(p14, u15) -- Line: 72
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), Workspace (copy), RunService (copy)
    local u16 = ReplicatedStorage.Assets.Effects.SnakeBless:Clone();
    CollectionService:AddTag(u16, "FirstPersonHidden");
    u16:PivotTo(u15:getInstance():GetPrimaryPartCFrame());
    task.delay(0.2, function() -- Line: 77
        -- upvalues: u16 (copy), Workspace (ref), RunService (ref), u15 (copy)
        u16.Parent = Workspace;

        local function _(p17) -- Line: 80
            if p17:IsA("Beam") then
                p17.Enabled = true;
            end;
        end;

        for i, descendant in u16:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Beam") then
                descendant.Enabled = true;
            end;
        end;

        local u18 = tick() + 1;
        local u19 = nil;
        u19 = RunService.Heartbeat:Connect(function() -- Line: 90
            -- upvalues: u18 (copy), u16 (ref), u19 (ref), u15 (ref)
            if u18 < tick() then
                u16:Destroy();
                u19:Disconnect();
            end;

            if tick() < u18 then
                u16:PivotTo(u15:getInstance():GetPrimaryPartCFrame());
            end;
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;