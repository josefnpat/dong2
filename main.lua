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
  local keyb_dong = dong2lib.new()
  setBindings(keyb_dong)
  table.insert(dongs,keyb_dong) -- Keyboard and mouse
end

function setBindings(dong)
  -- FACE BUTTONS

  dong:setBind("confirm",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"A"}},
      XBOX_360_WIRED={args={"A"}},
      XBOX_360_XINPUT={args={"A"}},
      OUYA={args={"O"}},
      PS3={args={"CROSS"}},
      KEYBMOUSE={args={"return"}},
      RETROLINK_NES={args={"A"}},
      BUFFALO_BSGP801={args={"A"}},
      SMARTJOY_FSS2_SNES={args={"A"}},
      LOGITECH_F310={args={"A"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"A"}},
    })

  dong:setBind("cancel",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"B"}},
      XBOX_360_WIRED={args={"B"}},
      XBOX_360_XINPUT={args={"B"}},
      OUYA={args={"A"}},
      PS3={args={"CIRCLE"}},
      KEYBMOUSE={args={"backspace"}},
      RETROLINK_NES={args={"B"}},
      BUFFALO_BSGP801={args={"B"}},
      SMARTJOY_FSS2_SNES={args={"B"}},
      LOGITECH_F310={args={"B"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"B"}},
    })

  dong:setBind("info",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"Y"}},
      XBOX_360_WIRED={args={"Y"}},
      XBOX_360_XINPUT={args={"Y"}},
      OUYA={args={"Y"}},
      PS3={args={"TRIANGLE"}},
      KEYBMOUSE={args={"h"},name="H"},
      RETROLINK_NES={args={}},
      BUFFALO_BSGP801={args={"X"}},
      SMARTJOY_FSS2_SNES={args={"X"}},
      LOGITECH_F310={args={"Y"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"Y"}},
    })

  dong:setBind("reload",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"X"}},
      XBOX_360_WIRED={args={"X"}},
      XBOX_360_XINPUT={args={"X"}},
      OUYA={args={"U"}},
      PS3={args={"SQUARE"}},
      KEYBMOUSE={args={"r"},name="R"},
      RETROLINK_NES={args={}},
      BUFFALO_BSGP801={args={"Y"}},
      SMARTJOY_FSS2_SNES={args={"Y"}},
      LOGITECH_F310={args={"X"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"X"}},
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
      XBOX_360_WIRED={args={"start"}},
      XBOX_360_XINPUT={args={"start"}},
      OUYA={args={"Y","RB"}},
      PS3={args={"start"}},
      KEYBMOUSE={args={"p"},name="P"},
      RETROLINK_NES={args={"start"}},
      BUFFALO_BSGP801={args={"start"}},
      SMARTJOY_FSS2_SNES={args={"start"}},
      LOGITECH_F310={args={"start"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"back"}},
    })

  dong:setBind("menu",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"select"}},
      XBOX_360_WIRED={args={"select"}},
      XBOX_360_XINPUT={args={"select"}},
      OUYA={args={"menu"}},
      PS3={args={"select"}},
      KEYBMOUSE={args={"m"},name="M"},
      RETROLINK_NES={args={"select"}},
      BUFFALO_BSGP801={args={"select"}},
      SMARTJOY_FSS2_SNES={args={"select"}},
      LOGITECH_F310={args={"select"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"menu"}},
    })

  -- TRIGGERS

  dong:setBind("zoom",
    function(self,data)
      if type(data[1]) == "boolean" then
        return data[1] and 1 or -1
      elseif type(data[1]) == "number" then
        return unpack(data)
      else
        return data[1] and 1 or -1
      end 
    end,
    {
      XBOX_360={args={"LT"}},
      XBOX_360_WIRED={args={"LT"}},
      XBOX_360_XINPUT={args={"LT"}},
      OUYA={args={"LT"}},
      PS3={args={"LT"}},
      KEYBMOUSE={args={"r"},name="RMB",mouse=true},
      RETROLINK_NES={args={}},
      BUFFALO_BSGP801={args={"L"}},
      SMARTJOY_FSS2_SNES={args={"LB"}},
      LOGITECH_F310={args={"LT"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"LT"}},
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
      XBOX_360_WIRED={args={"RT","LT"}},
      XBOX_360_XINPUT={args={"RT","LT"}},
      OUYA={args={"RT","LT"}},
      PS3={args={"RT","LT"}},
      KEYBMOUSE={args={"l"},name="LMB",mouse=true},
      RETROLINK_NES={args={}},
      BUFFALO_BSGP801={args={"L","R"}},
      SMARTJOY_FSS2_SNES={args={"RB","RB"}},
      LOGITECH_F310={args={"RT","LT"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"RT","LT"}},
    })

  -- STICKS
  
  dong:setBind("move",
    function(self,data)
      if type(data[1]) == "boolean" then -- WASD
        local x,y = 0,0
        if data[1] == true then y = y - 1 end
        if data[2] == true then x = x - 1 end
        if data[3] == true then y = y + 1 end
        if data[4] == true then x = x + 1 end
        return x,y
      else
        return unpack(data)
      end
    end,
    {
      XBOX_360={args={"LSX","LSY"},name="LS"},
      XBOX_360_WIRED={args={"LSX","LSY"},name="LS"},
      XBOX_360_XINPUT={args={"LSX","LSY"},name="LS"},
      OUYA={args={"LSX","LSY"},name="LS"},
      PS3={args={"LSX","LSY"},name="LS"},
      KEYBMOUSE={args={"w","a","s","d"},name="WASD"},
      RETROLINK_NES={args={"X","Y"},name="XY"},
      BUFFALO_BSGP801={args={"DX","DY"},name="XY"},
      SMARTJOY_FSS2_SNES={args={"DX","DY"},name="XY"},
      LOGITECH_F310={args={"LSX","LSY",name="LS"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"LSX","LSY",name="LS"}},
    })

  dong:setBind("aim",
    function(self,data) return unpack(data) end,
    {
      XBOX_360={args={"RSX","RSY"},name="RS"},
      XBOX_360_WIRED={args={"RSX","RSY"},name="RS"},
      XBOX_360_XINPUT={args={"RSX","RSY"},name="RS"},
      OUYA={args={"RSX","RSY"},name="RS"},
      PS3={args={"RSX","RSY"},name="RS"},
      KEYBMOUSE={args={"x","y"},name="Mouse",mouse=true},
      RETROLINK_NES={args={}},
      BUFFALO_BSGP801={args={}},
      SMARTJOY_FSS2_SNES={args={}},
      LOGITECH_F310={args={"RSX","RSY",name="RS"}},
      AMAZON_FIRE_GAME_CONTROLLER={args={"RSX","RSY",name="RS"}},
    })

  -- DPAD

  dong:setBind("map",
    function(self,data)
      local x,y = 0,0
      if self._type == "LOGITECH_F310" or
        self._type == "AMAZON_FIRE_GAME_CONTROLLER" or
        self._type == "XBOX_360_WIRED" then
        if string.sub(data[1],1,1)   == "r" then x = x + 1 end
        if string.sub(data[2],1,1)   == "l" then x = x - 1 end
        if string.sub(data[3],-1,-1) == "u" then y = y - 1 end
        if string.sub(data[4],-1,-1) == "d" then y = y + 1 end
      else
        if data[1] == true then x = x + 1 end
        if data[2] == true then x = x - 1 end
        if data[3] == true then y = y - 1 end
        if data[4] == true then y = y + 1 end
      end
      return x,y
    end,
    {
      XBOX_360={args={"DR","DL","DU","DD"},name="dpad"},
      XBOX_360_WIRED={args={"DR","DL","DU","DD"},name="dpad"},
      XBOX_360_XINPUT={args={"DR","DL","DU","DD"},name="dpad"},
      OUYA={args={"DR","DL","DU","DD"},name="dpad"},
      PS3={args={"DR","DL","DU","DD"},name="dpad"},
      KEYBMOUSE={args={"up","down","left","right"},name="Arrow Keys"},
      RETROLINK_NES={args={}},
      BUFFALO_BSGP801={args={}},
      SMARTJOY_FSS2_SNES={args={}},
      LOGITECH_F310={args={"DR","DL","DU","DD"},name="dpad"},
      AMAZON_FIRE_GAME_CONTROLLER={args={"DR","DL","DU","DD",name="LS"}},
    })

end

function love.update(dt)
  for _,dong in pairs(dongs) do
    dong:update(dt)
  end
end

function love.keypressed(key) -- OUYA MENU
   for _,dong in pairs(dongs) do
    dong:keypressed(key)
  end
end

function print_axes(dong,name,lx,vx,l)
  love.graphics.print(name..": "..dong:getBindName(name),lx+padding,line_height*l+padding)
  local dirx,diry = dong:getBind(name)
  dirx = dirx or 0
  diry = diry or 0
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

    love.graphics.print(dong:getName(),padding/2+vx,padding)

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
