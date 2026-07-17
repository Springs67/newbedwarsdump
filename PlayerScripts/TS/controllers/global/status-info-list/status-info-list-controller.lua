-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local Signal = v1.Signal;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local StatusInfoList = RuntimeLib.import(script, script.Parent, "status-info-list").StatusInfoList;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "StatusInfoListController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    -- upvalues: KnitController (copy), Signal (copy)
    KnitController.constructor(p5);
    p5.Name = "StatusInfoListController";
    p5.isListSetup = false;
    p5.listSetupSignal = Signal.new();
    p5.listElementsQueue = {};
end;

function u3.KnitStart(u6) -- Line: 32
    -- upvalues: KnitController (copy), u2 (copy), StatusInfoList (copy), Players (copy)
    KnitController.KnitStart(u6);
    u6.tree = u2.mount(u2.createElement(StatusInfoList, {
        SetupRef = function(p7) -- Line: 35, Name: SetupRef
            -- upvalues: u6 (copy)
            u6.list = p7;
            u6.isListSetup = true;
            u6.listSetupSignal:Fire(p7);
        end
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u6.listSetupSignal:Connect(function(p8) -- Line: 41
        -- upvalues: u6 (copy)
        local function _(p9) -- Line: 43
            -- upvalues: u6 (ref)
            u6:addElement(p9.element, p9.position);
        end;

        for i, v in u6.listElementsQueue do
            local _ = i - 1;
            u6:addElement(v.element, v.position);
        end;
    end);
end;

function u3.addElement(p10, p11, p12, p13, p14) -- Line: 51
    -- upvalues: u2 (copy), Empty (copy)
    if p10.list then
        if p12 then
            local v15 = p12 == "Right" and #p10.list:GetChildren() or 0;

            if p12 == "Left" then
                p10:shiftListLayoutOrder();
                v15 = 0;
            end;

            p11 = u2.createFragment({
                [p14 == nil and "StatusInfoElement" or p14] = u2.createElement(Empty, {
                    Size = p13 or UDim2.fromScale(1, 1),
                    LayoutOrder = v15
                }, { p11 })
            });
        end;

        return u2.mount(p11, p10.list);
    end;

    table.insert(p10.listElementsQueue, {
        element = p11,
        position = p12
    });

    return nil;
end;

function u3.waitForSetupAddElement(p16, p17, p18, p19, p20) -- Line: 85
    if not p16.isListSetup then
        p16.listSetupSignal:Wait();
    end;

    return p16:addElement(p17, p18, p20, p19);
end;

function u3.getList(p21) -- Line: 91
    return p21.list;
end;

function u3.shiftListLayoutOrder(p22) -- Line: 94
    local list = p22.list;

    if list ~= nil then
        local function _(p23) -- Line: 98
            if p23:IsA("GuiObject") then
                p23.LayoutOrder = p23.LayoutOrder + 1;
            end;
        end;

        for i, child in list:GetChildren() do
            local _ = i - 1;

            if child:IsA("GuiObject") then
                child.LayoutOrder = child.LayoutOrder + 1;
            end;
        end;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;