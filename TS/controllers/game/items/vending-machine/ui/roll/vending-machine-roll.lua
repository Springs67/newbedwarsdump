-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local VendingMachineRewardId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
local VendingMachineRewardMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    VendingMachineRoll = v4.new(u3)(function(u6, p7) -- Line: 18
        -- upvalues: u3 (copy), u2 (copy), VendingMachineRewardMeta (copy), VendingMachineRewardId (copy), RandomUtil (copy), Workspace (copy), SoundManager (copy), GameSound (copy), TweenService (copy), BedwarsImageId (copy), ItemViewport (copy), Empty (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u3.createRef();
        local u9 = nil;

        local function _(p10) -- Line: 24
            -- upvalues: VendingMachineRewardId (ref), u9 (ref)
            local v11;

            if p10.id == VendingMachineRewardId.NONE or p10.id == u9 then
                v11 = false;
            else
                v11 = not p10.disabled;
            end;

            return v11;
        end;

        local v12 = 0;
        local v13 = {};

        for i, v in u2.values(VendingMachineRewardMeta) do
            local _ = i - 1;
            local v14;

            if v.id == VendingMachineRewardId.NONE or v.id == u9 then
                v14 = false;
            else
                v14 = not v.disabled;
            end;

            if v14 == true then
                v12 = v12 + 1;
                v13[v12] = v;
            end;
        end;

        local function _(p15) -- Line: 37
            return p15.id;
        end;

        local u16 = table.create(#v13);

        for i, v in v13 do
            local _ = i - 1;
            u16[i] = v.id;
        end;

        local function v17() -- Line: 47
            -- upvalues: RandomUtil (ref), u16 (copy)
            return RandomUtil.fromList(unpack(u16));
        end;

        local u18, _ = useState(tick());
        local v19, u20 = useState(v17());
        local u21, u22 = useState(false);
        local u23 = false;
        useEffect(function() -- Line: 54
            -- upvalues: u23 (ref), u6 (copy), Workspace (ref), u20 (copy), u22 (copy), SoundManager (ref), GameSound (ref), u18 (copy), RandomUtil (ref), u16 (copy), u9 (ref)
            if u23 == true then
                return nil;
            end;

            local u24 = true;
            task.spawn(function() -- Line: 59
                -- upvalues: u6 (ref), Workspace (ref), u24 (ref), u23 (ref), u20 (ref), u22 (ref), SoundManager (ref), GameSound (ref), u18 (ref), RandomUtil (ref), u16 (ref), u9 (ref)
                if u6.dispenseTime == 0 then
                    return nil;
                end;

                task.delay(u6.dispenseTime - Workspace:GetServerTimeNow(), function() -- Line: 63
                    -- upvalues: u24 (ref), u23 (ref), u20 (ref), u6 (ref), u22 (ref), SoundManager (ref), GameSound (ref)
                    if not u24 then
                        return nil;
                    end;

                    u23 = true;
                    u20(u6.choosenReward);
                    u22(true);
                    task.spawn(function() -- Line: 70
                        -- upvalues: SoundManager (ref), GameSound (ref), u6 (ref)
                        SoundManager:playSound(GameSound.VENDING_ROLL_PRIZE, {
                            position = u6.soundPosition
                        });
                    end);
                end);

                while true do
                    local v25 = tick() - u18;
                    local v26 = RandomUtil.fromList(unpack(u16));
                    u9 = v26;
                    u20(v26);
                    task.spawn(function() -- Line: 83
                        -- upvalues: SoundManager (ref), GameSound (ref), u6 (ref)
                        SoundManager:playSound(GameSound.VENDING_ROLL_TICK, {
                            position = u6.soundPosition
                        });
                    end);
                    local v27 = math.clamp(v25 / 4, 0.1, 1) * 0.8;
                    local v28 = task.wait(v27);

                    if v28 ~= 0 and (v28 == v28 and v28) then
                        v28 = u24 and not u23;
                    end;

                    if v28 == 0 or (v28 ~= v28 or not v28) then
                        return;
                    end;
                end;
            end);

            return function() -- Line: 96
                -- upvalues: u24 (ref)
                u24 = false;
            end;
        end, { u6.choosenReward, u18, u6.dispenseTime });
        useEffect(function() -- Line: 100
            -- upvalues: u21 (copy), u8 (copy), TweenService (ref)
            local u29 = true;

            if not u21 then
                return nil;
            end;

            local u30 = u8:getValue();

            if not u30 then
                return nil;
            end;

            task.spawn(function() -- Line: 109
                -- upvalues: TweenService (ref), u30 (copy), u29 (ref)
                local v31 = true;

                while true do
                    local v32 = TweenInfo.new(2.5, Enum.EasingStyle.Quad);
                    local v33 = {
                        ImageTransparency = v31 and 0.4 or 0.6
                    };
                    local Size = u30.Size;
                    local v34;

                    if v31 then
                        v34 = UDim2.fromScale(0.2, 0.2);
                    else
                        v34 = UDim2.fromScale(-0.2, -0.2);
                    end;

                    v33.Size = Size + v34;
                    local v35 = TweenService:Create(u30, v32, v33);
                    v35:Play();
                    v35.Completed:Wait();

                    if not u29 then
                        return;
                    end;

                    v31 = not v31;
                end;
            end);

            return function() -- Line: 129
                -- upvalues: u29 (ref)
                u29 = false;
            end;
        end, { u21 });
        local v36;

        if v19 == 0 or (v19 ~= v19 or not v19) then
            v36 = nil;
        else
            v36 = VendingMachineRewardMeta[v19];
        end;

        local v37 = UDim2.fromScale(0.5, 0.5);

        if u21 then
            v37 = UDim2.fromScale(0.7, 0.7);
        end;

        local v38 = v36 ~= nil;

        if v38 then
            local v39 = {};
            local v40 = #v39;

            if u21 then
                u21 = u3.createElement("ImageLabel", {
                    [u3.Ref] = u8,
                    Image = BedwarsImageId.VENDING_RING,
                    Size = UDim2.fromScale(2.5, 2.5),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    SizeConstraint = "RelativeXX",
                    ImageTransparency = 0.8
                });
            end;

            if u21 then
                v39[v40 + 1] = u21;
            end;

            local v41 = #v39;
            local v42;

            if v36.item == nil then
                v42 = false;
            else
                v42 = u3.createElement(ItemViewport, {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    SizeConstraint = "RelativeXX",
                    ItemType = v36.item.itemType,
                    Size = v37,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                });
            end;

            if v42 then
                v39[v41 + 1] = v42;
            end;

            local v43 = #v39;
            local v44;

            if v36.custom == nil then
                v44 = false;
            else
                v44 = u3.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    SizeConstraint = "RelativeXX",
                    Image = v36.custom.image,
                    Size = v37,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                });
            end;

            if v44 then
                v39[v43 + 1] = v44;
            end;

            v38 = u3.createFragment(v39);
        end;

        local v45 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v46 = {};
        local v47 = #v46;

        if v38 then
            v46[v47 + 1] = v38;
        end;

        return u3.createElement(Empty, v45, v46);
    end)
};