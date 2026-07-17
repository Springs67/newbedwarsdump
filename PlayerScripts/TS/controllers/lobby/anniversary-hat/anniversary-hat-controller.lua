-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local AnniversaryHat2025 = ReplicatedStorage.Assets.Misc.AnniversaryHat2025;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "AnniversaryHatController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "AnniversaryHatController";
    p4.disabled = true;
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: KnitController (copy), PlaceUtil (copy), WatchCharacter (copy), AnniversaryHat2025 (copy), RandomUtil (copy), WeldUtil (copy), WatchCollectionTag (copy)
    if p5.disabled then
        return nil;
    end;

    KnitController.KnitStart(p5);

    if PlaceUtil.isLobbyServer() then
        WatchCharacter(function(p6, p7) -- Line: 38
            -- upvalues: AnniversaryHat2025 (ref), RandomUtil (ref), WeldUtil (ref)
            local v8 = AnniversaryHat2025:GetChildren();
            RandomUtil.fromList(unpack(v8)):Clone().Parent = p7;
            WeldUtil:weldCharacterAccessories(p7);
        end);
        WatchCollectionTag("NpcModel", function(u9) -- Line: 44
            -- upvalues: AnniversaryHat2025 (ref), RandomUtil (ref), WeldUtil (ref)
            task.spawn(function() -- Line: 45
                -- upvalues: u9 (copy), AnniversaryHat2025 (ref), RandomUtil (ref), WeldUtil (ref)
                local function _(p10) -- Line: 47
                    local v11 = p10:IsA("MeshPart") and string.find(string.lower(p10.Name), "hat");

                    if v11 ~= 0 and (v11 == v11 and v11) then
                        p10:Destroy();
                    end;
                end;

                for i, descendant in u9:GetDescendants() do
                    local _ = i - 1;
                    local v12 = descendant:IsA("MeshPart") and string.find(string.lower(descendant.Name), "hat");

                    if v12 ~= 0 and (v12 == v12 and v12) then
                        descendant:Destroy();
                    end;
                end;

                local v13 = AnniversaryHat2025:GetChildren();
                RandomUtil.fromList(unpack(v13)):Clone().Parent = u9;
                WeldUtil:weldCharacterAccessories(u9);
            end);
        end);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;