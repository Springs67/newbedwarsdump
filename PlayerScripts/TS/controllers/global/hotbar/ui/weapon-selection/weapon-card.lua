-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v4.TweenService;
local UserInputService = v4.UserInputService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local getWeaponMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util").getWeaponMeta;
local v5 = u3.Component:extend("WeaponCard");

function v5.init(p6) -- Line: 18
    -- upvalues: u2 (copy), u3 (copy)
    p6.hoverMaid = u2.new();
    p6.ref = u3.createRef();
    p6.maid = u2.new();
end;

function v5.didMount(p7) -- Line: 23
    -- upvalues: UserInputService (copy), SoundManager (copy), GameSound (copy)
    local v8 = #UserInputService:GetConnectedGamepads() ~= 0 and p7.ref:getValue();

    if v8 then
        p7.maid:GiveTask(v8.SelectionGained:Connect(function() -- Line: 27
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
        end));
    end;
end;

function v5.willUnmount(p9) -- Line: 33
    p9.maid:DoCleaning();
end;

function v5.render(u10) -- Line: 36
    -- upvalues: getWeaponMeta (copy), u3 (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), TweenService (copy), ClientStore (copy), BedwarsImageId (copy)
    local v11 = getWeaponMeta(u10.props.weapon);
    local v16 = {
        [u3.Ref] = u10.ref,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = ColorUtil.BLACK,
        BackgroundTransparency = u10.props.Selected and 0.25 or 0.5,
        BorderSizePixel = 1,
        BorderMode = "Outline",
        BorderColor3 = ColorUtil.hexColor(16771973),
        LayoutOrder = u10.props.LayoutOrder,
        AutoButtonColor = false,
        Selectable = true,

        [u3.Event.MouseButton1Click] = function() -- Line: 49
            -- upvalues: SoundManager (ref), GameSound (ref), u10 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);
            u10.props.OnClick();
        end,

        [u3.Event.MouseButton2Click] = function() -- Line: 53
            -- upvalues: SoundManager (ref), GameSound (ref), u10 (copy)
            SoundManager:playSound(GameSound.UI_CLICK);
            local OnRightClick = u10.props.OnRightClick;

            if OnRightClick ~= nil then
                OnRightClick();
            end;
        end,

        [u3.Event.MouseEnter] = function(p12) -- Line: 60
            -- upvalues: u10 (copy), TweenService (ref)
            u10.hoverMaid:DoCleaning();

            if not u10.props.Selected then
                local u13 = TweenService:Create(p12, TweenInfo.new(0.12), {
                    BackgroundTransparency = 0.25
                });
                u10.hoverMaid:GiveTask(function() -- Line: 66
                    -- upvalues: u13 (copy)
                    u13:Cancel();
                end);
                u13:Play();
            end;
        end,

        [u3.Event.MouseLeave] = function(p14) -- Line: 72
            -- upvalues: u10 (copy), TweenService (ref)
            u10.hoverMaid:DoCleaning();

            if not u10.props.Selected then
                local u15 = TweenService:Create(p14, TweenInfo.new(0.12), {
                    BackgroundTransparency = u10.props.Selected and 0.25 or 0.5
                });
                u10.hoverMaid:GiveTask(function() -- Line: 78
                    -- upvalues: u15 (copy)
                    u15:Cancel();
                end);
                u15:Play();
            end;
        end
    };
    local v17 = {};
    local v18 = u3.createElement("UICorner", {
        CornerRadius = UDim.new(0.02, 0)
    });
    local createElement = u3.createElement;
    local v19 = {};
    local v20;

    if u10.props.Selected then
        v20 = Color3.fromRGB(255, 227, 66);
    else
        v20 = ColorUtil.WHITE;
    end;

    v19.Color = v20;
    v19.Thickness = u10.props.Selected and 2 or 1;
    v19.Transparency = u10.props.Selected and 0 or 0.5;
    v17[1], v17[2] = v18, createElement("UIStroke", v19);
    local v21 = #v17;
    local v22 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ImageTransparency = 0,
        Image = v11.image,
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    };
    local v23 = {};
    local v24 = #v23;
    local v25 = u10.props[u3.Children];

    if v25 then
        for i, v in v25 do
            if type(i) == "number" then
                v23[v24 + i] = v;
            else
                v23[i] = v;
            end;
        end;
    end;

    v17[v21 + 1] = u3.createElement("ImageLabel", v22, v23);
    local v26;

    if ClientStore:getState().Bedwars.weapon == u10.props.weapon then
        v26 = u3.createFragment({
            Results = u3.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 1)
            }, { u3.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ImageTransparency = 0.6,
                    Size = UDim2.fromScale(0.85, 0.85),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Image = BedwarsImageId.CIRCLE_HOLLOW,
                    ImageColor3 = ColorUtil.hexColor(16772696)
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }), u3.createElement("TextLabel", {
                    Text = "Selected",
                    TextSize = 20,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.85, 0.85),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    TextColor3 = ColorUtil.hexColor(16772696),
                    Font = Enum.Font.LuckiestGuy
                }) })
        });
    else
        v26 = false;
    end;

    if v26 then
        v17[v21 + 2] = v26;
    end;

    if v11 then
        v11 = u3.createFragment({
            KitNameTag = u3.createElement("Frame", {
                BackgroundTransparency = 0.55,
                Size = UDim2.fromScale(1, 0.3),
                Position = UDim2.fromScale(0, 1),
                AnchorPoint = Vector2.new(0, 1),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.035, 0)
                }), u3.createElement("TextLabel", {
                    TextScaled = true,
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromScale(1, 0.4),
                    Text = v11.name,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                }), u3.createElement("TextLabel", {
                    TextScaled = true,
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromScale(0.8, 0.6),
                    Text = v11.description,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Light)
                }) })
        });
    end;

    v17[#v17 + 1] = v11;

    return u3.createElement("ImageButton", v16, v17);
end;

return {
    WeaponCard = v5
};