local controller = {}

-- Using drivers that are hard as hell to find:
-- http://goo.gl/MbEO0H

controller.maps = {
  A = {type="button",value=11},
  B = {type="button",value=12},
  X = {type="button",value=13},
  Y = {type="button",value=14},
  LB = {type="button",value=9},
  RB = {type="button",value=10},
  select = {type="button",value=6},
  start = {type="button",value=5},
  menu = {type="button",value=15},
  RS = {type="button",value=8},
  LS = {type="button",value=7},
  DL = {type="button",value=3},
  DR = {type="button",value=4},
  DU = {type="button",value=1},
  DD = {type="button",value=2},
  LSX= {type="axis",min=-1,default=0,max=1,value=1},
  LSY= {type="axis",min=-1,default=0,max=1,value=2},
  LT= {type="axis",min=-1,default=-1,max=1,value=5},
  RSX= {type="axis",min=-1,default=0,max=1,value=3},
  RSY= {type="axis",min=-1,default=0,max=1,value=4},
  RT= {type="axis",min=-1,default=-1,max=1,value=6},
}

return controller
