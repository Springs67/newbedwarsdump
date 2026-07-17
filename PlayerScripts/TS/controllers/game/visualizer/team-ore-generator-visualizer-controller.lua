-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "TeamOreGeneratorVisualizerController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 22
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "TeamOreGeneratorVisualizerController";
end;

function u4.KnitStart(p7) -- Line: 30
    -- upvalues: RuntimeLib (copy), default2 (copy), u2 (copy), Workspace (copy), CollectionService (copy), default (copy), u1 (copy)
    RuntimeLib.Promise.retryWithDelay(function() -- Line: 31
        -- upvalues: default2 (ref), u2 (ref), Workspace (ref), CollectionService (ref), default (ref), u1 (ref)
        return default2.Client:Get("GetAllTeamGenerators"):CallServerAsync():andThen(function(p8) -- Line: 32
            -- upvalues: u2 (ref), Workspace (ref), CollectionService (ref)
            local function v11(p9) -- Line: 34
                -- upvalues: u2 (ref), Workspace (ref), CollectionService (ref)
                local v10 = u2("CFrameValue", {
                    Name = "cframe-" .. p9.id,
                    Parent = Workspace,
                    Value = CFrame.new(p9.position)
                });
                v10:SetAttribute("id", p9.id);
                v10:SetAttribute("teamId", p9.teamId);
                v10:SetAttribute("position", v10.Value.Position);
                CollectionService:AddTag(v10, "TeamOreGeneratorVisualizer");
            end;

            for i, v in p8 do
                v11(v, i - 1, p8);
            end;
        end):catch(function(p12) -- Line: 48
            -- upvalues: default (ref), u1 (ref)
            return default.Warn("Failed to setup generator visuals with error reason: " .. u1(p12));
        end);
    end, 3, 10);
end;

KnitClient.CreateController(u4.new());

return nil;