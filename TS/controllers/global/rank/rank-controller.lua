-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "RankController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "RankController";
    p3.rankCache = {};
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

function u1.getRanks(u5, p6, p7) -- Line: 28
    -- upvalues: default (copy), RuntimeLib (copy)
    local u8 = {};

    if not p7 and next(u5.rankCache) ~= nil then
        local function _(p9) -- Line: 34
            -- upvalues: u5 (copy), u8 (copy)
            local v10 = u5.rankCache[p9];

            if v10 == 0 or (v10 ~= v10 or not v10) then
                return p9;
            end;

            table.insert(u8, {
                userId = p9,
                rankDivision = v10
            });

            return nil;
        end;

        local v11 = 0;
        p6 = {};

        for i, v in p6 do
            local _ = i - 1;
            local v12 = u5.rankCache[v];

            if v12 ~= 0 and (v12 == v12 and v12) then
                table.insert(u8, {
                    userId = v,
                    rankDivision = v12
                });
                local v = nil;
            end;

            if v ~= nil then
                v11 = v11 + 1;
                p6[v11] = v;
            end;
        end;
    end;

    local v13;

    if #p6 == 0 then
        v13 = RuntimeLib.Promise.new(function(p14) -- Line: 64
            return p14({});
        end);
    else
        v13 = default.Client:Get("FetchRanks"):CallServerAsync(p6);
    end;

    return RuntimeLib.Promise.all({ v13, RuntimeLib.Promise.new(function(p15) -- Line: 67
            -- upvalues: u8 (copy)
            return p15(u8);
        end) }):andThen(function(p16) -- Line: 70
        -- upvalues: u5 (copy)
        local v17 = p16[1];
        local v18 = p16[2];

        local function _(p19) -- Line: 74
            -- upvalues: u5 (ref)
            u5.rankCache[p19.userId] = p19.rankDivision;
        end;

        for i, v in v17 do
            local _ = i - 1;
            u5.rankCache[v.userId] = v.rankDivision;
        end;

        local v20 = {};
        local v21 = #v20;
        local v22 = #v17;
        table.move(v17, 1, v22, v21 + 1, v20);
        table.move(v18, 1, #v18, v21 + v22 + 1, v20);

        return v20;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;