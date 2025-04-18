\l maths.q

r:.j.k raze read0`:gis.json
t:update first each avg each'coordinates from r[`features;`geometry]where 0=type each coordinates
c:(enlist reverse@)each t`coordinates

// distance between coordinates is the angle in radians mulitplied by radius
// angle is given by the haversine formula
d:RE*havf .''c,/:\:c

/furthest apart
c where count each where each d=2 max/d

/ closest
c where count each where each d=2 min/d except'0

/ most remote
c i,@[;1]iasc d i:first idesc min each d except'0

/ avg/med
(avg;med)@\:min each d except'0
