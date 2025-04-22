$ uenv image find vasp@daint
uenv            arch   id                size(MB)
vasp/v6.4.3:v1  gh200  86edce79074e3478  7,963
vasp/v6.4.3:v2  gh200  d4753368f8b2baca  7,954
vasp/v6.5.0:v1  gh200  b7b097cb03d36451  5,709
$ uenv image pull vasp/v6.4.3:v2@daint
pulling d4753368f8b2baca 100.00% ------ 7954/7954
updating vasp/v6.4.3:v2@daint%gh200
$ uenv image ls vasp@daint
uenv            arch   id                size(MB)
vasp/v6.4.3:v2  gh200  d4753368f8b2baca  7,954
vasp/v6.5.0:v1  gh200  b7b097cb03d36451  5,709
