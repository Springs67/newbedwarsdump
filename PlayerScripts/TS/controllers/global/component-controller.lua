-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local Component = v1.Component;
local KnitClient = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "ComponentController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "ComponentController";
end;

function u3.KnitStart(p6) -- Line: 27
    -- upvalues: RuntimeLib (copy), Component (copy), u2 (copy)
    local v7 = os.clock();
    local Parent = script.Parent;

    if Parent ~= nil then
        Parent = Parent.Parent;

        if Parent ~= nil then
            Parent = Parent.Parent;

            if Parent ~= nil then
                Parent = Parent:WaitForChild("components");
            end;
        end;
    end;

    if not Parent then
        error("No components folder");
    end;

    local u8 = 0;

    for _, descendant in Parent:GetDescendants() do
        local _, _ = RuntimeLib.try(function() -- Line: 46
            -- upvalues: descendant (copy), RuntimeLib (ref), Component (ref), u8 (ref)
            if not descendant:IsA("ModuleScript") then
                return RuntimeLib.TRY_CONTINUE;
            end;

            local v9 = string.find(descendant.Name, "-component");

            if v9 == 0 or (v9 ~= v9 or not v9) then
                return RuntimeLib.TRY_CONTINUE;
            end;

            local v10 = require(descendant);
            local Tag = v10.Tag;

            if Tag == "" or not Tag then
                Tag = descendant.Name;
            end;

            Component.new(Tag, v10);
            u8 = u8 + 1;
        end, function(p11) -- Line: 61
            -- upvalues: u2 (ref)
            print("[Knit Client]: Error registering component:", u2(p11));
        end);
    end;

    local v12 = os.clock() - v7;
    local v13 = math.floor(v12);
    print("[Knit Client]: Registered " .. tostring(u8) .. " components in " .. tostring(v13) .. "ms");
end;

return {
    ComponentController = KnitClient.CreateController(u3.new())
};