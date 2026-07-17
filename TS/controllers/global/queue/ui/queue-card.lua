-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularSpinner = v1.CircularSpinner;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local QueueState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v5 = u3.Component:extend("QueueCard");

function v5.init(p6, p7) -- Line: 23
    -- upvalues: u3 (copy), u2 (copy)
    p6.wrapperRef = u3.createRef();
    p6.alive = true;
    p6.leaveButtonHoverMaid = u2.new();
    p6.matchFoundTime = -1;
    p6.timeStarted = tick();
    p6.lastLeaveClick = 0;
    p6:setState({
        timer = p6:getTimer(),
        queueType = u3.None
    });
end;

function v5.getTimer(p8) -- Line: 35
    -- upvalues: QueueState (copy), StringUtil (copy)
    local v9;

    if p8.props.QueueState == QueueState.MATCH_FOUND then
        v9 = p8.matchFoundTime - p8.timeStarted;
    else
        local v10 = tick() - p8.timeStarted;
        v9 = math.max(v10, 0);
    end;

    return StringUtil.formatCountdownTime(v9);
end;

function v5.setLastQueueType(p11) -- Line: 44
    if p11.props.QueueData then
        p11:setState({
            queueType = p11.props.QueueData.queueType
        });
    end;
end;

function v5.didMount(u12) -- Line: 51
    -- upvalues: TweenService (copy), DeviceUtil (copy), RuntimeLib (copy), SoundManager (copy), GameSound (copy)
    u12.timeStarted = tick();
    u12:setLastQueueType();
    TweenService:Create(u12.wrapperRef:getValue(), TweenInfo.new(0.12), {
        Size = UDim2.new(0.4, 0, DeviceUtil.isSmallScreen() and 0.09 or 0.065, 0)
    }):Play();
    RuntimeLib.Promise.defer(function() -- Line: 57
        -- upvalues: u12 (copy)
        while true do
            local v13 = task.wait(0.5);

            if v13 ~= 0 and (v13 == v13 and v13) then
                v13 = u12.alive;
            end;

            if v13 == 0 or (v13 ~= v13 or not v13) then
                return;
            end;

            u12:setState({
                timer = u12:getTimer()
            });
            u12:setLastQueueType();
        end;
    end);
    SoundManager:playSound(GameSound.QUEUE_JOIN);
end;

function v5.willUpdate(p14, p15) -- Line: 74
    -- upvalues: QueueState (copy), TweenService (copy), Theme (copy), DeviceUtil (copy), QueueType (copy), SoundManager (copy), GameSound (copy), ColorUtil (copy)
    if p15.QueueState == QueueState.MATCH_FOUND and p14.props.QueueState ~= QueueState.MATCH_FOUND then
        p14.matchFoundTime = tick();
        TweenService:Create(p14.wrapperRef:getValue(), TweenInfo.new(0.2), {
            BackgroundColor3 = Theme.backgroundSuccess,
            Size = UDim2.fromScale(0.4, DeviceUtil.isSmallScreen() and 0.12 or 0.08)
        }):Play();

        if p14.props.QueueData and p14.props.QueueData.queueType == QueueType.HALLOWEEN_EVENT then
            SoundManager:playSound(GameSound.USE_HALLOWEEN_KEY);
        end;
    elseif p14.props.QueueState == QueueState.MATCH_FOUND and p15.QueueState ~= QueueState.MATCH_FOUND then
        TweenService:Create(p14.wrapperRef:getValue(), TweenInfo.new(0.2), {
            BackgroundColor3 = ColorUtil.hexColor(6580135),
            Size = UDim2.fromScale(0.4, DeviceUtil.isSmallScreen() and 0.09 or 0.065)
        }):Play();
    end;
end;

function v5.willUnmount(p16) -- Line: 93
    p16.leaveButtonHoverMaid:DoCleaning();
    p16.alive = false;
end;

