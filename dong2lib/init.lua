-- LOVE 0.9.0 -> 0.9.1 INDEX BUGFIX
if love._version_minor == 9 and love._version_revision == 0 then 
  local mt = debug.getregistry()["Joystick"]
  local _isDown = mt.__index.isDown
  function mt.__index.isDown(self, ...)
    local args = {...}
    for i,v in ipairs(args) do
      args[i] = args[i] - 1
    end
    return _isDown(self, unpack(args))
  end
end

local dong2 = {}

dong2.libDirName = "dong2lib"
dong2.index = require(dong2.libDirName..'.index')

function dong2.new(joystick)
  local d = {}

  -- Internals
  d._joystick = joystick

  d._t = 0
  d._data = {}
  d._key_instant_cache = {}

  for cType,cFullName in pairs(dong2.index) do
    if cFullName == d._joystick:getName() then
      d._map = require(dong2.libDirName..".types."..cType.."."..love._os:gsub("%s+", ""))
      d._type = cType
    end
  end
  if d._map == nil then
    -- TODO: write a teaching system
    print("There are no known mappings for controller `"..joystick:getName().."`.")
    return
  end

  -- Functions
  d.update = dong2.update

  -- OUYA deps on this :(
  d.keypressed = dong2.keypressed
  d._key_instant_check = dong2._key_instant_check

  d.setBind = dong2.setBind
  d.getBind = dong2.getBind
  d.getBindName = dong2.getBindName
  
  return d
end
 
function dong2:update(dt)
  self._t = self._t + dt
end

-- Wow, fuck you OUYA.
function dong2:keypressed(key)
  self._key_instant_cache[key] = true  
end

function dong2:_key_instant_check(key)
  if self._key_instant_cache[key] then
    self._key_instant_cache[key] = nil
    return true
  end
  return false
end

function dong2:setBind(bName,bCallback,bMap,bNameReal)

  assert(type(bName) == "string",
    ":setBind() arg1 error: bName should be a string.")
  assert(type(bCallback) == "function",
    ":setBind() arg2 error: bCallback should be a function.")
  assert(type(bMap) == "table",
    ":setBind() arg3 error: bMap should be a table.")
  for ctype,cobj in pairs(bMap) do
    assert(type(cobj) == "table",
      ":setBind() arg3 error: bMap element should be a table.")
    assert(type(cobj.args) == "table",
      ":setBind() arg3 error: bMap.args should be a table.")
    for _,arg in pairs(cobj.args) do
      assert(type(arg) == "string",
        ":setBind() arg3 error: bMap.args element should be a string.")
    end
    if cobj.name then
      assert(type(cobj.name) == "string",
        "setBind() arg3 error: bMap element.name should be nil or string.")
    end
  end

  self._data[bName] = {
    callback = bCallback,
    map = bMap
  }

end

function dong2.getBind(self,bName)

  assert(self._data[bName] ~= nil,"Binding `"..bName.."` does not exist.")

  local tempData = {}
  for _,mapval in pairs(self._data[bName].map[self._type].args) do
    local mapping = self._map.maps[mapval]

    assert(mapping,self._type..":"..love._os.." does not have the mapping `"..mapval.."`. Try mapping `"..bName.."` for `"..self._type.."` to something else?")

    if mapping.type == "button" then
      table.insert(tempData,self._joystick:isDown(mapping.value))
    elseif mapping.type == "keyb" then
      table.insert(tempData,love.keyboard.isDown(mapping.value))
    elseif mapping.type == "keyinstantcheck" then -- wtf OUYA
      table.insert(tempData,self:_key_instant_check(mapping.value))
    elseif mapping.type == "axis" then
      local axis_value = self._joystick:getAxis(mapping.value)
      --TODO: format axis value according to the min, max and default
      --TODO: add deadzone handlers
      table.insert(tempData,axis_value)
    end

  end

  return unpack({ self._data[bName].callback(self,tempData) })
  
end

function dong2:getBindName(bName)
  assert(self._data[bName] ~= nil,"Binding `"..bName.."` does not exist.")

  local spec_data = self._data[bName].map[self._type]

  assert(spec_data,"`"..bName.."` is not configured for `"..self._type.."`.") 
 
  if spec_data.name then
    return spec_data.name
  else
    return table.concat(self._data[bName].map[self._type].args,"+")
  end
end

return dong2
