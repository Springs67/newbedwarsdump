-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnnouncementUtil = v1.AnnouncementUtil;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

local function v20(u5, p6) -- Line: 17
    -- upvalues: u3 (copy), u2 (copy), RunService (copy), SoundManager (copy), GameSound (copy), AnnouncementUtil (copy), UIUtil (copy), Flamework (copy), ColorUtil (copy), Padding (copy), Countdown (copy), Empty (copy)
    local _ = p6.useState;
    local useEffect = p6.useEffect;
    local u7 = u3.createRef();
    local u8 = u3.createRef();
    useEffect(function() -- Line: 22
        -- upvalues: u7 (copy), u8 (copy), u2 (ref), RunService (ref), SoundManager (ref), GameSound (ref), u5 (copy), AnnouncementUtil (ref), UIUtil (ref), Flamework (ref)
        local u9 = true;
        local u10 = u7:getValue();
        local u11 = u8:getValue();
        local u12 = u2.new();

        if not (u10 and u11) then
            return nil;
        end;

        u12:GiveTask(RunService.Heartbeat:Connect(function(p13) -- Line: 31
            -- upvalues: u11 (copy)
            u11.Rotation = (u11.Rotation + 360 * p13) % 360;
        end));
        task.spawn(function() -- Line: 36
            -- upvalues: u9 (ref), SoundManager (ref), GameSound (ref)
            while u9 do
                SoundManager:playSound(GameSound.COUNTDOWN_TICK);
                task.wait(1);
            end;
        end);
        local duration = u5.Announcement.duration;

        if duration == nil then
            duration = AnnouncementUtil.DEFAULT_DURATION;
        end;

        task.delay(duration - 0.3, function() -- Line: 47
            -- upvalues: UIUtil (ref), u10 (copy)
            UIUtil:setContainerTransparency(u10, 1, {
                onSetTweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Exponential)
            });
        end);
        task.delay(duration, function() -- Line: 52
            -- upvalues: u9 (ref), Flamework (ref), u5 (ref), SoundManager (ref), GameSound (ref)
            u9 = false;
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/announcement/announcement-controller@AnnouncementController"):endAnnouncement(u5.Announcement.important);
            SoundManager:playSound(GameSound.COUNTDOWN_GAMESTART);
        end);

        return function() -- Line: 57
            -- upvalues: u12 (copy), u9 (ref)
            u12:DoCleaning();
            u9 = false;
        end;
    end, {});
    local v14 = {
        ResetOnSpawn = false
    };
    local v15 = {};
    local v16 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.3, 0.175),
        Position = u5.Announcement.position or UDim2.fromScale(0.5, 0.5),
        [u3.Ref] = u7
    };
    local v17 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.025, 0)
        }) };
    local v18 = #v17;
    local v19;

    if u5.Announcement.message == "" then
        v19 = false;
    else
        v19 = u3.createFragment({
            Message = u3.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Text = string.upper(u5.Announcement.message),
                Size = UDim2.fromScale(1, 0.4),
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.GothamBlack
            }, { u3.createElement("UIStroke", {
                    Thickness = 1
                }) })
        });
    end;

    if v19 then
        v17[v18 + 1] = v19;
    end;

    local _ = #v17;
    v17.FirstDropTimeCountdown = u3.createElement("Frame", {
        BackgroundTransparency = 0.3,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.3, 0.6),
        BackgroundColor3 = ColorUtil.BLACK
    }, {
        u3.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.WHITE
        }, { u3.createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.3, 1), NumberSequenceKeypoint.new(1, 1) }),
                [u3.Ref] = u8
            }) }),
        u3.createElement(Padding, {
            Padding = UDim.new(0.1, 0)
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }),
        u3.createElement(Countdown, {
            EndTime = u5.Announcement.endTime,
            CountdownConfig = {
                days = false,
                hours = false,
                minutes = false
            }
        })
    });
    v15[#v15 + 1] = u3.createElement(Empty, v16, v17);

    return u3.createElement("ScreenGui", v14, v15);
end;

return {
    CircleCountdownAnnouncementComponent = v20,
    CircleCountdownAnnouncement = v4.new(u3)(v20)
};