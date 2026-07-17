-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local CreativeQueueCard = RuntimeLib.import(script, script.Parent, "creative-queue-card").CreativeQueueCard;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "CreativeQueueDisplayController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "CreativeQueueDisplayController";
    p6.liveServerTrees = {};
    p6.liveServerDisplays = {};
end;

function u4.KnitStart(u7) -- Line: 33
    -- upvalues: KnitController (copy), default (copy), u3 (copy), CreativeQueueCard (copy), WatchCollectionTag (copy), u2 (copy), ColorUtil (copy), Workspace (copy)
    KnitController.KnitStart(u7);
    default.Client:GetNamespace("LiveCreativeServers"):Get("LiveServerDisplayUpdate"):Connect(function(p8) -- Line: 35
        -- upvalues: u7 (copy), u3 (ref), CreativeQueueCard (ref)
        u7.liveServerDisplays = p8;
        local v9 = false;
        local v10 = 0;

        while true do
            if v9 then
                v10 = v10 + 1;
            else
                v9 = true;
            end;

            if v10 >= #u7.liveServerTrees then
                return;
            end;

            u3.update(u7.liveServerTrees[v10 + 1].tree, u3.createElement(CreativeQueueCard, {
                Adornee = u7.liveServerTrees[v10 + 1].part,
                DisplayDto = u7.liveServerDisplays[v10 + 1]
            }));
        end;
    end);
    WatchCollectionTag("CustomMatchesNpc", function(p11) -- Line: 56
        -- upvalues: u2 (ref), ColorUtil (ref), Workspace (ref), u3 (ref), CreativeQueueCard (ref), u7 (copy)
        local CFrame2 = p11.PrimaryPart.CFrame;
        local v12 = false;
        local v13 = 0;

        while true do
            if v12 then
                v13 = v13 + 1;
            else
                v12 = true;
            end;

            if v13 >= 3 then
                return;
            end;

            local v14 = math.random() * 0.5;
            local v15 = Vector3.new(0, -5, -3) + Vector3.new(v13 * 4 + -4, v14, v13 == 1 and -1 or 0);
            local v16 = u2("Part", {
                Size = Vector3.new(4, 4, 0.2),
                Anchored = true,
                CanCollide = false,
                Transparency = 1,
                CFrame = CFrame.new(CFrame2 * v15) * (CFrame2 - CFrame2.Position),
                Material = Enum.Material.Rock,
                Color = ColorUtil.WHITE,
                Parent = Workspace
            });
            local v17 = u3.mount(u3.createElement(CreativeQueueCard, {
                Adornee = v16,
                DisplayDto = u7.liveServerDisplays[v13 + 1]
            }), v16);
            table.insert(u7.liveServerTrees, {
                tree = v17,
                part = v16
            });
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;