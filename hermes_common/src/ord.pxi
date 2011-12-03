cdef class PyOrd:
  def __cinit__(self,o=None,init=True):
    if not init:
      return
    if (type(self)!=PyOrd):
      return
    if o:
      if isinstance(o,int):
        self.thisptr=new Ord(<int> o)
      else:
        self.thisptr=new Ord(<double> o)
    else:
      self.thisptr=new Ord()


  def get_order(self):
    return self.thisptr.get_order()
  def get_max_order(self):
    return PyOrd(self.thisptr.get_max_order().get_order())

  def __add__(self,b):
    if isinstance(self,PyOrd): 
      if isinstance(b,PyOrd):  
        return PyOrd(((<PyOrd> self).thisptr[0]+(<PyOrd> b).thisptr[0]).get_order())
      elif isinstance(b,float):  
        return PyOrd(((<PyOrd> self).thisptr[0]+<double> b).get_order())
      elif isinstance(b,complex):  
        return PyOrd(((<PyOrd> self).thisptr[0]+cComplex[double](b.real,b.imag)).get_order())
    
    else:
      if isinstance(self,float):  
        return PyOrd(((<double> self)+(<PyOrd> b).thisptr[0]).get_order())
      elif isinstance(self,complex):  
        return PyOrd((cComplex[double](self.real,self.imag)+(<PyOrd> b).thisptr[0]).get_order())


  def __sub__(self,b):
    if isinstance(self,PyOrd): 
      if isinstance(b,PyOrd):  
        return PyOrd(((<PyOrd> self).thisptr[0]-(<PyOrd> b).thisptr[0]).get_order())
      elif isinstance(b,float):  
        return PyOrd(((<PyOrd> self).thisptr[0]-<double> b).get_order())
      elif isinstance(b,complex):  
        return PyOrd(((<PyOrd> self).thisptr[0]-cComplex[double](b.real,b.imag)).get_order())
    
    else:
      if isinstance(self,float):  
        return PyOrd(((<double> self)-(<PyOrd> b).thisptr[0]).get_order())
      elif isinstance(self,complex):  
        return PyOrd((cComplex[double](self.real,self.imag)-(<PyOrd> b).thisptr[0]).get_order())


  def __mul__(self,b):
    if isinstance(self,PyOrd): 
      if isinstance(b,PyOrd):  
        return PyOrd(((<PyOrd> self).thisptr[0]*(<PyOrd> b).thisptr[0]).get_order())
      elif isinstance(b,float):  
        return PyOrd(((<PyOrd> self).thisptr[0]*<double> b).get_order())
      elif isinstance(b,complex):  
        return PyOrd(((<PyOrd> self).thisptr[0]*cComplex[double](b.real,b.imag)).get_order())
    
    else:
      if isinstance(self,float):  
        return PyOrd(((<double> self)*(<PyOrd> b).thisptr[0]).get_order())
      elif isinstance(self,complex):  
        return PyOrd((cComplex[double](self.real,self.imag)*(<PyOrd> b).thisptr[0]).get_order())

  def __div__(self,b):
    if isinstance(self,PyOrd): 
      if isinstance(b,PyOrd):  
        return PyOrd(((<PyOrd> self).thisptr[0]/(<PyOrd> b).thisptr[0]).get_order())
      elif isinstance(b,float):  
        return PyOrd(((<PyOrd> self).thisptr[0]/<double> b).get_order())
      elif isinstance(b,complex):  
        return PyOrd(((<PyOrd> self).thisptr[0]/cComplex[double](b.real,b.imag)).get_order())
    
    else:
      if isinstance(self,float):  
        return PyOrd(((<double> self)/(<PyOrd> b).thisptr[0]).get_order())
      elif isinstance(self,complex):  
        return PyOrd((cComplex[double](self.real,self.imag)/(<PyOrd> b).thisptr[0]).get_order())

  def __richcmp__(self,b,int operation):
    if (operation==0): # <
      if isinstance(self,PyOrd): 
        if isinstance(b,PyOrd):  
          return ((<PyOrd> self).thisptr[0]<(<PyOrd> b).thisptr[0])
        elif isinstance(b,float):  
          return ((<PyOrd> self).thisptr[0]< <double> b)
        elif isinstance(b,complex):  
          return ((<PyOrd> self).thisptr[0]<cComplex[double](b.real,b.imag))

    if (operation==4): # >
      if isinstance(self,PyOrd): 
        if isinstance(b,PyOrd):  
          return ((<PyOrd> self).thisptr[0]>(<PyOrd> b).thisptr[0])
        elif isinstance(b,float):  
          return ((<PyOrd> self).thisptr[0]> <double> b)
        elif isinstance(b,complex):  
          return ((<PyOrd> self).thisptr[0]>cComplex[double](b.real,b.imag))

    raise NotImplemented
      

