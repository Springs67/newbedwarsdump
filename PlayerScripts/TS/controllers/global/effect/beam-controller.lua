-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "BeamController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BeamController";
end;

u2.createBeam = RuntimeLib.async(function(p5, p6) -- Line: 26
    -- upvalues: u1 (copy), TweenService (copy)
    local v7 = u1("Attachment", {
        Parent = p6.source
    });
    local v8 = u1("Attachment", {
        Parent = p6.target
    });

    if v7 and v8 then
        local u9 = u1("Beam", {
            Width0 = 0,
            Width1 = 0,
            CurveSize0 = 0,
            CurveSize1 = 0,
            FaceCamera = true,
            Attachment0 = v7,
            Attachment1 = v8,
            Color = ColorSequence.new(p6.color),
            Parent = v7
        });
        local v10 = TweenInfo.new(p6.duration);
        local v11 = {};
        local width0 = p6.width0;
        v11.Width0 = width0 == nil and 1 or width0;
        local width1 = p6.width1;
        v11.Width1 = width1 == nil and 1 or width1;
        local curveSize0 = p6.curveSize0;
        v11.CurveSize0 = curveSize0 == nil and 1 or curveSize0;
        local curveSize1 = p6.curveSize1;
        v11.CurveSize1 = curveSize1 == nil and 1 or curveSize1;
        TweenService:Create(u9, v10, v11):Play();
        task.delay(p6.duration, function() -- Line: 73
            -- upvalues: u9 (copy)
            u9:Destroy();
        end);
    end;
end);

function u2.KnitStart(u12) -- Line: 78
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u12);
    default.Client:Get("BeamEffect"):Connect(function(p13) -- Line: 80
        -- upvalues: u12 (copy)
        u12:createBeam({
            source = p13.source,
            target = p13.target,
            width0 = p13.width0,
            width1 = p13.width1,
            curveSize0 = p13.curveSize0,
            curveSize1 = p13.curveSize1,
            color = p13.color,
            duration = p13.duration
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;