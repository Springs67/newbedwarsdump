-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "SolarPanelController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 25
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SolarPanelController";
end;

function u4.KnitStart(p7) -- Line: 33
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u2 (copy), TweenService (copy), BalanceFile (copy), SoundManager (copy), GameSound (copy), RunService (copy)
    KnitController.KnitStart(p7);
    WatchCollectionTag("SolarPanel", function(u8) -- Line: 35
        -- upvalues: u2 (ref), TweenService (ref), BalanceFile (ref), SoundManager (ref), GameSound (ref), RunService (ref)
        local u9 = u2.new();
        local Inner = u8:WaitForChild("Generated").Inner;
        local Outer = u8.Generated.Outer;
        local u10 = u8.Fins.Frame:GetChildren();

        local function _(p11) -- Line: 41
            if p11:IsA("Beam") then
                return p11;
            end;
        end;

        local v12 = 0;
        local u13 = {};

        for i, descendant in Inner:GetDescendants() do
            local _ = i - 1;

            if not descendant:IsA("Beam") then
                local descendant = nil;
            end;

            if descendant ~= nil then
                v12 = v12 + 1;
                u13[v12] = descendant;
            end;
        end;

        Inner.Transparency = 1;
        Outer.Transparency = 1;
        local u14 = TweenService:Create(Inner, TweenInfo.new(BalanceFile.SOLAR_PANEL_RESOURCE_GEN_TIME), {
            Transparency = 0
        });
        local u15 = TweenService:Create(Outer, TweenInfo.new(BalanceFile.SOLAR_PANEL_RESOURCE_GEN_TIME), {
            Transparency = 0
        });

        local function _(p16) -- Line: 66
            -- upvalues: TweenService (ref), BalanceFile (ref)
            return TweenService:Create(p16, TweenInfo.new(BalanceFile.SOLAR_PANEL_RESOURCE_GEN_TIME / 6), {
                Brightness = 4,
                TextureSpeed = p16.TextureSpeed * 1.25
            });
        end;

        local u17 = 0;
        u8:GetAttributeChangedSignal("Active"):Connect(function() -- Line: 74
            -- upvalues: u8 (copy), u13 (copy), u17 (ref), u14 (copy), u15 (copy), u10 (copy), TweenService (ref), BalanceFile (ref), SoundManager (ref), GameSound (ref), Inner (copy), Outer (copy)
            local u18 = u8:GetAttribute("Active");

            local function _(p19) -- Line: 76
                -- upvalues: u18 (copy)
                p19.Enabled = u18;

                return p19.Enabled;
            end;

            for i, v in u13 do
                local _ = i - 1;
                v.Enabled = u18;
                local _ = v.Enabled;
            end;

            if u18 then
                local v20 = u17 + 1;
                u17 = v20;
                u14:Play();
                u15:Play();

                for _, v in u10 do
                    if not u8:GetAttribute("Active") or u17 ~= v20 then
                        return;
                    end;

                    for _, child in v:GetChildren() do
                        if child:IsA("Beam") then
                            TweenService:Create(child, TweenInfo.new(BalanceFile.SOLAR_PANEL_RESOURCE_GEN_TIME / 6), {
                                Brightness = 4,
                                TextureSpeed = child.TextureSpeed * 1.25
                            }):Play();
                            child.Enabled = u18;
                        end;

                        SoundManager:playSound(GameSound.SOLAR_PANEL_ENERGY, {
                            position = u8.Position
                        });
                    end;

                    task.wait(BalanceFile.SOLAR_PANEL_RESOURCE_GEN_TIME / 6);
                end;

                return;
            end;

            if u14.PlaybackState == Enum.PlaybackState.Playing then
                u14:Cancel();
            end;

            if u15.PlaybackState == Enum.PlaybackState.Playing then
                u15:Cancel();
            end;

            Inner.Transparency = 1;
            Outer.Transparency = 1;

            for _, v in u10 do
                for _, child in v:GetChildren() do
                    if child:IsA("Beam") then
                        child.Enabled = u18;
                        child.Brightness = 2;
                        child.TextureSpeed = 0.6;
                    end;
                end;
            end;
        end);
        task.spawn(function() -- Line: 125
            -- upvalues: u8 (copy), u9 (copy), RunService (ref)
            local Fins = u8.Fins;
            local u21 = 0;
            local u22 = Fins:GetPivot();
            u9:GiveTask(RunService.Heartbeat:Connect(function(p23) -- Line: 129
                -- upvalues: u8 (ref), u9 (ref), u21 (ref), u22 (copy), Fins (copy)
                if u8:GetAttribute("Active") == false then
                    return nil;
                end;

                if u8.Parent == nil then
                    u9:DoCleaning();

                    return nil;
                end;

                u21 = u21 + p23;
                Fins:PivotTo(u22 * CFrame.Angles(0, math.rad(12.566370614359172 * u21 / 2), 0));
            end));
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;