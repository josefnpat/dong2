local controller = {}

controller.maps = {
  O = {type="button",value=1},
  U = {type="button",value=2},
  Y = {type="button",value=3},
  A = {type="button",value=4},
  LB = {type="button",value=5},
  RB = {type="button",value=6},
  menu = {type="button",value=15},
  LS = {type="button",value=7},
  RS = {type="button",value=8},
  DL = {type="button",value=11},
  DR = {type="button",value=12},
  DU = {type="button",value=9},
  DD = {type="button",value=10},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  LT= {type="axis",min=-1,default=-1,max=1,value=3},
  RSX= {type="axis",min=-1,default=0,max=1,value=4},
  RSY= {type="axis",min=-1,default=0,max=1,value=5},
  RT= {type="axis",min=-1,default=-1,max=1,value=6},
}

return controller
