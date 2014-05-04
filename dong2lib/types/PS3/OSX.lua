local controller = {}

controller.maps = {
  CROSS = {type="button",value=15},
  SQUARE = {type="button",value=16},
  TRIANGLE = {type="button",value=13},
  CIRCLE = {type="button",value=14},
  LB = {type="button",value=11},
  RB = {type="button",value=12},
  menu = {type="button",value=17},
  select = {type="button",value=1},
  start = {type="button",value=4},
  LS = {type="button",value=2},
  RS = {type="button",value=3},
  DL = {type="button",value=8},
  DR = {type="button",value=6},
  DU = {type="button",value=5},
  DD = {type="button",value=7},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  LT= {type="button",value=9}, -- Not an axis
  RSX= {type="axis",min=-1,default=0,max=1,value=3},
  RSY= {type="axis",min=-1,default=0,max=1,value=4},
  RT= {type="button",value=10}, -- Not an axis
}

return controller
