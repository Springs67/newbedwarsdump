-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local QueueCard = RuntimeLib.import(script, script.Parent, "queue-card").QueueCard;
local u2 = u1.Component:extend("QueueApp");

function u2.init(p3) -- Line: 9
end;

function u2.render(p4) -- Line: 11
    -- upvalues: u1 (copy), QueueCard (copy), KnitClient (copy)
    return u1.createFragment({ u1.createElement(QueueCard, {
            QueueData = p4.props.store.Party.queueData,
            QueueState = p4.props.store.Party.queueState,

            OnLeaveQueue = function() -- Line: 16, Name: OnLeaveQueue
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.QueueController:leaveQueue();
            end
        }) });
end;

return {
    QueueAppWrapper = function(p5) -- Line: 23, Name: QueueAppWrapper
        -- upvalues: u1 (copy), u2 (ref)
        return u1.createFragment({
            QueueApp = u1.createElement("ScreenGui", {
                IgnoreGuiInset = true,
                DisplayOrder = 1000,
                ResetOnSpawn = false
            }, { u1.createElement(u2, {
                    store = p5.store
                }) })
        });
    end,

    QueueApp = u2
};