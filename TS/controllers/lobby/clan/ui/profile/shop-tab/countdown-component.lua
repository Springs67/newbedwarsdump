-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = {
    GameSound.COUNTDOWN_TICK_5,
    GameSound.COUNTDOWN_TICK_4,
    GameSound.COUNTDOWN_TICK_3,
    GameSound.COUNTDOWN_TICK_2,
    GameSound.COUNTDOWN_TICK_1
};

return {
    CountdownComponent = v3.new(u2)(function(u6, p7) -- Line: 14
        -- upvalues: Workspace (copy), StringUtil (copy), RunService (copy), SoundManager (copy), u5 (copy), GameSound (copy), u2 (copy), ColorUtil (copy)
        local useEffect = p7.useEffect;
        local v8, u9 = p7.useState("00:00:00:00");
        useEffect(function() -- Line: 18
            -- upvalues: u6 (copy), Workspace (ref), StringUtil (ref), RunService (ref), SoundManager (ref), u5 (ref), GameSound (ref), u9 (copy)
            local function u12() -- Line: 19
                -- upvalues: u6 (ref), Workspace (ref), StringUtil (ref)
                local v10 = u6.EndTime - Workspace:GetServerTimeNow();
                local v11 = math.max(0, v10);

                return StringUtil.formatCountdownTime(v11, u6.CountdownOptions or {
                    days = true,
                    hours = true,
                    seperator = " : "
                });
            end;

            local u13 = u6.EndTime - Workspace:GetServerTimeNow();
            local u14 = 0;
            local u15 = false;
            local u16 = 0;
            local u17 = "";
            local u18 = 0;
            local u24 = RunService.Heartbeat:Connect(function(p19) -- Line: 37
                -- upvalues: u14 (ref), u16 (ref), u18 (ref), u12 (copy), u6 (ref), u17 (ref), u13 (copy), u15 (ref), SoundManager (ref), u5 (ref), GameSound (ref), u9 (ref)
                u14 = u14 + p19;
                u16 = u16 + p19;

                if u18 < 0.2 then
                    u18 = u18 + p19;

                    return nil;
                end;

                u18 = 0;
                local v20 = u12();

                if u6.EnableCountdownSounds and v20 ~= u17 then
                    local v21 = math.round(u13 - u14);
                    local OnlyPlaySoundLastNSec = u6.OnlyPlaySoundLastNSec;

                    if (OnlyPlaySoundLastNSec == 0 or (OnlyPlaySoundLastNSec ~= OnlyPlaySoundLastNSec or not OnlyPlaySoundLastNSec)) and true or v21 <= u6.OnlyPlaySoundLastNSec then
                        local PlayCustomSoundAtTime = u6.PlayCustomSoundAtTime;

                        if PlayCustomSoundAtTime ~= nil then
                            PlayCustomSoundAtTime = PlayCustomSoundAtTime.timeLeftSec;
                        end;

                        local v22 = PlayCustomSoundAtTime ~= nil;

                        if v22 then
                            local PlayCustomSoundAtTime2 = u6.PlayCustomSoundAtTime;

                            if PlayCustomSoundAtTime2 ~= nil then
                                PlayCustomSoundAtTime2 = PlayCustomSoundAtTime2.timeLeftSec;
                            end;

                            v22 = v21 <= PlayCustomSoundAtTime2 and not u15;
                        end;

                        if v22 then
                            SoundManager:playSound(u6.PlayCustomSoundAtTime.sound);
                            u15 = true;
                        else
                            local v23;

                            if v21 <= 5 then
                                v23 = u5[math.max(v21 - 1, 0) + 1];
                            else
                                v23 = GameSound.COUNTDOWN_TICK;
                            end;

                            SoundManager:playSound(v23);
                        end;
                    end;

                    u17 = v20;
                end;

                u9(v20);
            end);

            return function() -- Line: 81
                -- upvalues: u24 (copy)
                u24:Disconnect();
            end;
        end, { u6.EndTime });
        local v25 = {};

        for i, v in u6 do
            v25[i] = v;
        end;

        v25.EndTime = nil;
        v25.PreText = nil;
        v25.CountdownOptions = nil;
        v25.MaxTextSize = nil;
        v25.EnableCountdownSounds = nil;
        v25.OnlyPlaySoundLastNSec = nil;
        v25.PlayCustomSoundAtTime = nil;
        v25[u2.Children] = nil;
        local v26 = {
            AutomaticSize = "Y",
            SizeConstraint = "RelativeXX",
            Size = UDim2.fromScale(1, 0)
        };
        local PreText = u6.PreText;
        v26.Text = ((PreText == "" or not PreText) and "" or u6.PreText) .. "<b>" .. v8 .. "</b>";
        v26.TextScaled = true;
        v26.RichText = true;
        v26.Font = "Roboto";
        v26.TextColor3 = ColorUtil.WHITE;
        v26.TextXAlignment = "Left";
        v26.TextYAlignment = "Center";
        v26.BackgroundTransparency = 1;
        v26.LayoutOrder = 2;

        for i, v in v25 do
            v26[i] = v;
        end;

        local v27 = {};
        local v28 = #v27;
        local v29 = {};
        local MaxTextSize = u6.MaxTextSize;
        v29.MaxTextSize = MaxTextSize == nil and 18 or MaxTextSize;
        v27[v28 + 1] = u2.createElement("UITextSizeConstraint", v29);
        local v30 = u6[u2.Children];

        if v30 then
            for i, v in v30 do
                if type(i) == "number" then
                    v27[v28 + 1 + i] = v;
                else
                    v27[i] = v;
                end;
            end;
        end;

        return u2.createFragment({
            RotationTimer = u2.createElement("TextLabel", v26, v27)
        });
    end)
};