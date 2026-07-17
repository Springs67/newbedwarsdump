-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local TimerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "timer-util").TimerUtil;
local v14 = v4.new(u3)(function(u6, p7) -- Line: 14
    -- upvalues: u2 (copy), MatchState (copy), Workspace (copy), TimerUtil (copy), u3 (copy), TopBarCard (copy), BedwarsImageId (copy), ColorUtil (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local v8, u9 = useState("00:00");
    local u10, _ = useState(u2.new());
    useEffect(function() -- Line: 20
        -- upvalues: u6 (copy), MatchState (ref), u10 (copy), Workspace (ref), u9 (copy), TimerUtil (ref)
        if u6.MatchStartTime == nil then
            return nil;
        end;

        if u6.MatchState == MatchState.POST then
            u10:DoCleaning();

            return nil;
        end;

        if u6.MatchState ~= MatchState.RUNNING then
            return nil;
        end;

        local u11 = true;

        local function u13() -- Line: 33
            -- upvalues: u11 (ref), Workspace (ref), u6 (ref), u9 (ref), TimerUtil (ref), u13 (ref)
            task.delay(1, function() -- Line: 34
                -- upvalues: u11 (ref), Workspace (ref), u6 (ref), u9 (ref), TimerUtil (ref), u13 (ref)
                if not u11 then
                    return nil;
                end;

                local v12 = Workspace:GetServerTimeNow() - u6.MatchStartTime;
                u9(TimerUtil.getTimeString(v12));
                u13();
            end);
        end;

        u13();
        u10:GiveTask(function() -- Line: 44
            -- upvalues: u11 (ref)
            u11 = false;
        end);

        return function() -- Line: 47
            -- upvalues: u11 (ref)
            u11 = false;
        end;
    end, { u6.MatchState, u6.MatchStartTime });

    return u3.createElement(TopBarCard, {
        LayoutOrder = u6.LayoutOrder
    }, { u3.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = BedwarsImageId.HUD_TIMER_ICON,
            Size = UDim2.new(0, 16, 0, 16),
            ImageColor3 = Color3.fromRGB(0, 209, 255)
        }), u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 16,
            Text = v8,
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE
        }) });
end);

return {
    HudMatchTimer = v5.connect(function(p15, p16) -- Line: 74
        local v17 = {};

        for i, v in p16 do
            v17[i] = v;
        end;

        v17.MatchState = p15.Game.matchState;
        v17.MatchStartTime = p15.Game.startTime;

        return v17;
    end)(v14)
};