local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Repository = require 'repository.Repository'

describe('Repository', function ()
    it('instantiate', function ()
        expect(Repository()).to.be.a('table')
    end)

    local file = 'test/repository/assets/dummy.lua'
    local data = {}
    local instance

    it('instantiate from table', function ()
        instance = Repository(data)
        expect(instance).to.be.a('table')
    end)

    it('loadData', function ()
        local t = instance:loadData { id = 'dummy', foo = 123, bar = 456 }
        expect(t).to.be.a('table')
        expect(t.id).to.be('dummy')
        expect(t.foo).to.be(123)
        expect(t.bar).to.be(456)
    end)

    it('loadDataTable', function ()
        local num = instance:loadDataTable {
            { id = 'dummy1', foo = 123, bar = 456 },
            { id = 'dummy2', foo = 789, bar = 111 }
        }
        expect(num).to.be(2)
    end)

    describe('get', function ()
        it('get dummy2', function ()
            local t = instance:get 'dummy2'
            expect(t).to.be.a('table')
            expect(t.id).to.be('dummy2')
            expect(t.foo).to.be(789)
            expect(t.bar).to.be(111)
        end)
        it('get [1]', function ()
            local t = instance:get(1)
            expect(t).to.be.a('table')
            expect(t.id).to.be('dummy1')
            expect(t.foo).to.be(123)
            expect(t.bar).to.be(456)
        end)
    end)

    describe('set', function ()
        it('set dummy2', function ()
            instance:set { id = 'dummy2', foo = 42, bar = 42 }
            local t = instance:get 'dummy2'
            expect(t.foo).to.be(42)
        end)
        it('set dummy3', function ()
            instance:set { id = 'dummy3', foo = 111, bar = 999 }
            local t = instance:get 'dummy3'
            expect(t.id).to.be('dummy3')
            expect(t.foo).to.be(111)
            expect(t.bar).to.be(999)
        end)
    end)

    it('reset', function ()
        instance:reset()
        expect(instance:get 'dummy2').to.be.a('nil')
        expect(instance:get(1)).to.be.a('nil')
    end)

    describe('load', function ()
        it('load file', function ()
            instance:load(file)
        end)
        it('get dummy2', function ()
            local t = instance:get 'dummy2'
            expect(t).to.be.a('table')
            expect(t.id).to.be('dummy2')
            expect(t.foo).to.be(789)
            expect(t.bar).to.be(111)
        end)
        it('get [1]', function ()
            local t = instance:get(1)
            expect(t).to.be.a('table')
            expect(t.id).to.be('dummy1')
            expect(t.foo).to.be(123)
            expect(t.bar).to.be(456)
        end)
    end)

    it('save', function ()
        expect(instance:save(file)).to_not.be.truthy()
    end)
end)
