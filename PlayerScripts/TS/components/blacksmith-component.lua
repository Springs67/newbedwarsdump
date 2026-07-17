-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 8, Name: __tostring
        return "BlacksmithComponent";
    end
});
u2.__index = u2;

function u2.new(...) -- Line: 13
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(u4, u5) -- Line: 17
    -- upvalues: u1 (copy), RandomUtil (copy)
    u4.sounds = { "rbxassetid://6878374361", "rbxassetid://6878374328", "rbxassetid://6878374407" };
    local v6 = u5:WaitForChild("blacksmith"):WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u1("Animation", {
        AnimationId = "rbxassetid://6898063256"
    }));
    v6.Looped = true;
    v6:Play();
    v6:GetMarkerReachedSignal("SwordHit"):Connect(function() -- Line: 26
        -- upvalues: RandomUtil (ref), u4 (copy), u1 (ref), u5 (copy)
        local u7 = u1("Sound", {
            RollOffMinDistance = 20,
            RollOffMaxDistance = 40,
            Volume = 0.06,
            Playing = true,
            SoundId = RandomUtil.fromList(unpack(u4.sounds)),
            Parent = u5
        });
        u7.Ended:Connect(function() -- Line: 37
            -- upvalues: u7 (copy)
            return u7:Destroy();
        end);
    end);
end;

function u2.Destroy(p8) -- Line: 42
end;

u2.Tag = "Blacksmith";

return u2;