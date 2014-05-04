local controller = {}

-- Using Motioninjoy 0.7.0, use Xinput-Default

controller.maps = {
  CROSS = {type="button",value=11},
  SQUARE = {type="button",value=13},
  TRIANGLE = {type="button",value=14},
  CIRCLE = {type="button",value=12},
  LB = {type="button",value=9},
  RB = {type="button",value=10},
  menu = {type="button",value=15},
  select = {type="button",value=6},
  start = {type="button",value=5},
  LS = {type="button",value=7},
  RS = {type="button",value=8},
  DL = {type="button",value=3},
  DR = {type="button",value=4},
  DU = {type="button",value=1},
  DD = {type="button",value=2},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  LT= {type="button",value=7},
  RSX= {type="axis",min=-1,default=0,max=1,value=3},
  RSY= {type="axis",min=-1,default=0,max=1,value=4},
  RT= {type="button",value=8},
}

return controller
