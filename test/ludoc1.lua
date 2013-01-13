-- API experiments


Ludoc = {}

Collection = {}



-- cfg: database configuration
function Ludoc:opendb(cfg)
    local d = {}
    d._config = cfg
    setmetatable(d, {__index = self})
    return d
end

function Ludoc:ensureCollection(cfg)

end

function Ludoc:getCollection(name, cfg)
    o = {}
    setmetatable(o, {__index = self})
    return o
end

-- run a transaction 
-- fn: callback function(db, tran)
function Ludoc:doTransaction(fn)
    fn(self, {})
end


local exampleConfig = {
    collections = {
        {
            name = "c1",
            indexes = {
                {name = "name", fields = {"active", "name"}},
                {
                    name = "custom", indexer = function(r)
                    end
                }
            },
            serialize = function(doc)
            end,
            deserialize = function(data)
            end
        }
    }
}

-- get document with given id
function Collection:get(id)

end

--- modify specified doc with fn function
function Collection:modify(id, fn)

end

---insert or replace a document
function Collection:save(doc)

end

function Collection:queryByIndex(indexName, querySpec)

end

db = Ludoc:opendb(exampleConfig)

col = db.getCollection("doc1")

db:doTransaction(function(d, t)
    print("in transaction")
end)