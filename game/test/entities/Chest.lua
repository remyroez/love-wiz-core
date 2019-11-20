local lust = require 'test.lust'
local describe, it, expect = lust.describe, lust.it, lust.expect

local Chest = require 'entities.Chest'

describe('Chest', function ()
    it('instantiate', function ()
        expect(Chest()).to.be.a('table')
    end)

    local data = {
        gold = {
            probability = 100,
            min = 0,
            max = 100,
        },
        items = {
            {
                probability = 100,
                min = 1,
                max = 10,
            },
            {
                probability = 100,
                min = 2,
                max = 20,
            },
        }
    }
    local instance

    it('instantiate from table', function ()
        instance = Chest(data)
        expect(instance).to.be.a('table')
    end)

    describe('get', function ()
        local mindice = function (min, max)
            return min or max
        end
        local treasures = instance:get(mindice)
        it('gold', function ()
            expect(treasures.gold).to.be(0)
        end)
        it('items', function ()
            expect(treasures.items).to.be.a('table')
            expect(treasures.items[1]).to.be(1)
            expect(treasures.items[2]).to.be(2)
        end)
    end)
end)
