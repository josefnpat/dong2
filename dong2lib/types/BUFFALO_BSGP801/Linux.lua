local controller = {}

controller.maps = {
  DX      = {type="axis",min=-1,default=0,max=1,value=1},
  DY      = {type="axis",min=-1,default=0,max=1,value=2},
  A      = {type="button",value=1},
  B      = {type="button",value=2},
  X      = {type="button",value=3},
  Y      = {type="button",value=4},
  L      = {type="button",value=5},
  R      = {type="button",value=6},
  select = {type="button",value=7},
  start  = {type="button",value=8},
}

return controller
