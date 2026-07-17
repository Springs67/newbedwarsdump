-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v3.Debris;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "FireballController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6, ...);
    p6.Name = "FireballController";
end;

function u4.KnitStart(p7) -- Line: 35
    -- upvalues: default (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), u2 (copy), Workspace (copy), GameQueryUtil (copy), Debris (copy), TweenService (copy)
    default.Client:WaitFor("FireballExplode"):andThen(function(p8) -- Line: 37
        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u2 (ref), Workspace (ref), GameQueryUtil (ref), Debris (ref), TweenService (ref)
        p8:Connect(function(p9) -- Line: 38
            -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u2 (ref), Workspace (ref), GameQueryUtil (ref), Debris (ref), TweenService (ref)
            SoundManager:playSound(RandomUtil.fromList(GameSound.TNT_EXPLODE_1, GameSound.FIREBALL_EXPLODE), {
                rollOffMaxDistance = 220,
                position = p9.position
            });
            local v10 = u2("Part", {
                Size = Vector3.new(1, 1, 1),
                Anchored = true,
                CanCollide = false,
                Transparency = 1,
                CFrame = CFrame.new(p9.position),
                Parent = Workspace:WaitForChild("Explosions")
            });
            GameQueryUtil:setQueryIgnored(v10, true);
            Debris:AddItem(v10, 3);
            local v11 = false;
            local v12 = 0;
            local v13 = { "rbxassetid://6852338879", "rbxassetid://6852338938", "rbxassetid://6852338995", "rbxassetid://6852339059", "rbxassetid://6852339122", "rbxassetid://6852339192", "rbxassetid://6852339277" };

            while true do
                if v11 then
                    v12 = v12 + 1;
                else
                    v11 = true;
                end;

                if v12 >= 20 then
                    return;
                end;

                local v14 = {
                    AlwaysOnTop = true,
                    LightInfluence = 0,
                    Adornee = v10
                };
                local v15 = math.random(-7, 7);
                local v16 = math.random(-7, 7);
                v14.StudsOffsetWorldSpace = Vector3.new(v15, v16, math.random(-7, 7));
                v14.Size = UDim2.fromScale(math.random(4, 8), math.random(4, 8));
                v14.Parent = v10;
                v14.Children = { u2("ImageLabel", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Image = RandomUtil.fromList(unpack(v13)),
                        Size = UDim2.fromScale(1, 1)
                    }) };
                local v17 = u2("BillboardGui", v14);
                TweenService:Create(v17, TweenInfo.new(math.random(6, 10)), {
                    StudsOffset = v17.StudsOffsetWorldSpace + Vector3.new(0, 8, 0)
                }):Play();
                Debris:AddItem(v17, math.random(3, 9) / 10);
            end;
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;