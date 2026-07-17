-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "DisguiseBushController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "DisguiseBushController";
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy), default (copy), Workspace (copy), ReplicatedStorage (copy), WeldUtil (copy)
    KnitController.KnitStart(p5);
    default.Client:OnEvent("ApplyBushDisguise", function(p6) -- Line: 30
        -- upvalues: Workspace (ref), ReplicatedStorage (ref), WeldUtil (ref)
        local Character = p6.target.Character;

        if not Character then
            return nil;
        end;

        if not Character:IsDescendantOf(Workspace) then
            Character.AncestryChanged:Wait();
        end;

        local Humanoid = Character:WaitForChild("Humanoid");
        local u7 = ReplicatedStorage.Assets.Misc.BushDisguise:Clone();
        Humanoid:AddAccessory(u7);
        WeldUtil:weldCharacterAccessories(Character);
        Character.Destroying:Connect(function() -- Line: 44
            -- upvalues: u7 (copy)
            u7:Destroy();
        end);
        task.delay(60, function() -- Line: 47
            -- upvalues: u7 (copy)
            if u7 then
                u7:Destroy();
            end;
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;