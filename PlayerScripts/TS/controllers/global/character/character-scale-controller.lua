-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "CharacterScaleController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "CharacterScaleController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), WatchCharacter (copy), AccessoryUtil (copy), WeldUtil (copy)
    KnitController.KnitStart(p4);
    WatchCharacter(function(p5, u6, p7) -- Line: 28
        -- upvalues: AccessoryUtil (ref), WeldUtil (ref)
        local Humanoid = u6:WaitForChild("Humanoid");
        Humanoid:WaitForChild("BodyDepthScale");

        local function updateAllAccessories(p8) -- Line: 31
            -- upvalues: u6 (copy), AccessoryUtil (ref), WeldUtil (ref)
            if not u6.Parent then
                return nil;
            end;

            local function _(p9) -- Line: 36
                return p9:IsA("Accessory");
            end;

            local v10 = 0;
            local v11 = {};

            for i, child in u6:GetChildren() do
                local _ = i - 1;

                if child:IsA("Accessory") == true then
                    v10 = v10 + 1;
                    v11[v10] = child;
                end;
            end;

            for _, v in v11 do
                if v:GetAttribute("Amount") ~= nil or (v:GetAttribute("ArmorSlot") ~= nil or v:GetAttribute("IsBackpack") == true) then
                    AccessoryUtil:updateAccessoryScale(u6, v, p8);
                end;
            end;

            WeldUtil:weldCharacterAccessories(u6);
        end;

        p7:GiveTask(Humanoid.BodyDepthScale.Changed:Connect(function(u12) -- Line: 57
            -- upvalues: updateAllAccessories (copy)
            task.spawn(function() -- Line: 58
                -- upvalues: updateAllAccessories (ref), u12 (copy)
                task.wait();
                updateAllAccessories(u12);
            end);
        end));
        p7:GiveTask(u6.ChildAdded:Connect(function(p13) -- Line: 63
            -- upvalues: AccessoryUtil (ref), u6 (copy)
            if not p13:IsA("Accessory") then
                return nil;
            end;

            AccessoryUtil:updateAccessoryScale(u6, p13);
        end));
        updateAllAccessories(Humanoid.BodyDepthScale.Value);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;