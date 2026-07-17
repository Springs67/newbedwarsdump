-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local Workspace = v4.Workspace;
local DisruptorBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "disruptor-balance").DisruptorBalance;
local u5 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(73, 203, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 218, 82)) });
local u6 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(105, 111, 121)), ColorSequenceKeypoint.new(1, Color3.fromRGB(154, 160, 170)) });

local function u14() -- Line: 14
    -- upvalues: Players (copy), DisruptorBalance (copy), Workspace (copy)
    local v7 = Players.LocalPlayer:GetAttribute("DisruptorActivation");

    if v7 == nil then
        v7 = false;
    end;

    local v8 = Players.LocalPlayer:GetAttribute("DisruptorShopTaxMaxChargeSeconds");

    if v8 == nil then
        v8 = DisruptorBalance.SHOP_TAX_ACTIVE_DURATION_SECONDS;
    end;

    local v9 = Players.LocalPlayer:GetAttribute("DisruptorShopTaxChargeSeconds");

    if v9 == nil then
        v9 = v8;
    end;

    local v10 = Players.LocalPlayer:GetAttribute("DisruptorShopTaxChargeUpdatedAt");

    if v10 == nil then
        v10 = Workspace:GetServerTimeNow();
    end;

    local v11 = Workspace:GetServerTimeNow() - v10;
    local v12 = math.max(0, v11);
    local v13;

    if v7 then
        v13 = math.max(0, v9 - v12);
    else
        v13 = math.min(v8, v9 + v12);
    end;

    return math.clamp(v13 / v8, 0, 1);
end;

local function u18() -- Line: 39
    -- upvalues: CollectionService (copy), Players (copy)
    local function _(p15) -- Line: 41
        -- upvalues: Players (ref)
        return p15:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId;
    end;

    local v16 = nil;

    for i, v in CollectionService:GetTagged("satellite-dish") do
        local _ = i - 1;

        if v:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId == true then
            v16 = v;
            break;
        end;
    end;

    if v16 ~= nil then
        v16 = v16:GetAttribute("DisabledEndTime");
    end;

    local v17;

    if v16 == nil then
        v17 = false;
    else
        v17 = os.time() <= v16;
    end;

    return v17;
end;

return {
    ZenithShopTaxProgressBar = v3.new(u2)(function(p19, p20) -- Line: 61
        -- upvalues: u2 (copy), u1 (copy), u14 (copy), u18 (copy), ProgressBar (copy), u6 (copy), u5 (copy)
        local useEffect = p20.useEffect;
        local useState = p20.useState;
        local v21, u22 = useState(1);
        local v23, u24 = useState(false);
        local v25 = u2.createRef();
        useEffect(function() -- Line: 67
            -- upvalues: u1 (ref), u22 (copy), u14 (ref), u24 (copy), u18 (ref)
            local u26 = u1.new();
            local u27 = true;
            u26:GiveTask(function() -- Line: 70
                -- upvalues: u27 (ref)
                u27 = false;
            end);
            task.spawn(function() -- Line: 73
                -- upvalues: u27 (ref), u22 (ref), u14 (ref), u24 (ref), u18 (ref)
                while u27 do
                    u22((u14()));
                    u24((u18()));
                    task.wait(0.1);
                end;
            end);

            return function() -- Line: 80
                -- upvalues: u26 (copy)
                return u26:DoCleaning();
            end;
        end, {});
        local createElement = u2.createElement;
        local v28 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.55, 0.15)
        };
        local v29 = {};
        local v30 = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 12.441176470588236
        });
        local createElement2 = u2.createElement;
        local v31 = {
            LayoutOrder = 1,
            AcceptZero = true,
            GradientRotation = 0,
            Progress = v21,
            BarRef = v25
        };
        local v32;

        if v23 then
            v32 = u6;
        else
            v32 = u5;
        end;

        v31.BarGradient = v32;
        v31.Size = UDim2.fromScale(1, 1);
        v29[1], v29[2] = v30, createElement2(ProgressBar, v31);

        return createElement("Frame", v28, v29);
    end)
};