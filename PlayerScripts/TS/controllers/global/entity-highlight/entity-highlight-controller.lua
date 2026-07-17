-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "EntityHighlightController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "EntityHighlightController";
    p5.entityCleanup = {};
end;

function u3.KnitStart(p6) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p6);
end;

function u3.highlight(p7, p8, p9) -- Line: 31
    -- upvalues: u1 (copy), u2 (copy), TweenService (copy)
    local u10 = p9 == nil and {} or p9;
    local v11 = p7.entityCleanup[p8];

    if v11 ~= nil then
        v11:DoCleaning();
    end;

    local u12 = u1.new();
    p7.entityCleanup[p8] = u12;
    local u13 = true;
    u12:GiveTask(function() -- Line: 47
        -- upvalues: u13 (ref)
        u13 = false;
    end);
    local v14 = {};
    local v15 = #v14;
    local v16 = p8:GetDescendants();
    local v17 = #v16;
    table.move(v16, 1, v17, v15 + 1, v14);
    v14[v15 + v17 + 1] = p8;
    local u18 = {};

    for _, v in v14 do
        if v:IsA("BasePart") and (not u10.shouldApplyToPart or u10.shouldApplyToPart(v)) and v.Transparency ~= 1 then
            for _, v2 in p7:highlightPart(v, u10.color, u10.textureId) do
                table.insert(u18, v2);
            end;
        end;
    end;

    local transparency = u10.transparency;
    local u19 = transparency == nil and 0.4 or transparency;
    local fadeInTime = u10.fadeInTime;
    local u20 = (fadeInTime == nil and 0 or fadeInTime) > 0;
    local u21 = u2("NumberValue", {
        Value = u20 and 1 or u19
    });

    local function u23() -- Line: 85
        -- upvalues: u18 (copy), u21 (copy)
        for _, v in u18 do
            if v.Parent then
                v.Transparency = u21.Value;
            else
                local v22 = (table.find(u18, v) or 0) - 1;
                table.remove(u18, v22 + 1);
            end;
        end;
    end;

    local u24 = u21.Changed:Connect(function() -- Line: 95
        -- upvalues: u23 (copy)
        u23();
    end);
    u23();
    u12:GiveTask(function() -- Line: 99
        -- upvalues: u24 (copy), u21 (copy)
        u24:Disconnect();
        u21:Destroy();
    end);
    task.spawn(function() -- Line: 103
        -- upvalues: u20 (copy), u13 (ref), TweenService (ref), u10 (ref), u21 (copy), u19 (copy), u12 (copy)
        if u20 and u13 then
            local fadeInTime2 = u10.fadeInTime;
            local u25 = TweenService:Create(u21, TweenInfo.new(fadeInTime2 == nil and 0 or fadeInTime2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Value = u19
            });
            u25:Play();
            u12:GiveTask(function() -- Line: 114
                -- upvalues: u25 (copy)
                u25:Cancel();
            end);
            u25.Completed:Wait();
        end;

        if u10.lastsForever then
            return nil;
        end;

        if u10.duration ~= nil and u13 then
            task.wait(u10.duration);
        end;

        if u10.fadeOutTime == nil or not u13 then
            if u10.fadeOutTime == nil and u13 then
                u21.Value = 1;
            end;
        else
            local u26 = TweenService:Create(u21, TweenInfo.new(u10.fadeOutTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Value = 1
            });
            u26:Play();
            u12:GiveTask(function() -- Line: 130
                -- upvalues: u26 (copy)
                u26:Cancel();
            end);
            u26.Completed:Wait();
        end;

        u12:DoCleaning();
    end);

    return u12;
end;

function u3.highlightPart(p27, p28, p29, p30) -- Line: 141
    local v31 = {};

    for _, v in Enum.NormalId:GetEnumItems() do
        local v32 = "entity-highlight-texture:" .. tostring(v.Value);
        local v33 = p28:FindFirstChild(v32);

        if not v33 then
            v33 = Instance.new("Texture");
            v33.Name = v32;
            v33.Face = v;
            v33.Parent = p28;
        end;

        v33.Texture = p30 == nil and "rbxassetid://5090332523" or p30;
        v33.Color3 = p29 or Color3.new(1, 0, 0);
        v33.Transparency = 0.4;
        table.insert(v31, v33);
    end;

    return v31;
end;

KnitClient.CreateController(u3.new());

return nil;