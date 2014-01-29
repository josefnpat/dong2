dong2lib = require("dong2lib")

function love.joystickadded(joystick)
  local dong = dong2lib.new(joystick)
  if dong then 
    setBindings(dong)
    table.insert(dongs,dong)
  end
end

function love.load()
  dongs = {}
end

function setBindings(dong)

  -- FACE BUTTONS

  dong:setBind("confirm",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"A"}},
      OUYA={args={"O"}},
    })

  dong:setBind("cancel",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"B"}},
      OUYA={args={"A"}},
    })

  dong:setBind("info",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"Y"}},
      OUYA={args={"Y"}},
    })

  dong:setBind("reload",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"X"}},
      OUYA={args={"U"}},
    })

  -- SPECIAL XBOX BUTTONS 

  dong:setBind("pause",
    function(self,data)
      if self._type == "OUYA" then
        return data[1] and data[2]
      else
        return unpack(data)
      end
    end,
    {
      XBOX_360={args={"start"}},
      OUYA={args={"Y","RB"}},
    })

  dong:setBind("score",
    function(self,data)
      if self._type == "OUYA" then
        return data[1] and data[2]
      else
        return unpack(data)
      end
    end,
    {
      XBOX_360={args={"select"}},
      OUYA={args={"Y","LB"}}
    })

  -- TRIGGERS

  dong:setBind("zoom",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"LT"}},
      OUYA={args={"LT"}},
    })

  dong:setBind("shoot",
    function(self,data)
      if data[1] > 0.1 and data[2] > 0.1 then
        return 1
      else
        return 0
      end
    end,
    {
      XBOX_360={args={"RT","LT"}},
      OUYA={args={"RT","LT"}},
    })

  -- STICKS
  
  dong:setBind("move",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"LSX","LSY"},name="LS"},
      OUYA={args={"LSX","LSY"},name="LS"},
    })

  dong:setBind("aim",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"RSX","RSY"},name="RS"},
      OUYA={args={"RSX","RSY"},name="RS"},
    })

  -- DPAD

  dong:setBind("map",
    function(self,data)
      local x,y = 0,0
      if data[1] == true then x = x + 1 end
      if data[2] == true then x = x - 1 end
      if data[3] == true then y = y - 1 end
      if data[4] == true then y = y + 1 end
      return x,y
    end,
    {
      XBOX_360={args={"DR","DL","DU","DD"},name="dpad"},
      OUYA={args={"DR","DL","DU","DD"},name="dpad"}
    })

end

function love.update(dt)
  for _,dong in pairs(dongs) do
    dong:update(dt)
  end
end

function print_axes(dong,name,lx,vx,l)
  love.graphics.print(name..": "..dong:getBindName(name),lx+padding,line_height*l+padding)
  local dirx,diry = dong:getBind(name)
  love.graphics.print("X:"..round(dirx,2).." Y:"..round(diry,2),vx+padding,line_height*l+padding)
end

function print_axis(dong,name,lx,vx,l)
  love.graphics.print(name..": "..dong:getBindName(name),lx+padding,line_height*l+padding)
  local dir = dong:getBind(name)
  love.graphics.print(round(dir,2),vx+padding,line_height*l+padding)
end

function print_button(dong,name,lx,vx,l)
  love.graphics.print(name..": "..dong:getBindName(name),lx+padding,line_height*l+padding)
  if dong:getBind(name) then
    love.graphics.print("true",vx+padding,line_height*l+padding)
  end
end

function love.draw()

  if #dongs == 0 then
    love.graphics.print("No dongs!",64,64)
  end

  line_height = 16
  padding = 128
  local label_width = (love.graphics.getWidth()-padding*2)/8
  local value_width = label_width
  local column_width = label_width + value_width

  for i,dong in pairs(dongs) do

    local lx = (i-1)*column_width
    local vx = lx+label_width

    print_button(dong,"confirm",lx,vx,0)
    print_button(dong,"cancel",lx,vx,1)
    print_button(dong,"info",lx,vx,2)
    print_button(dong,"reload",lx,vx,3)

    print_button(dong,"pause",lx,vx,4)
    print_button(dong,"score",lx,vx,5)

    print_axis(dong,"zoom",lx,vx,6)
    print_axis(dong,"shoot",lx,vx,7)

    print_axes(dong,"move",lx,vx,8)
    print_axes(dong,"aim",lx,vx,9)
    print_axes(dong,"map",lx,vx,10)

  end

end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end