function v5.render(u17) -- Line: 97
    -- upvalues: BedwarsImageId (copy), QueueState (copy), u3 (copy), ColorUtil (copy), Flamework (copy), CircularSpinner (copy), SoundManager (copy), GameSound (copy), Workspace (copy), TweenService (copy)
    local QUEUE_SATELLITE = BedwarsImageId.QUEUE_SATELLITE;
    local v18 = u17.props.QueueState == QueueState.MATCH_FOUND and "Teleporting to match" or "Searching for match";
    local v19 = {
        [u3.Ref] = u17.wrapperRef,
        Size = UDim2.fromScale(0.4, 0),
        Position = UDim2.fromScale(0.5, 0.01),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = ColorUtil.hexColor(6580135),
        BorderSizePixel = 0
    };
    local v20 = {
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }),
        u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 7.372093023255814,
            DominantAxis = "Height"
        }),
        u3.createElement(
            "UIListLayout",
            {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center"
            }
        ),
        u3.createElement("Frame", {
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.3, 0)
        }),
        u3.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.7, 0.7),
            Image = QUEUE_SATELLITE
        })
    };
    local v21 = #v20;
    local v22 = {
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(4.172093023255814, 0.8)
    };
    local v23 = { u3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.06, 0),
            PaddingTop = UDim.new(0.08, 0),
            PaddingBottom = UDim.new(0.08, 0)
        }), u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center"
        }), u3.createElement("TextLabel", {
            Font = "Roboto",
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextXAlignment = "Left",
            Text = v18,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(1, 0.6)
        }) };
    local v24 = #v23;
    local v25;

    if u17.state.queueType == nil then
        v25 = false;
    else
        v25 = u3.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextXAlignment = "Left",
            Text = Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(u17.state.queueType).title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            Size = UDim2.fromScale(1, 0.4)
        });
    end;

    if v25 then
        v23[v24 + 1] = v25;
    end;

    v20[v21 + 1] = u3.createElement("Frame", v22, v23);
    v20[v21 + 2] = u3.createElement("Frame", {
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1.4, 0.8)
    }, { u3.createElement(
            "UIListLayout",
            {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center"
            }
        ), u3.createElement("UIPadding", {
            PaddingRight = UDim.new(0.1, 0)
        }), u3.createElement("TextLabel", {
            Font = "Roboto",
            RichText = true,
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextXAlignment = "Left",
            Text = u17.state.timer,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(1, 0.6)
        }, { u3.createElement("UIPadding", {
                PaddingRight = UDim.new(0.2, 0)
            }) }) });
    local v26;

    if u17.props.QueueState == QueueState.LEAVING_QUEUE or u17.props.QueueState == QueueState.NONE then
        v26 = u3.createElement(CircularSpinner, {
            SizeConstraint = "RelativeYY",
            Size = UDim2.fromScale(0.5, 0.5)
        });
    else
        v26 = false;
    end;

    if v26 then
        v20[v21 + 3] = v26;
    end;

    local v27 = #v20;
    local v28;

    if u17.props.QueueState == QueueState.JOINING_QUEUE or u17.props.QueueState == QueueState.IN_QUEUE then
        v28 = u3.createElement("ImageButton", {
            Size = UDim2.fromScale(0.5, 0.5),
            SizeConstraint = "RelativeYY",
            Image = BedwarsImageId.QUEUE_CLOSE,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,

            [u3.Event.MouseButton1Click] = function() -- Line: 227
                -- upvalues: SoundManager (ref), GameSound (ref), Workspace (ref), u17 (copy)
                SoundManager:playSound(GameSound.UI_CLICK);

                if Workspace:GetServerTimeNow() - u17.lastLeaveClick > 10 then
                    u17.props.OnLeaveQueue();
                    u17.lastLeaveClick = Workspace:GetServerTimeNow();
                end;
            end,

            [u3.Event.MouseEnter] = function(p29) -- Line: 234
                -- upvalues: u17 (copy), TweenService (ref)
                u17.leaveButtonHoverMaid:DoCleaning();
                local u30 = TweenService:Create(p29, TweenInfo.new(0.12), {
                    ImageTransparency = 0.4
                });
                u30:Play();
                u17.leaveButtonHoverMaid:GiveTask(function() -- Line: 240
                    -- upvalues: u30 (copy)
                    u30:Cancel();
                end);
            end,

            [u3.Event.MouseLeave] = function(p31) -- Line: 244
                -- upvalues: u17 (copy), TweenService (ref)
                u17.leaveButtonHoverMaid:DoCleaning();
                local u32 = TweenService:Create(p31, TweenInfo.new(0.12), {
                    ImageTransparency = 0
                });
                u32:Play();
                u17.leaveButtonHoverMaid:GiveTask(function() -- Line: 250
                    -- upvalues: u17 (ref), u32 (copy)
                    u17.leaveButtonHoverMaid:GiveTask(function() -- Line: 251
                        -- upvalues: u32 (ref)
                        u32:Cancel();
                    end);
                end);
            end
        });
    else
        v28 = false;
    end;

    if v28 then
        v20[v27 + 1] = v28;
    end;

    v20[#v20 + 1] = u3.createElement("Frame", {
        SizeConstraint = "RelativeYY",
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.3, 0)
    });

    return u3.createElement("Frame", v19, v20);
end;

return {
    QueueCard = v5
};