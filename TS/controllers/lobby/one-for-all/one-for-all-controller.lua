-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ResetTime = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local OneForAllUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "one-for-all", "one-for-all-util").OneForAllUtil;
local OneForAllBoard = RuntimeLib.import(script, script.Parent, "ui", "one-for-all-board").OneForAllBoard;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "OneForAllController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "OneForAllController";
    p4.board = nil;
    p4.activeKit = nil;
    p4.nextEndTime = 0;
end;

function u2.KnitStart(u5) -- Line: 33
    -- upvalues: KnitController (copy), u2 (ref), getQueueMeta (copy), Workspace (copy), ResetTime (copy), OneForAllUtil (copy)
    KnitController.KnitStart(u5);

    local function _(p6) -- Line: 36
        -- upvalues: getQueueMeta (ref)
        return not getQueueMeta(p6).disabled;
    end;

    local v7 = true;

    for i, v in u2.QueueTypes do
        local _ = i - 1;

        if getQueueMeta(v).disabled then
            v7 = false;
            break;
        end;
    end;

    if not v7 then
        return nil;
    end;

    task.spawn(function() -- Line: 52
        -- upvalues: Workspace (ref), u2 (ref), ResetTime (ref), OneForAllUtil (ref), u5 (copy)
        local Lobby = Workspace:WaitForChild("Lobby");

        if Lobby ~= nil then
            Lobby = Lobby:WaitForChild("Queues", 5);
        end;

        if Lobby ~= nil then
            local v8 = Lobby:GetChildren();

            local function v11(u9) -- Line: 62
                -- upvalues: u2 (ref), ResetTime (ref), OneForAllUtil (ref), u5 (ref)
                if table.find(u2.QueueTypes, u9.Name) == nil then
                    return nil;
                end;

                if u9:IsA("BasePart") then
                    local v10 = ResetTime.new(OneForAllUtil.getCurrTimestamp() - OneForAllUtil.pickInterval);
                    u5.activeKit = OneForAllUtil.pickRandomKit();
                    u5.nextEndTime = v10:getNextResetTime(OneForAllUtil.pickInterval);
                    u5:mountBoard(u9, u5.activeKit, u5.nextEndTime);
                    v10:poll(OneForAllUtil.pickInterval, OneForAllUtil.pickInterval, function() -- Line: 74
                        -- upvalues: u5 (ref), OneForAllUtil (ref), u9 (copy)
                        u5.activeKit = OneForAllUtil.pickRandomKit();
                        u5.nextEndTime = os.time() - os.time() % OneForAllUtil.pickInterval + OneForAllUtil.pickInterval;
                        u5:mountBoard(u9, u5.activeKit, u5.nextEndTime);
                    end);
                end;
            end;

            for i, v in v8 do
                v11(v, i - 1, v8);
            end;
        end;
    end);
end;

function u2.mountBoard(p12, p13, p14, p15) -- Line: 87
    -- upvalues: u1 (copy), OneForAllBoard (copy)
    if p12.board then
        u1.update(p12.board, u1.createElement(OneForAllBoard, {
            Adornee = p13,
            BedwarsKit = p14,
            EndTime = p15
        }));

        return;
    end;

    p12.board = u1.mount(u1.createElement(OneForAllBoard, {
        Adornee = p13,
        BedwarsKit = p14,
        EndTime = p15
    }), p13);
end;

function u2.getActiveKit(p16) -- Line: 102
    return p16.activeKit;
end;

function u2.getNextEndTime(p17) -- Line: 105
    return p17.nextEndTime;
end;

u2.QueueTypes = { QueueType.ALL_SAME_KIT_TO4 };
KnitClient.CreateController(u2.new());

return nil;