-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "SmokeBlockController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SmokeBlockController";
end;

function u3.KnitStart(u6) -- Line: 28
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u1 (copy)
    KnitController.KnitStart(u6);
    WatchCollectionTag("smoke_block", function(u7) -- Line: 30
        -- upvalues: u1 (ref), u6 (copy)
        for _, v in Enum.NormalId:GetEnumItems() do
            u1("Texture", {
                StudsPerTileU = 3,
                StudsPerTileV = 3,
                Texture = "rbxassetid://8538034808",
                Parent = u7,
                Face = v
            });
        end;

        for _, child in u7:GetChildren() do
            if child:IsA("Texture") then
                u6:handleTexture(u7, child);
            end;
        end;

        u7.ChildAdded:Connect(function(p8) -- Line: 46
            -- upvalues: u6 (ref), u7 (copy)
            if p8:IsA("Texture") then
                u6:handleTexture(u7, p8);
            end;
        end);
    end);
end;

function u3.handleTexture(p9, p10, u11) -- Line: 53
    -- upvalues: Workspace (copy), TweenService (copy)
    local u12 = Workspace:GetServerTimeNow() % 3;
    u11.OffsetStudsU = u12;
    task.spawn(function() -- Line: 56
        -- upvalues: u11 (copy), TweenService (ref), u12 (ref)
        while u11.Parent do
            local v13 = TweenService:Create(u11, TweenInfo.new(3, Enum.EasingStyle.Linear), {
                OffsetStudsU = u12 + 3
            });
            v13:Play();
            v13.Completed:Wait();
            u12 = u12 + 3;
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;