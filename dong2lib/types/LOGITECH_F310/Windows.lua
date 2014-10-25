local controller = {}

controller.maps = {
  A = {type="button",value=2},
  B = {type="button",value=3},
  X = {type="button",value=1},
  Y = {type="button",value=4},
  LB = {type="button",value=5},
  RB = {type="button",value=6},
  select = {type="button",value=9},
  start = {type="button",value=10},
  menu = {type="button",value=9},
  RS = {type="button",value=12},
  LS = {type="button",value=11},
  DL = {type="hat",value=1},
  DR = {type="hat",value=1},
  DU = {type="hat",value=1},
  DD = {type="hat",value=1},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  LT= {type="button",value=7},
  RSX= {type="axis",min=-1,default=0,max=1,value=3},
  RSY= {type="axis",min=-1,default=0,max=1,value=4},
  RT= {type="button",value=8},
}

return controller
