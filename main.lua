dong2lib = require("dong2lib")

love.graphics.setFont(love.graphics.newFont(8))

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
      PS3={args={"CROSS"}},
    })

  dong:setBind("cancel",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"B"}},
      OUYA={args={"A"}},
      PS3={args={"CIRCLE"}},
    })

  dong:setBind("info",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"Y"}},
      OUYA={args={"Y"}},
      PS3={args={"TRIANGLE"}},
    })

  dong:setBind("reload",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"X"}},
      OUYA={args={"U"}},
      PS3={args={"SQUARE"}},
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
      PS3={args={"start"}},
    })

  dong:setBind("menu",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"select"}},
      OUYA={args={"menu"}},
      PS3={args={"select"}},
    })

  -- TRIGGERS

  dong:setBind("zoom",
    function(self,data)
      if type(data[1]) == "number" then
        return unpack(data)
      else
        return data[1] and 1 or -1
      end 
    end,
    {
      XBOX_360={args={"LT"}},
      OUYA={args={"LT"}},
      PS3={args={"LT"}},
    })

  dong:setBind("shoot",
    function(self,data)

      if type(data[1]) == "number" then
        if data[1] > 0.1 and data[2] > 0.1 then
          return 1
        else
          return 0
        end
      else
        return data[1] and 1 or 0
      end 
    end,
    {
      XBOX_360={args={"RT","LT"}},
      OUYA={args={"RT","LT"}},
      PS3={args={"RT","LT"}},
    })

  -- STICKS
  
  dong:setBind("move",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"LSX","LSY"},name="LS"},
      OUYA={args={"LSX","LSY"},name="LS"},
      PS3={args={"LSX","LSY"},name="LS"},
    })

  dong:setBind("aim",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"RSX","RSY"},name="RS"},
      OUYA={args={"RSX","RSY"},name="RS"},
      PS3={args={"RSX","RSY"},name="RS"},
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
      OUYA={args={"DR","DL","DU","DD"},name="dpad"},
      PS3={args={"DR","DL","DU","DD"},name="dpad"},
    })

end

function love.update(dt)
  for _,dong in pairs(dongs) do
    dong:update(dt)
  end
end

function love.keypressed(key)
   for _,dong in pairs(dongs) do
    dong:keypressed(key)
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
  local label_width = (love.graphics.getWidth()-padding*4)/8
  local value_width = label_width
  local column_width = label_width + value_width

  for i,dong in pairs(dongs) do

    local lx = (i-1)*column_width
    local vx = lx+label_width

    love.graphics.print(dong._joystick:getName(),padding/2+vx,padding)

    print_button(dong,"confirm",lx,vx,2)
    print_button(dong,"cancel",lx,vx,3)
    print_button(dong,"info",lx,vx,4)
    print_button(dong,"reload",lx,vx,5)

    print_button(dong,"pause",lx,vx,6)
    print_button(dong,"menu",lx,vx,7)

    print_axis(dong,"zoom",lx,vx,8)
    print_axis(dong,"shoot",lx,vx,9)

    print_axes(dong,"move",lx,vx,10)
    print_axes(dong,"aim",lx,vx,11)
    print_axes(dong,"map",lx,vx,12)

  end

end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end