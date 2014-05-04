local controller = {}

controller.maps = {
  A = {type="button",value=1},
  B = {type="button",value=2},
  X = {type="button",value=3},
  Y = {type="button",value=4},
  LB = {type="button",value=5},
  RB = {type="button",value=6},
  select = {type="button",value=7},
  start = {type="button",value=8},
  RS = {type="button",value=10},
  LS = {type="button",value=9},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  LT= {type="axis",min=-1,default=-1,max=1,value=3},
  RSX= {type="axis",min=-1,default=0,max=1,value=4},
  RSY= {type="axis",min=-1,default=0,max=1,value=5},
  RT= {type="axis",min=-1,default=-1,max=1,value=3}, -- Yes, the triggers are combined. Use msft's xinput drivers.
}

return controller
