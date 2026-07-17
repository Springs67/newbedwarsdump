-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local TournamentWinnerArrowBillboard = RuntimeLib.import(script, script.Parent, "tournament-winner-arrow-billboard").TournamentWinnerArrowBillboard;
local TournamentWinnerBillboard = RuntimeLib.import(script, script.Parent, "tournament-winner-billboard").TournamentWinnerBillboard;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "TournamentWinnerEmoteController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "TournamentWinnerEmoteController";
end;

function u4.KnitStart(p7) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), u2 (copy), TournamentWinnerBillboard (copy), TournamentWinnerArrowBillboard (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), TweenService (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(p7);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local TOURNAMENT_WINNER = EmoteType.TOURNAMENT_WINNER;
    local u8 = EmoteHandler;
    local u9 = setmetatable({}, {
        __tostring = function() -- Line: 45, Name: __tostring
            return "Anonymous";
        end,

        __index = u8
    });
    u9.__index = u9;

    function u9.new(...) -- Line: 51
        -- upvalues: u9 (ref)
        local v10 = setmetatable({}, u9);

        return v10:constructor(...) or v10;
    end;

    function u9.constructor(p11, ...) -- Line: 55
        -- upvalues: u8 (copy)
        u8.constructor(p11, ...);
    end;

    function u9.onEnable(p12, u13, p14, p15, u16) -- Line: 58
        -- upvalues: u2 (ref), TournamentWinnerBillboard (ref), TournamentWinnerArrowBillboard (ref), ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), TweenService (ref), WatchCharacterAnimation (ref), GameAnimationUtil (ref), AnimationType (ref)
        local u17 = u2.mount(u2.createElement(TournamentWinnerBillboard, {
            Character = p14
        }), p14, "TournamentWinnerBillboard");
        local u18 = u2.mount(u2.createElement(TournamentWinnerArrowBillboard, {
            Character = p14
        }), p14, "TournamentWinnerArrow");
        local u19 = ReplicatedStorage.Assets.Misc.TourneyPodium:Clone();
        local u20 = u19:FindFirstChild("3rdPlace");
        local u21 = u19:FindFirstChild("2ndPlace");
        local u22 = u19:FindFirstChild("1stPlace");
        u19.Parent = Workspace;

        local function _(p23) -- Line: 71
            -- upvalues: GameQueryUtil (ref)
            if p23:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p23, true);
                p23.CanCollide = false;
                p23.Anchored = true;
            end;
        end;

        for i, descendant in u19:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
                descendant.CanCollide = false;
                descendant.Anchored = true;
            end;
        end;

        u19:PivotTo(p14.LowerTorso.CFrame + Vector3.new(0, -6.2, 0));
        TweenService:Create(u20, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Position = u20.Position + Vector3.new(0, 6, 0)
        }):Play();
        TweenService:Create(u21, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Position = u21.Position + Vector3.new(0, 6, 0)
        }):Play();
        TweenService:Create(u22, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Position = u22.Position + Vector3.new(0, 6, 0)
        }):Play();
        local v24 = u22:GetDescendants();

        local function v26(p25) -- Line: 110
            -- upvalues: TweenService (ref)
            if p25:IsA("BasePart") then
                TweenService:Create(p25, TweenInfo.new(1.9, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Position = p25.Position + Vector3.new(0, 6, 0)
                }):Play();
            end;
        end;

        for i, v in v24 do
            v26(v, i - 1, v24);
        end;

        u16:GiveTask((WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.TOURNAMENT_WINNER) }, function(p27, p28) -- Line: 126
            -- upvalues: u13 (copy), u16 (copy), TweenService (ref), u20 (copy), u21 (copy), u22 (copy)
            if p27.UserId ~= u13 then
                return nil;
            end;

            if p28 ~= nil then
                p28 = p28:GetMarkerReachedSignal("Falling"):Connect(function() -- Line: 133
                    -- upvalues: TweenService (ref), u20 (ref), u21 (ref), u22 (ref)
                    TweenService:Create(u20, TweenInfo.new(0.52, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        Position = u20.Position + Vector3.new(0, -6, 0)
                    }):Play();
                    TweenService:Create(u21, TweenInfo.new(0.52, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        Position = u21.Position + Vector3.new(0, -6, 0)
                    }):Play();
                    TweenService:Create(u22, TweenInfo.new(0.52, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        Position = u22.Position + Vector3.new(0, -6, 0)
                    }):Play();
                    local v29 = u22:GetDescendants();

                    local function v31(p30) -- Line: 159
                        -- upvalues: TweenService (ref)
                        if p30:IsA("BasePart") then
                            TweenService:Create(p30, TweenInfo.new(0.52, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Position = p30.Position + Vector3.new(0, -6, 0)
                            }):Play();
                        end;
                    end;

                    for i, v in v29 do
                        v31(v, i - 1, v29);
                    end;
                end);
            end;

            u16:GiveTask(p28);
        end)));
        u16:GiveTask(function() -- Line: 180
            -- upvalues: u19 (copy), u2 (ref), u17 (copy), u18 (copy)
            u19:Destroy();
            u2.unmount(u17);
            u2.unmount(u18);
        end);
    end;

    function u9.onDisable(p32, p33, p34, p35) -- Line: 186
    end;

    EmoteHandlerController:registerHandler(TOURNAMENT_WINNER, u9);
end;

KnitClient.CreateController(u4.new());

return nil;