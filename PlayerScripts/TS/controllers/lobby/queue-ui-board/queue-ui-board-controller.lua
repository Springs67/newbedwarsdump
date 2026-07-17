-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ResetTime = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local StoreProvider = u2.StoreProvider;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local OneForAllUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "one-for-all", "one-for-all-util").OneForAllUtil;
local QueueUiBoard = RuntimeLib.import(script, script.Parent, "ui", "queue-ui-board").QueueUiBoard;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "QueueUiBoardController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "QueueUiBoardController";
    p5.queuePart = {};
    p5.queueBoard = {};
    p5.uiBacklog = {};
end;

function u3.KnitStart(u6) -- Line: 35
    -- upvalues: KnitController (copy), Workspace (copy), ResetTime (copy), OneForAllUtil (copy)
    KnitController.KnitStart(u6);
    task.spawn(function() -- Line: 37
        -- upvalues: Workspace (ref), ResetTime (ref), OneForAllUtil (ref), u6 (copy)
        local Lobby = Workspace:WaitForChild("Lobby");

        if Lobby ~= nil then
            Lobby = Lobby:WaitForChild("Queues", 15);
        end;

        if Lobby ~= nil then
            local v7 = Lobby:GetChildren();

            local function v10(p8) -- Line: 47
                -- upvalues: ResetTime (ref), OneForAllUtil (ref), u6 (ref)
                local Name = p8.Name;

                if p8:IsA("BasePart") then
                    ResetTime.new(OneForAllUtil.getCurrTimestamp() - OneForAllUtil.pickInterval);
                    u6.queuePart[Name] = p8;
                    local v9 = u6.uiBacklog[Name];

                    if v9 then
                        u6:displayUI(Name, p8, v9.hook, v9.props, v9.config);
                    end;
                end;
            end;

            for i, v in v7 do
                v10(v, i - 1, v7);
            end;
        end;
    end);
end;

function u3.mountUI(p11, p12, p13, p14, p15) -- Line: 68
    local v16 = p11.queuePart[p12];

    if v16 then
        p11:displayUI(p12, v16, p13, p14, p15);

        return;
    end;

    p11.uiBacklog[p12] = {
        hook = p13,
        props = p14,
        config = p15
    };
end;

function u3.displayUI(p17, p18, u19, u20, u21, u22) -- Line: 85
    -- upvalues: u2 (copy), QueueUiBoard (copy), u1 (copy), StoreProvider (copy), ClientStore (copy)
    local v23 = p17.queueBoard[p18];

    if v23 then
        u1.update(v23, u1.createElement(QueueUiBoard, {
            Adornee = u19,
            uiHook = u20,
            hookProps = not u21 and {} or u21(ClientStore:getState()),
            config = u22
        }));

        return;
    end;

    local v26 = u2.connect(function(p24, p25) -- Line: 90
        -- upvalues: u19 (copy), u20 (copy), u21 (copy), u22 (copy)
        return {
            Adornee = u19,
            uiHook = u20,
            hookProps = not u21 and {} or u21(p24),
            config = u22
        };
    end)(QueueUiBoard);
    local v27 = u1.mount(u1.createElement(StoreProvider, {
        store = ClientStore
    }, { u1.createElement(v26) }), u19);
    p17.queueBoard[p18] = v27;
end;

KnitClient.CreateController(u3.new());

return nil;