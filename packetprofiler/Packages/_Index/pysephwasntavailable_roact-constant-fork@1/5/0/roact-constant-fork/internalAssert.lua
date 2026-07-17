-- Decompiled with Potassium's decompiler.

return function(p1, p2) -- Line: 1, Name: internalAssert
    if not p1 then
        error(p2 .. " (This is probably a bug in Roact!)", 3);
    end;
end;