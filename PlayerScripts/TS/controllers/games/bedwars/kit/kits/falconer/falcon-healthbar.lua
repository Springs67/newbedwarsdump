-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local v4 = u3.Component:extend("FalconHealthbar");

function v4.init(p5, p6) -- Line: 15
    -- upvalues: u3 (copy), u2 (copy)
    p5.progressFrame = u3.createRef();
    p5.maid = u2.new();
    p5.characterMaid = u2.new();
    p5:setState({
        health = 100
    });
end;

function v4.didMount(p7) -- Line: 23
    p7:hookCharacter(p7.props.instance);
end;

function v4.hookCharacter(u8, u9) -- Line: 36
    -- upvalues: TweenService (copy)
    if not u9 then
        return nil;
    end;

    u8.maid:DoCleaning();
    local u10 = u9:GetAttribute("Health");
    local u11 = u9:GetAttribute("MaxHealth");

    local function u15(p12, p13) -- Line: 43
        -- upvalues: u8 (copy), TweenService (ref), u10 (ref), u11 (ref)
        u8:setState({
            health = math.max(0, p12)
        });
        local v14 = math.clamp(p12 / p13, 0, 1);
        TweenService:Create(u8.progressFrame:getValue(), TweenInfo.new(0.3), {
            Size = UDim2.fromScale(v14, 1)
        }):Play();
        u10 = p12;
        u11 = p13;
    end;

    local v16 = u10;
    local v17 = u11;
    u15(v16 == nil and 1 or v16, v17 == nil and 1 or v17);
    u8.maid:GiveTask(u9:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 63
        -- upvalues: u15 (copy), u9 (copy), u11 (ref)
        u15(u9:GetAttribute("Health"), u11);
    end));
    u8.maid:GiveTask(u9:GetAttributeChangedSignal("MaxHealth"):Connect(function() -- Line: 66
        -- upvalues: u15 (copy), u10 (ref), u9 (copy)
        u15(u10, u9:GetAttribute("MaxHealth"));
    end));
end;

function v4.render(p18) -- Line: 70
    -- upvalues: EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), ColorUtil (copy), u3 (copy), Empty (copy)
    local v19 = EntityUtil:getLocalPlayerEntity();
    local _ = p18.state.health;
    local v20;

    if v19 == nil then
        v20 = v19;
    else
        v20 = v19:getMaxHealth();
    end;

    local _ = v20 == nil and 100 or v20;
    local v21 = Color3.fromHex("#EC8D2F");

    if v19 ~= nil then
        v19 = v19:getInstance();
    end;

    if v19 and StatusEffectUtil:isActive(v19, StatusEffectType.DECAY) then
        v21 = ColorUtil.hexColor(13970113);
    end;

    return u3.createFragment({
        FalconHealthbarContainer = u3.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.6, 0.18),
            Position = UDim2.fromScale(0.5, -0.45),
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = ColorUtil.hexColor(2700097)
        }, {
            FalconHealthbarProgressWrapper = u3.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, { u3.createElement("Frame", {
                    [u3.Ref] = p18.progressFrame,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = v21,
                    BorderSizePixel = 0,
                    LayoutOrder = 0
                }) })
        })
    });
end;

function v4.willUnmount(p22) -- Line: 114
    p22.characterMaid:DoCleaning();
    p22.maid:DoCleaning();
end;

return {
    FalconHealthbar = v4
};