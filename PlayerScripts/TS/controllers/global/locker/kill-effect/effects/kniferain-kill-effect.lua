-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v2.Linear;
local OutSine = v2.OutSine;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = Random.new();
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "KnifeRainKillEffect";
    end,

    __index = KillEffect
});
u6.__index = u6;

function u6.new(...) -- Line: 29
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, p9) -- Line: 33
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p8, p9);
    KillEffect.setPlayDefaultKillEffect(p8, false);
end;

function u6.getTargetCFrame(p10, p11, p12) -- Line: 37
    -- upvalues: u5 (copy), Workspace (copy)
    local v13 = nil;
    local v14 = 0;

    while v13 == nil and v14 < 20 do
        v14 = v14 + 1;
        local v15 = p11:GetPivot() * CFrame.new(u5:NextNumber(-2, 2), u5:NextNumber(-3, 3), 0);
        local v16 = RaycastParams.new();
        v16.FilterType = Enum.RaycastFilterType.Whitelist;
        v16.FilterDescendantsInstances = { p11 };
        local v17 = Workspace:Raycast(p12, (v15.Position - p12).Unit * 40, v16);
        local v18;

        if v17 == nil then
            v18 = v17;
        else
            v18 = v17.Instance;
        end;

        if v18 then
            v13 = CFrame.new(v17.Position);
        end;
    end;

    return v13;
end;

function u6.onKill(p19, p20, p21, p22) -- Line: 63
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), GameWorldUtil (copy), u5 (copy), GameQueryUtil (copy), RandomUtil (copy), default (copy), OutSine (copy), Linear (copy)
    local u23 = u3.new();
    p21.Archivable = true;
    local v24 = p21:Clone();
    v24.HumanoidRootPart.Anchored = true;
    v24:PivotTo(p22);
    v24.Parent = Workspace;
    KillEffect.hideCharacter(p19, p21);
    u23:GiveTask(v24);
    u23:GiveTask(SoundManager:playSound(GameSound.KNIFE_RAIN_EFFECT, {
        rollOffMaxDistance = 100,
        position = p22.Position
    }));
    local v25 = { ReplicatedStorage.Assets.Misc.KillEffectKnives.KillEffectKnife, ReplicatedStorage.Assets.Misc.KillEffectKnives.KillEffectRod };
    local v26 = 0;
    local v27 = 0;
    local u28 = {};

    while true do
        local v29, v30;

        repeat
            local v31;

            repeat
                if v26 >= 5 or v27 >= 100 then
                    for i in u28 do
                        task.spawn(function() -- Line: 141
                            -- upvalues: u5 (ref), default (ref), OutSine (ref), i (copy), Linear (ref), u23 (copy)
                            local v32 = 0.7 + u5:NextNumber(0.1, 0.35);
                            local v34 = default(v32, OutSine, function(p33) -- Line: 144
                                -- upvalues: i (ref)
                                i.model:PivotTo(CFrame.lookAt(i.origin:Lerp(i.origin + (i.targetPosition - i.origin).Unit * 3, p33), i.targetPosition) * CFrame.Angles(0, 0, (math.rad(i.angle))));
                            end, 0, 1);
                            task.wait(v32 - u5:NextNumber(0.1, 0.2));
                            v34:Cancel();
                            local Position = i.model:GetPivot().Position;
                            local u38 = default(u5:NextNumber(0.1, 0.15), Linear, function(p35) -- Line: 160
                                -- upvalues: i (ref), Position (copy)
                                local Unit = (i.targetPosition - i.origin).Unit;
                                local model = i.model;
                                local v36 = CFrame;
                                local v37 = Position:Lerp(i.targetPosition - Unit * (not i.model.PrimaryPart and 1.3 or i.model.PrimaryPart.Size.Z / 2 - 0.3), p35);
                                model:PivotTo(v36.lookAt(v37, i.targetPosition + Unit * 0.1) * CFrame.Angles(0, 0, (math.rad(i.angle))));
                            end, 0, 1);
                            u23:GiveTask(function() -- Line: 177
                                -- upvalues: u38 (copy)
                                u38:Cancel();
                            end);
                        end);
                    end;

                    u23:GiveTask(function() -- Line: 182
                        -- upvalues: u28 (copy)
                        for i in u28 do
                            i.model:Destroy();
                        end;
                    end);
                    task.delay(2.5, function() -- Line: 187
                        -- upvalues: u23 (copy)
                        u23:DoCleaning();
                    end);

                    return u23;
                end;

                local v39 = GameWorldUtil.randomUnitVector(p22.LookVector * -1, 1.2217304763960306);
                v30 = p22.Position + v39 * u5:NextNumber(13, 25);
                v31 = (p22.Position - v30).Unit;
                v27 = v27 + 1;
            until v31.Y <= 0;

            v29 = p19:getTargetCFrame(v24, v30);
        until v29 ~= nil;

        v26 = v26 + 1;
        local v40 = ReplicatedStorage.Assets.Misc.KillEffectKnives.KillEffectSpear:Clone();
        v40:PivotTo(CFrame.lookAt(v30, v29.Position));
        v40.Parent = Workspace;
        GameQueryUtil:setQueryIgnored(v40, true);
        u28[{
            model = v40,
            origin = v30,
            targetPosition = v29.Position,
            angle = u5:NextNumber(0, 360)
        }] = true;
        local v41 = false;
        local v42 = 0;

        while true do
            if true then
                if v41 then
                    v42 = v42 + 1;
                else
                    v41 = true;
                end;
            end;

            if v42 >= 4 then
                break;
            end;

            local v43 = u5:NextNumber(-2.5, 2.5);
            local v44 = u5:NextNumber(-2.5, 2.5);
            local v45 = Vector3.new(v43, v44, u5:NextNumber(-2.5, 2.5));
            local v46 = p19:getTargetCFrame(v24, v30 + v45);

            if v46 ~= nil then
                local v47 = RandomUtil.fromList(unpack(v25)):Clone();
                v47:PivotTo(CFrame.lookAt(v30 + v45, v46.Position));
                v47.Parent = Workspace;
                GameQueryUtil:setQueryIgnored(v47, true);
                u28[{
                    model = v47,
                    origin = v47:GetPivot().Position,
                    angle = u5:NextNumber(0, 360),
                    targetPosition = v46.Position
                }] = true;
            end;
        end;
    end;
end;

return u6;