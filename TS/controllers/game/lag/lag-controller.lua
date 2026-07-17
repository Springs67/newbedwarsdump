-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ExpireList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v1 = {};
local u2 = setmetatable({}, {
    __index = v1
});
u2.HEALTHY = 60;
v1[60] = "HEALTHY";
u2.LAGGING = 50;
v1[50] = "LAGGING";
u2.CRITICAL = 30;
v1[30] = "CRITICAL";
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "LagController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 35
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 39
    -- upvalues: KnitController (copy), ExpireList (copy)
    KnitController.constructor(p5);
    p5.Name = "LagController";
    p5.elapsedTime = 0;
    p5.frameList1 = ExpireList.new(10);
    p5.frameList2 = ExpireList.new(30);
    p5.frameList3 = ExpireList.new(60);
    p5.frameList4 = ExpireList.new(180);
    p5.frameList5 = ExpireList.new(600);
end;

function u3.KnitStart(p6) -- Line: 49
end;

function u3.snapshotFPSAverages(p7) -- Line: 51
    local v8 = {
        #p7.frameList1:getValues(),
        #p7.frameList2:getValues(),
        #p7.frameList3:getValues(),
        #p7.frameList4:getValues(),
        #p7.frameList5:getValues()
    };
    local v9 = false;
    local v10 = 0;
    local v11 = { 10, 30, 60, 180, 600 };
    local v12 = {};

    while true do
        if v9 then
            v10 = v10 + 1;
        else
            v9 = true;
        end;

        if v10 >= #v11 then
            return v12;
        end;

        local v13 = v8[v10 + 1] / v11[v10 + 1];

        if p7.elapsedTime > v11[v10 + 1] then
            table.insert(v12, { v11[v10 + 1], v13 });
        else
            table.insert(v12, { v11[v10 + 1], -1 });
        end;
    end;
end;

function u3.getFPSHealth(p14) -- Line: 79
    -- upvalues: u2 (ref)
    local HEALTHY = u2.HEALTHY;

    local function _(p15, p16) -- Line: 82
        -- upvalues: u2 (ref), HEALTHY (ref)
        local v17 = p15[1];
        local v18 = p15[2];

        if v18 == -1 then
            return nil;
        end;

        if v18 < u2.LAGGING and v17 > 10 then
            HEALTHY = u2.LAGGING;
        end;

        if v18 < u2.CRITICAL and v17 > 30 then
            HEALTHY = u2.CRITICAL;
        end;
    end;

    for i, v in p14:snapshotFPSAverages() do
        local _ = i - 1;
        local v19 = v[1];
        local v20 = v[2];

        if v20 ~= -1 then
            if v20 < u2.LAGGING and v19 > 10 then
                HEALTHY = u2.LAGGING;
            end;

            if v20 < u2.CRITICAL and v19 > 30 then
                HEALTHY = u2.CRITICAL;
            end;
        end;
    end;

    return HEALTHY;
end;

KnitClient.CreateController(u3.new());

return {
    RenderHealth = u2
};