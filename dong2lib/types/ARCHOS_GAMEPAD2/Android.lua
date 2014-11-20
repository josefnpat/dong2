local controller = {}

controller.maps = {
  A = {type="button",value=1},
  B = {type="button",value=2},
  X = {type="button",value=3},
  Y = {type="button",value=4},
  LB = {type="button",value=16},
  RB = {type="button",value=17},
  start = {type="button",value=7},
  select = {type="button",value=5},
  DL = {type="button",value=14},
  DR = {type="button",value=15},
  DU = {type="button",value=12},
  DD = {type="button",value=13},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  LT= {type="button",value=10},
  RSX= {type="axis",min=-1,default=0,max=1,value=3},
  RSY= {type="axis",min=-1,default=0,max=1,value=4},
  RT= {type="button",value=11},
}

return controller
