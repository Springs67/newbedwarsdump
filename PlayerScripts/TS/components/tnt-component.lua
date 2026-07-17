-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config");
local Attribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute;
local timeUntilExplosion = Attribute.new("timeUntilExplosion", t.optional(t.number));
local growDuration = Attribute.new("growDuration", t.optional(t.number));
local flashColor = Attribute.new("flashColor", t.optional(t.Color3));
local flashInterval = Attribute.new("flashInterval", t.optional(t.number));
local hissSound = Attribute.new("hissSound", t.optional(t.string));
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "TntComponent";
    end
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(u6, u7) -- Line: 28
    -- upvalues: u3 (copy), timeUntilExplosion (copy), growDuration (copy), flashColor (copy), flashInterval (copy), hissSound (copy), GameSound (copy), SoundManager (copy), u2 (copy), ImageId (copy), RuntimeLib (copy)
    u6.config = u3.new(u7, {
        timeUntilExplosion,
        growDuration,
        flashColor,
        flashInterval,
        hissSound
    });
    local v8 = {};
    local timeUntilExplosion2 = u6.config.Values.timeUntilExplosion;
    v8.timeUntilExplosion = timeUntilExplosion2 == nil and 3 or timeUntilExplosion2;
    local growDuration2 = u6.config.Values.growDuration;
    v8.growDuration = growDuration2 == nil and 3 or growDuration2;
    v8.flashColor = u6.config.Values.flashColor or Color3.fromRGB(255, 255, 255);
    local flashInterval2 = u6.config.Values.flashInterval;
    v8.flashInterval = flashInterval2 == nil and 0.25 or flashInterval2;
    local hissSound2 = u6.config.Values.hissSound;

    if hissSound2 == nil then
        hissSound2 = GameSound.TNT_HISS_1;
    end;

    v8.hissSound = hissSound2;
    u6.config.Values = v8;
    local hissSound3 = u6.config.Values.hissSound;

    if hissSound3 ~= "" and hissSound3 then
        SoundManager:playSound(u6.config.Values.hissSound, {
            rollOffMaxDistance = 220,
            position = u7.Position
        });
    end;

    for _, v in Enum.NormalId:GetEnumItems() do
        u7:WaitForChild(v.Name);
    end;

    for _, child in u7:GetChildren() do
        if child:IsA("BasePart") then
            u2("Texture", {
                Parent = child,
                Face = Enum.NormalId.Bottom,
                Texture = ImageId.PIXEL,
                Color3 = u6.config.Values.flashColor
            });
        end;
    end;

    local u9 = {};

    local function handleChild(p10) -- Line: 101
        -- upvalues: u9 (copy)
        if p10:IsA("Texture") then
            u9[p10.Face] = p10.Texture;
        end;
    end;

    for i, child in u7:GetChildren() do
        local _ = i - 1;

        if child:IsA("Texture") then
            u9[child.Face] = child.Texture;
        end;
    end;

    u7.ChildAdded:Connect(handleChild);
    RuntimeLib.Promise.defer(function() -- Line: 117
        -- upvalues: u6 (copy), u7 (copy)
        local u11 = false;

        while true do
            local v12 = task.wait(u6.config.Values.flashInterval);

            if v12 ~= 0 and (v12 == v12 and v12) then
                v12 = u7.Parent ~= nil;
            end;

            if v12 == 0 or (v12 ~= v12 or not v12) then
                return;
            end;

            u11 = not u11;

            local function _(p13) -- Line: 129
                -- upvalues: u11 (ref)
                if p13:IsA("Texture") then
                    if u11 then
                        p13.Transparency = 0;

                        return;
                    end;

                    p13.Transparency = 1;
                end;
            end;

            for i, descendant in u7:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("Texture") then
                    if u11 then
                        descendant.Transparency = 0;
                    else
                        descendant.Transparency = 1;
                    end;
                end;
            end;
        end;
    end);
end;

function u4.Destroy(p14) -- Line: 144
end;

u4.Tag = "tnt";

return u4;