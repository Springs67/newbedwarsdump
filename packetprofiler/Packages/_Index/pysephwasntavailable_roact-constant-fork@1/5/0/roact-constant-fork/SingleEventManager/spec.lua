-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.assertDeepEqual);
    local createSpy = require(script.Parent.createSpy);
    local Logging = require(script.Parent.Logging);
    local SingleEventManager = require(script.Parent.SingleEventManager);
    describe("new", function() -- Line: 8
        -- upvalues: SingleEventManager (copy)
        it("should create a SingleEventManager", function() -- Line: 9
            -- upvalues: SingleEventManager (ref)
            local v1 = SingleEventManager.new();
            expect(v1).to.be.ok();
        end);
    end);
    describe("connectEvent", function() -- Line: 16
        -- upvalues: SingleEventManager (copy), createSpy (copy), assertDeepEqual (copy), Logging (copy)
        it("should connect to events", function() -- Line: 17
            -- upvalues: SingleEventManager (ref), createSpy (ref)
            local BindableEvent = Instance.new("BindableEvent");
            local v2 = SingleEventManager.new(BindableEvent);
            local v3 = createSpy();
            v2:connectEvent("Event", v3.value);
            v2:resume();
            BindableEvent:Fire("foo");
            expect(v3.callCount).to.equal(1);
            v3:assertCalledWith(BindableEvent, "foo");
            BindableEvent:Fire("bar");
            expect(v3.callCount).to.equal(2);
            v3:assertCalledWith(BindableEvent, "bar");
            v2:connectEvent("Event", nil);
            BindableEvent:Fire("baz");
            expect(v3.callCount).to.equal(2);
        end);
        it("should drop events until resumed initially", function() -- Line: 39
            -- upvalues: SingleEventManager (ref), createSpy (ref)
            local BindableEvent = Instance.new("BindableEvent");
            local v4 = SingleEventManager.new(BindableEvent);
            local v5 = createSpy();
            v4:connectEvent("Event", v5.value);
            BindableEvent:Fire("foo");
            expect(v5.callCount).to.equal(0);
            v4:resume();
            BindableEvent:Fire("bar");
            expect(v5.callCount).to.equal(1);
            v5:assertCalledWith(BindableEvent, "bar");
        end);
        it("should invoke suspended events when resumed", function() -- Line: 56
            -- upvalues: SingleEventManager (ref), createSpy (ref)
            local BindableEvent = Instance.new("BindableEvent");
            local v6 = SingleEventManager.new(BindableEvent);
            local v7 = createSpy();
            v6:connectEvent("Event", v7.value);
            v6:resume();
            BindableEvent:Fire("foo");
            expect(v7.callCount).to.equal(1);
            v7:assertCalledWith(BindableEvent, "foo");
            v6:suspend();
            BindableEvent:Fire("bar");
            expect(v7.callCount).to.equal(1);
            v6:resume();
            expect(v7.callCount).to.equal(2);
            v7:assertCalledWith(BindableEvent, "bar");
        end);
        it("should invoke events triggered during resumption in the correct order", function() -- Line: 78
            -- upvalues: SingleEventManager (ref), createSpy (ref), assertDeepEqual (ref)
            local BindableEvent = Instance.new("BindableEvent");
            local v8 = SingleEventManager.new(BindableEvent);
            local u9 = {};
            local v12 = createSpy(function(p10, p11) -- Line: 83
                -- upvalues: u9 (copy), BindableEvent (copy)
                table.insert(u9, p11);

                if p11 == 2 then
                    BindableEvent:Fire(3);

                    return;
                end;

                if p11 == 3 then
                    BindableEvent:Fire(4);
                end;
            end);
            v8:connectEvent("Event", v12.value);
            v8:suspend();
            BindableEvent:Fire(1);
            BindableEvent:Fire(2);
            v8:resume();
            expect(v12.callCount).to.equal(4);
            assertDeepEqual(u9, { 1, 2, 3, 4 });
        end);
        it("should not invoke events fired during suspension but disconnected before resumption", function() -- Line: 104
            -- upvalues: SingleEventManager (ref), createSpy (ref)
            local BindableEvent = Instance.new("BindableEvent");
            local v13 = SingleEventManager.new(BindableEvent);
            local v14 = createSpy();
            v13:connectEvent("Event", v14.value);
            v13:suspend();
            BindableEvent:Fire(1);
            v13:connectEvent("Event", nil);
            v13:resume();
            expect(v14.callCount).to.equal(0);
        end);
        it("should not yield events through the SingleEventManager when resuming", function() -- Line: 120
            -- upvalues: SingleEventManager (ref)
            local BindableEvent = Instance.new("BindableEvent");
            local u15 = SingleEventManager.new(BindableEvent);
            u15:connectEvent("Event", function() -- Line: 124
                coroutine.yield();
            end);
            u15:resume();
            local v16 = coroutine.create(function() -- Line: 130
                -- upvalues: BindableEvent (copy)
                BindableEvent:Fire(5);
            end);
            assert(coroutine.resume(v16));
            expect(coroutine.status(v16)).to.equal("dead");
            u15:suspend();
            BindableEvent:Fire(5);
            local v17 = coroutine.create(function() -- Line: 140
                -- upvalues: u15 (copy)
                u15:resume();
            end);
            assert(coroutine.resume(v17));
            expect(coroutine.status(v17)).to.equal("dead");
        end);
        it("should not throw errors through SingleEventManager when resuming", function() -- Line: 148
            -- upvalues: SingleEventManager (ref), Logging (ref)
            local BindableEvent = Instance.new("BindableEvent");
            local u18 = SingleEventManager.new(BindableEvent);
            u18:connectEvent("Event", function() -- Line: 154
                error("Error from SingleEventManager test");
            end);
            u18:resume();
            u18:suspend();
            BindableEvent:Fire(5);
            local v19 = Logging.capture(function() -- Line: 167
                -- upvalues: u18 (copy)
                u18:resume();
            end);
            expect(#v19.errors).to.equal(0);
            expect(#v19.warnings).to.equal(1);
            expect(#v19.infos).to.equal(0);
            expect(v19.warnings[1]:find("Error from SingleEventManager test")).to.be.ok();
        end);
        it("should not overflow with events if manager:resume() is invoked when resuming a suspended event", function() -- Line: 178
            -- upvalues: SingleEventManager (ref), createSpy (ref)
            local BindableEvent = Instance.new("BindableEvent");
            local u20 = SingleEventManager.new(BindableEvent);
            local v23 = createSpy(function(p21, p22) -- Line: 186
                -- upvalues: u20 (copy), BindableEvent (copy)
                if p22 == 1 then
                    u20:suspend();
                    BindableEvent:Fire(2);
                    u20:resume();
                end;
            end);
            u20:connectEvent("Event", v23.value);
            u20:suspend();
            BindableEvent:Fire(1);
            u20:resume();
            expect(v23.callCount).to.equal(2);
        end);
    end);
    describe("connectPropertyChange", function() -- Line: 204
        -- upvalues: SingleEventManager (copy), createSpy (copy)
        it("should connect to property changes", function() -- Line: 208
            -- upvalues: SingleEventManager (ref), createSpy (ref)
            local Folder = Instance.new("Folder");
            local v24 = SingleEventManager.new(Folder);
            local v25 = createSpy();
            v24:connectPropertyChange("Name", v25.value);
            v24:resume();
            Folder.Name = "foo";
            expect(v25.callCount).to.equal(1);
            v25:assertCalledWith(Folder);
            Folder.Name = "bar";
            expect(v25.callCount).to.equal(2);
            v25:assertCalledWith(Folder);
            v24:connectPropertyChange("Name");
            Folder.Name = "baz";
            expect(v25.callCount).to.equal(2);
        end);
        it("should throw an error if the property is invalid", function() -- Line: 230
            -- upvalues: SingleEventManager (ref)
            local Folder = Instance.new("Folder");
            local u26 = SingleEventManager.new(Folder);
            expect(function() -- Line: 234
                -- upvalues: u26 (copy)
                u26:connectPropertyChange("foo", function() -- Line: 235
                end);
            end).to.throw();
        end);
    end);
end;