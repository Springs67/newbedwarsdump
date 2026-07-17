-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "LobbyFontController";
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
    p3.Name = "LobbyFontController";
end;

function u1.KnitStart(p4) -- Line: 24
    -- upvalues: KnitController (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(p4);
    WatchCollectionTag("LobbyFont", function(u5) -- Line: 26
        local _ = Enum.Font.LuckiestGuy;

        if u5:IsA("TextLabel") then
            local function u9(u6) -- Line: 29
                -- upvalues: u5 (copy)
                local function _(p7) -- Line: 31
                    -- upvalues: u6 (copy)
                    return p7.Name == u6;
                end;

                local v8 = nil;

                for i, v in Enum.Font:GetEnumItems() do
                    local _ = i - 1;

                    if v.Name == u6 == true then
                        v8 = v;
                        break;
                    end;
                end;

                if v8 then
                    u5.Font = v8;
                end;
            end;

            u9(u5:GetAttribute("FontName"));
            u5:GetAttributeChangedSignal("FontName"):Connect(function() -- Line: 49
                -- upvalues: u9 (copy), u5 (copy)
                u9(u5:GetAttribute("FontName"));
            end);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;