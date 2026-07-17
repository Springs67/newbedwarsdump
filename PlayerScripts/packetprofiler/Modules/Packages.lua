-- Decompiled with Potassium's decompiler.

local Parent = script.Parent.Parent;
local Packages = Parent:FindFirstChild("Packages");

return {
    Directory = Packages or Parent.Parent,
    IsPlugin = Packages ~= nil
};