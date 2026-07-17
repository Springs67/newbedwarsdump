-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "DiscoEmoteController";
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
    p4.Name = "DiscoEmoteController";
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), Workspace (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local DISCO = EmoteType.DISCO;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 36, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 42
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 46
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(p10, p11, p12, p13, p14) -- Line: 49
        -- upvalues: ReplicatedStorage (ref), Workspace (ref)
        local u15 = ReplicatedStorage.Assets.Misc.DiscoFloorTile:Clone();

        local function _(p16) -- Line: 52
            if p16:IsA("BasePart") then
                p16.CanQuery = false;
                p16.CanCollide = false;
            end;
        end;

        for i, descendant in u15:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CanQuery = false;
                descendant.CanCollide = false;
            end;
        end;

        u15.Parent = Workspace;
        u15:PivotTo(p12:GetPivot() - Vector3.new(0, p12.Humanoid.HipHeight + p12.PrimaryPart.Size.Y / 2, 0));
        local u17 = true;
        task.spawn(function() -- Line: 68
            -- upvalues: u17 (ref), u15 (copy)
            local v18 = false;

            while true do
                local v19 = u17 and task.wait(0.5);

                if v19 == 0 or (v19 ~= v19 or not v19) then
                    return;
                end;

                local Tile1 = u15.Tile1;
                local v20;

                if v18 then
                    v20 = Color3.fromRGB(255, 0, 0);
                else
                    v20 = Color3.fromRGB(255, 102, 204);
                end;

                Tile1.Color = v20;
                local Tile2 = u15.Tile2;
                local v21;

                if v18 then
                    v21 = Color3.fromRGB(255, 102, 204);
                else
                    v21 = Color3.fromRGB(255, 0, 0);
                end;

                Tile2.Color = v21;
                local Tile3 = u15.Tile3;
                local v22;

                if v18 then
                    v22 = Color3.fromRGB(255, 0, 0);
                else
                    v22 = Color3.fromRGB(255, 102, 204);
                end;

                Tile3.Color = v22;
                local Tile4 = u15.Tile4;
                local v23;

                if v18 then
                    v23 = Color3.fromRGB(255, 102, 204);
                else
                    v23 = Color3.fromRGB(255, 0, 0);
                end;

                Tile4.Color = v23;
                v18 = not v18;
            end;
        end);
        p14:GiveTask(function() -- Line: 82
            -- upvalues: u17 (ref), u15 (copy)
            u17 = false;
            u15:Destroy();
        end);
    end;

    function u7.onDisable(p24, p25, p26, p27) -- Line: 87
    end;

    EmoteHandlerController:registerHandler(DISCO, u7);
end;

KnitClient.CreateController(u2.new());

return nil;