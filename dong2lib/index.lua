local index = {
  XBOX_360 = "Xbox 360 Wireless Receiver",
  OUYA = "OUYA Game Controller",
}

if love._os == "Android" then
  index["PS3"] = "PLAYSTATION(R)3 Controller"
else
  index["PS3"] = "Sony PLAYSTATION(R)3 Controller"
end

return index
