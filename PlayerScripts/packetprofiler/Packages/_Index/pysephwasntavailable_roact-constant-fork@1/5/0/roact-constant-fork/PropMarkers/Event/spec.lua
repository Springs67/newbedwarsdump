-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Type = require(script.Parent.Parent.Type);
    local Event = require(script.Parent.Event);
    it("should yield event objects when indexed", function() -- Line: 6
        -- upvalues: Type (copy), Event (copy)
        expect(Type.of(Event.MouseButton1Click)).to.equal(Type.HostEvent);
        expect(Type.of(Event.Touched)).to.equal(Type.HostEvent);
    end);
    it("should yield the same object when indexed again", function() -- Line: 11
        -- upvalues: Event (copy)
        local MouseButton1Click = Event.MouseButton1Click;
        local MouseButton1Click2 = Event.MouseButton1Click;
        local Touched = Event.Touched;
        expect(MouseButton1Click).to.equal(MouseButton1Click2);
        expect(MouseButton1Click).never.to.equal(Touched);
    end);
end;