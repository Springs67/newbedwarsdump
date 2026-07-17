-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutExpo = v2.InOutExpo;
local OutQuint = v2.OutQuint;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = nil;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "CollectorPlayer";
    end
});
u7.__index = u7;

function u7.new(...) -- Line: 30
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 34
end;

function u7.create(p10, u11, u12, u13, u14) -- Line: 36
    -- upvalues: u3 (copy), OutQuint (copy), InOutExpo (copy), Players (copy), u4 (copy), default (copy), TweenService (copy), SoundManager (copy), RandomUtil (copy), u6 (ref), UIUtil (copy)
    local u15 = u3.new();

    return {
        play = function() -- Line: 39, Name: play
            -- upvalues: u14 (copy), OutQuint (ref), InOutExpo (ref), Players (ref), u4 (ref), u15 (copy), default (ref), u12 (copy), TweenService (ref), SoundManager (ref), RandomUtil (ref), u6 (ref), u11 (copy), u13 (copy), UIUtil (ref)
            local v16 = {};

            if type(u14) == "table" then
                for i, v in u14 do
                    v16[i] = v;
                end;
            end;

            local explodePower = v16.explodePower;
            local u17 = explodePower == nil and 100 or explodePower;
            local minExplodeSpeed = v16.minExplodeSpeed;

            if minExplodeSpeed == nil then
                local v18 = u14;

                if v18 ~= nil then
                    v18 = v18.amount;
                end;

                if v18 == nil then
                    local v19 = u14;

                    if v19 ~= nil then
                        v19 = v19.waitSecBtwnExplodes;
                    end;

                    v18 = 1 * (v19 == nil and 0.1 or v19);
                end;

                minExplodeSpeed = math.max(1, v18);
            end;

            local maxExplodeSpeed = v16.maxExplodeSpeed;

            if maxExplodeSpeed == nil then
                local v20 = u14;

                if v20 ~= nil then
                    v20 = v20.amount;
                end;

                if v20 == nil then
                    local v21 = u14;

                    if v21 ~= nil then
                        v21 = v21.waitSecBtwnExplodes;
                    end;

                    v20 = 1 * (v21 == nil and 0.1 or v21);
                end;

                maxExplodeSpeed = math.max(1, v20) + 1;
            end;

            local waitSecBtwnExplodes = v16.waitSecBtwnExplodes;
            local u22 = waitSecBtwnExplodes == nil and 0.1 or waitSecBtwnExplodes;
            local minSiphonSpeed = v16.minSiphonSpeed;
            local u23 = minSiphonSpeed == nil and 0.7 or minSiphonSpeed;
            local maxSiphonSpeed = v16.maxSiphonSpeed;
            local u24 = maxSiphonSpeed == nil and 1.6 or maxSiphonSpeed;
            local endStaySecs = v16.endStaySecs;
            local u25 = endStaySecs == nil and 0.2 or endStaySecs;
            local explodeSizeEasingFunction = v16.explodeSizeEasingFunction;

            if explodeSizeEasingFunction == nil then
                explodeSizeEasingFunction = OutQuint;
            end;

            local siphonPosEasingFunction = v16.siphonPosEasingFunction;

            if siphonPosEasingFunction == nil then
                siphonPosEasingFunction = InOutExpo;
            end;

            local v26 = {
                Name = "CollectEffectScreen",
                DisplayOrder = 200,
                ResetOnSpawn = false
            };
            local v27 = u14;

            if v27 ~= nil then
                v27 = v27.parent;
            end;

            if v27 == nil then
                v27 = Players.LocalPlayer:WaitForChild("PlayerGui");
            end;

            v26.Parent = v27;
            local v28 = u4("ScreenGui", v26);
            u15:GiveTask(v28);
            local u29 = Random.new(os.time());
            local u30 = {};

            local function v36(u31) -- Line: 137
                -- upvalues: default (ref), explodeSizeEasingFunction (ref), u12 (ref), u29 (copy), u17 (ref), TweenService (ref), maxExplodeSpeed (ref), minExplodeSpeed (ref), u30 (copy), u14 (ref), SoundManager (ref), RandomUtil (ref), u6 (ref), u22 (ref)
                default(0.5, explodeSizeEasingFunction, function(p32) -- Line: 139
                    -- upvalues: u31 (copy)
                    u31.Size = p32;

                    return u31.Size;
                end, UDim2.fromOffset(0, 0), UDim2.fromOffset(u31.AbsoluteSize.X, u31.AbsoluteSize.Y));
                local v33 = u12 + Vector2.new((u29:NextNumber() < 0.5 and -1 or 1) * u29:NextNumber() * u17, (u29:NextNumber() < 0.5 and -1 or 1) * u29:NextNumber() * u17);
                local v34 = TweenService:Create(u31, TweenInfo.new(u29:NextNumber() * (maxExplodeSpeed - minExplodeSpeed) + minExplodeSpeed, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Position = UDim2.fromOffset(v33.X, v33.Y)
                });
                table.insert(u30, v34);
                v34:Play();
                local v35 = u14;

                if v35 ~= nil then
                    v35 = v35.disableSounds;
                end;

                if not v35 then
                    SoundManager:playSound(RandomUtil.randomArraySelectN(u6, 1)[1]);
                end;

                task.wait(u22);
            end;

            local v37 = false;
            local v38 = 0;
            local v39 = {};

            while true do
                if v37 then
                    v38 = v38 + 1;
                else
                    v37 = true;
                end;

                local v40 = u14;

                if v40 ~= nil then
                    v40 = v40.amount;
                end;

                if v38 >= (v40 == nil and 1 or v40) then
                    local function _(p41) -- Line: 192
                        p41:Pause();
                        p41:Destroy();
                    end;

                    for i, v in u30 do
                        local _ = i - 1;
                        v:Pause();
                        v:Destroy();
                    end;

                    local function _(u42) -- Line: 200
                        -- upvalues: u29 (copy), u24 (ref), u23 (ref), default (ref), siphonPosEasingFunction (ref), u13 (ref), UIUtil (ref), u25 (ref)
                        task.spawn(function() -- Line: 201
                            -- upvalues: u29 (ref), u24 (ref), u23 (ref), default (ref), siphonPosEasingFunction (ref), u42 (copy), u13 (ref), UIUtil (ref), u25 (ref)
                            default(u29:NextNumber() * (u24 - u23) + u23, siphonPosEasingFunction, function(p43) -- Line: 203
                                -- upvalues: u42 (ref)
                                u42.Position = p43;

                                return u42.Position;
                            end, UDim2.fromOffset(u42.AbsolutePosition.X, u42.AbsolutePosition.Y), UDim2.fromOffset(u13.X, u13.Y)):Wait();
                            UIUtil:setContainerTransparency(u42, 1, {
                                onSetTweenInfo = TweenInfo.new(0.2)
                            });
                            task.wait(u25);
                            u42:Destroy();
                        end);
                    end;

                    for i, v in v39 do
                        local _ = i - 1;
                        task.spawn(function() -- Line: 201
                            -- upvalues: u29 (copy), u24 (ref), u23 (ref), default (ref), siphonPosEasingFunction (ref), v (copy), u13 (ref), UIUtil (ref), u25 (ref)
                            default(u29:NextNumber() * (u24 - u23) + u23, siphonPosEasingFunction, function(p44) -- Line: 203
                                -- upvalues: v (ref)
                                v.Position = p44;

                                return v.Position;
                            end, UDim2.fromOffset(v.AbsolutePosition.X, v.AbsolutePosition.Y), UDim2.fromOffset(u13.X, u13.Y)):Wait();
                            UIUtil:setContainerTransparency(v, 1, {
                                onSetTweenInfo = TweenInfo.new(0.2)
                            });
                            task.wait(u25);
                            v:Destroy();
                        end);
                    end;

                    task.delay(2, function() -- Line: 218
                        -- upvalues: u15 (ref)
                        u15:DoCleaning();
                    end);

                    return;
                end;

                local v45 = u11:Clone();
                v45.Position = UDim2.fromOffset(u12.X, u12.Y);
                v45.Parent = v28;
                table.insert(v39, v45);
                v36(v45);
            end;
        end,

        cleanup = function() -- Line: 222, Name: cleanup
            -- upvalues: u15 (copy)
            u15:DoCleaning();
        end
    };
end;

u6 = {
    GameSound.BUBBLE_POP1,
    GameSound.BUBBLE_POP2,
    GameSound.BUBBLE_POP3,
    GameSound.BUBBLE_POP4,
    GameSound.BUBBLE_POP5,
    GameSound.BUBBLE_POP6
};

return {
    CollectorPlayer = u7
};