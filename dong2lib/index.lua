local index = {
  XBOX_360 = "Xbox 360 Wireless Receiver",
  OUYA = "OUYA Game Controller",
  PS3 = love._os == "Android" and
    "PLAYSTATION(R)3 Controller" or -- OUYA
    "Sony PLAYSTATION(R)3 Controller" -- EVERYONE ELSE
}

return index
