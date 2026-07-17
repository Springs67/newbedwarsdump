-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local getLegacyMobileLayoutDimensions = v1.getLegacyMobileLayoutDimensions;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local TweenService = v4.TweenService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v5 = u3.Component:extend("SprintUI");

function v5.init(p6, p7) -- Line: 20
    -- upvalues: u2 (copy), u3 (copy), DeviceUtil (copy), Players (copy)
    p6.maid = u2.new();
    p6.arrowRef = u3.createRef();
    p6.positionMaid = u2.new();
    local v8 = DeviceUtil.isHoarceKat();
    local v9;

    if Players.LocalPlayer then
        v9 = v8 and true or Players.LocalPlayer:GetAttribute("Sprinting") == true;
    else
        v9 = false;
    end;

    local v10 = v8 and true or Players.LocalPlayer:GetAttribute("SprintHighlighted") == true;
    local v11 = p6:getUpdatedStateFromMobileLayout();
    local v12 = {
        sprinting = v9
    };

    for i, v in v11 do
        v12[i] = v;
    end;

    v12.size = v11.size or u3.None;
    v12.sprintHighlight = v10;
    p6:setState(v12);
end;

function v5.didMount(u13) -- Line: 42
    -- upvalues: DeviceUtil (copy), Players (copy), KnitClient (copy), u3 (copy), GameCoreClientSyncEvents (copy)
    if DeviceUtil.isHoarceKat() then
        return nil;
    end;

    if Players.LocalPlayer then
        u13.maid:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("Sprinting"):Connect(function() -- Line: 47
            -- upvalues: u13 (copy), Players (ref)
            u13:setState({
                sprinting = Players.LocalPlayer:GetAttribute("Sprinting") == true
            });
        end));
        u13.maid:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("SprintHighlighted"):Connect(function() -- Line: 52
            -- upvalues: u13 (copy), Players (ref)
            u13:setState({
                sprintHighlight = Players.LocalPlayer:GetAttribute("SprintHighlighted") == true
            });
        end));
    end;

    KnitClient.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():andThen(function() -- Line: 58
        -- upvalues: u13 (copy), u3 (ref)
        local v14 = u13:getUpdatedStateFromMobileLayout();
        local v15 = {};

        for i, v in v14 do
            v15[i] = v;
        end;

        v15.size = v14.size or u3.None;
        u13:setState(v15);
    end);
    local v18 = GameCoreClientSyncEvents.MobileLayoutRegistered:connect(function() -- Line: 68
        -- upvalues: u13 (copy), u3 (ref)
        local v16 = u13:getUpdatedStateFromMobileLayout();
        local v17 = {};

        for i, v in v16 do
            v17[i] = v;
        end;

        v17.size = v16.size or u3.None;
        u13:setState(v17);
    end);
    u13.maid:GiveTask(v18);
    u13.maid:GiveTask(KnitClient.Controllers.SprintController.blockSprintStatusSignal:Connect(function(p19) -- Line: 79
        -- upvalues: u13 (copy)
        u13:setState({
            isSprintBlocked = p19
        });
    end));
end;

function v5.willUnmount(p20) -- Line: 85
    p20.maid:DoCleaning();
    p20.positionMaid:DoCleaning();
end;

function v5.didUpdate(p21, p22, p23) -- Line: 89
    -- upvalues: u2 (copy), TweenService (copy)
    if p23.sprintHighlight ~= p21.state.sprintHighlight then
        p21.positionMaid:DoCleaning();
        p21.positionMaid = u2.new();

        if p21.state.sprintHighlight then
            local u24 = TweenService:Create(p21.arrowRef:getValue(), TweenInfo.new(0.5), {
                Position = UDim2.fromScale(0.5, -0.8)
            });
            local u25 = TweenService:Create(p21.arrowRef:getValue(), TweenInfo.new(0.5), {
                Position = UDim2.fromScale(0.5, -0.45)
            });
            u24:Play();
            p21.positionMaid:GiveTask(u24.Completed:Connect(function() -- Line: 104
                -- upvalues: u25 (ref)
                u25:Play();
            end));
            p21.positionMaid:GiveTask(u25.Completed:Connect(function() -- Line: 107
                -- upvalues: u24 (ref)
                u24:Play();
            end));
        end;
    end;
end;

function v5.render(u26) -- Line: 113
    -- upvalues: u3 (copy), BedwarsImageId (copy), TweenService (copy), ColorUtil (copy), Empty (copy)
    local v27 = {
        Size = u26.state.size,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = u26.state.position
    };
    local v28 = {};
    local createElement = u3.createElement;
    local v29 = {
        [u3.Ref] = u26.arrowRef,
        Size = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, -0.7),
        Image = "rbxassetid://16809397532",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        SizeConstraint = Enum.SizeConstraint.RelativeXX,
        ZIndex = 2,
        ImageColor3 = Color3.fromRGB(255, 255, 255)
    };
    v29.Visible = u26.state.sprintHighlight and not u26.state.sprinting;
    v28.HighlightedSlotArrow = createElement("ImageLabel", v29);
    local v30 = {};
    local v31;

    if u26.state.sprinting then
        v31 = BedwarsImageId.SPRINT_ON_MOBILE;
    else
        v31 = BedwarsImageId.SPRINT_OFF_MOBILE;
    end;

    v30.Image = v31;
    v30.Active = not u26.state.isSprintBlocked;
    v30.Size = UDim2.fromScale(1, 1);
    v30.AnchorPoint = Vector2.new(0.5, 0.5);
    v30.Position = UDim2.fromScale(0.5, 0.5);
    v30.BackgroundTransparency = 1;
    v30.BorderSizePixel = 0;
    v30.ImageTransparency = u26.state.isSprintBlocked and 0.7 or 0;

    v30[u3.Event.MouseButton1Click] = function() -- Line: 144
        -- upvalues: u26 (copy)
        local OnClick = u26.props.OnClick;

        if OnClick ~= nil then
            OnClick();
        end;
    end;

    v30[u3.Event.TouchTap] = function(p32) -- Line: 150
        -- upvalues: TweenService (ref)
        TweenService:Create(p32, TweenInfo.new(0.06), {
            ImageTransparency = 0.5
        }):Play();
        task.wait(0.06);
        TweenService:Create(p32, TweenInfo.new(0.06), {
            ImageTransparency = 0
        }):Play();
    end;

    local v33 = { u3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1,
            DominantAxis = "Height"
        }), u3.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }) };
    local v34 = #v33;
    local v35 = u26.state.sprintHighlight and not u26.state.sprinting and u3.createElement("UIStroke", {
        Thickness = 2,
        Color = ColorUtil.WHITE
    });

    if v35 then
        v33[v34 + 1] = v35;
    end;

    v28[#v28 + 1] = u3.createElement("ImageButton", v30, v33);

    return u3.createElement(Empty, v27, v28);
end;

function v5.getUpdatedStateFromMobileLayout(p36) -- Line: 180
    -- upvalues: DeviceUtil (copy), getLegacyMobileLayoutDimensions (copy), Flamework (copy)
    local v37 = {};
    local v38;

    if DeviceUtil.isHoarceKat() then
        v38 = getLegacyMobileLayoutDimensions().Sprint.position;
    else
        v38 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("Sprint") or UDim2.fromOffset(0, 0);
    end;

    v37.position = v38;
    local v39;

    if DeviceUtil.isHoarceKat() then
        v39 = getLegacyMobileLayoutDimensions().Sprint.size;
    else
        v39 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("Sprint");
    end;

    v37.size = v39;

    return v37;
end;

return {
    SprintUI = v5
};