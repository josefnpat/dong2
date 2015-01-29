local controller = {}

controller.maps = {
  O = {type="button",value=1},
  U = {type="button",value=3},
  Y = {type="button",value=4},
  A = {type="button",value=2},
  LB = {type="button",value=10},
  RB = {type="button",value=11},
  menu = {type="keyinstantcheck",value="menu"},
  LS = {type="button",value=8},
  RS = {type="button",value=9},
  DL = {type="button",value=14},
  DR = {type="button",value=15},
  DU = {type="button",value=12},
  DD = {type="button",value=13},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  RSX= {type="axis",min=-1,default=0,max=1,value=3},
  RSY= {type="axis",min=-1,default=0,max=1,value=4},
  LT= {type="axis",min=-1,default=-1,max=1,value=5},
  RT= {type="axis",min=-1,default=-1,max=1,value=6},
}

return controller
