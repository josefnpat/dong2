local controller = {}

controller.maps = {
  CROSS = {type="button",value=1},
  SQUARE = {type="button",value=3},
  TRIANGLE = {type="button",value=4},
  CIRCLE = {type="button",value=2},
  LB = {type="button",value=10},
  RB = {type="button",value=11},
  menu = {type="keyinstantcheck",value="menu"},
  select = {type="keyinstantcheck",value="escape"},
  start = {type="button",value=7},
  LS = {type="button",value=8},
  RS = {type="button",value=9},
  DL = {type="button",value=14},
  DR = {type="button",value=15},
  DU = {type="button",value=12},
  DD = {type="button",value=13},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  LT= {type="axis",min=-1,default=-1,max=1,value=13},
  RSX= {type="axis",min=-1,default=0,max=1,value=3},
  RSY= {type="axis",min=-1,default=0,max=1,value=4},
  RT= {type="axis",min=-1,default=-1,max=1,value=14},
}

return controller
