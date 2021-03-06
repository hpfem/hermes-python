%module common

%{
#include "common.h"

#include <complex>

#include <stdexcept>
#include <cstdarg>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <assert.h>
#include <math.h>
#include <time.h>
#include <float.h>
#include <errno.h>
#include <cmath>

#include <pthread.h>
#include <cstdlib>
#include <ctime>
#include <cstring>
#include <map>
#include <cstdio>
#include <stdarg.h>
#include <sstream>

#include <algorithm>
#include <vector>
#include <map>
#include <set>
#include <queue>
#include <sstream>
#include <fstream>
#include <cstring>
#include <iostream>
#include <omp.h>
#include <signal.h>

#include "config.h"
%}


%include "common.h"
%import config.i

%rename (val) *::operator[] (int idx);

 
