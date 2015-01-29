local controller = {}

controller.maps = {
  A      = {type="button",value=2},
  B      = {type="button",value=3},
  X      = {type="button",value=1},
  Y      = {type="button",value=4},
  LB      = {type="button",value=7},
  RB      = {type="button",value=8},
  select = {type="button",value=5},
  start  = {type="button",value=6},
  DX      = {type="axis",min=-1,default=0,max=1,value=1},
  DY      = {type="axis",min=-1,default=0,max=1,value=2},
}

return controller
