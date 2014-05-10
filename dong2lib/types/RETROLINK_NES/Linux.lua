local controller = {}

controller.maps = {
  X      = {type="axis",min=-1,default=0,max=1,value=1},
  Y      = {type="axis",min=-1,default=0,max=1,value=2},
  A      = {type="button",value=2},
  B      = {type="button",value=3},
  select = {type="button",value=9},
  start  = {type="button",value=10},
}

return controller
