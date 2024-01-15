
[
    0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,
    1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0
]

* one way to encode this is my a position and a value and then assuming the value continues until the next position
* or we could do a start and end pos
({1,1},{1,3},0),({1,4},{1,15},1).... and so forth for line 1
* Should we make a grid? Most likely, yes. 
* But we can skip the grid for the first iteration. 
* 