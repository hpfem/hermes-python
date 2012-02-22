#include "weakform.h"

namespace Hermes
{
  namespace Hermes2D
  {
    template<typename Scalar>
    CustomMatrixFormVol<Scalar>::CustomMatrixFormVol(PyObject*self, unsigned int i, unsigned int j,
        std::string area, SymFlag sym,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MatrixFormVol<Scalar>(i, j,area, sym,ext, scaling_factor, u_ext_offset),self(self){}

    template<typename Scalar>
    CustomMatrixFormVol<Scalar>::CustomMatrixFormVol(PyObject*self, unsigned int i, unsigned int j,
        Hermes::vector<std::string> areas, SymFlag sym,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MatrixFormVol<Scalar>(i, j,areas, sym, ext, scaling_factor, u_ext_offset),self(self){}

    template<>
    double CustomMatrixFormVol<double>::value(int n, double *wt, Func<double> *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<double> *ext) const
    {
      return pyMatrixFormReal_value(self, n, wt, u_ext, u, v, e, ext);
    }

    template<>
    std::complex<double> CustomMatrixFormVol<std::complex<double> >::value(int n, double *wt, Func<std::complex<double> > *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<std::complex<double> > *ext) const
    {
      return pyMatrixFormComplex_value(self, n, wt, u_ext, u, v, e, ext);
    }

    template<>
    Hermes::Ord CustomMatrixFormVol<double>::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMatrixFormReal_ord(self, n, wt, u_ext, u, v, e, ext);
    }

    template<>
    Hermes::Ord CustomMatrixFormVol<std::complex<double> >::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMatrixFormComplex_ord(self, n, wt, u_ext, u, v, e, ext);
    }

    template<typename Scalar>
      CustomMatrixFormSurf<Scalar>::CustomMatrixFormSurf(PyObject*self, unsigned int i, unsigned int j, std::string area,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MatrixFormSurf<Scalar>(i, j, area, ext, scaling_factor, u_ext_offset),self(self){}

    template<typename Scalar>
    CustomMatrixFormSurf<Scalar>::CustomMatrixFormSurf(PyObject*self, unsigned int i, unsigned int j, Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MatrixFormSurf<Scalar>(i, j, areas, ext, scaling_factor, u_ext_offset),self(self){};

    template<>
    double CustomMatrixFormSurf<double>::value(int n, double *wt, Func<double> *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<double> *ext) const
    {
      return pyMatrixFormReal_value(self, n, wt, u_ext, u, v, e, ext);
    }

    template<>
    std::complex<double> CustomMatrixFormSurf<std::complex<double> >::value(int n, double *wt, Func<std::complex<double> > *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<std::complex<double> > *ext) const
    {
      return pyMatrixFormComplex_value(self, n, wt, u_ext, u, v, e, ext);
    }

    template<>
    Hermes::Ord CustomMatrixFormSurf<double>::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMatrixFormReal_ord(self, n, wt, u_ext, u, v, e, ext);
    }

    template<>
    Hermes::Ord CustomMatrixFormSurf<std::complex<double> >::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMatrixFormComplex_ord(self, n, wt, u_ext, u, v, e, ext);
    }


    template<typename Scalar>
    CustomVectorFormVol<Scalar>::CustomVectorFormVol(PyObject*self, unsigned int i, std::string area,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):VectorFormVol<Scalar>(i, area, ext, scaling_factor, u_ext_offset),self(self){};

    template<typename Scalar>
    CustomVectorFormVol<Scalar>::CustomVectorFormVol(PyObject*self, unsigned int i, Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):VectorFormVol<Scalar>(i, areas,ext, scaling_factor, u_ext_offset),self(self){};


    template<>
    double CustomVectorFormVol<double>::value(int n, double *wt, Func<double> *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<double> *ext) const
    {
      return pyVectorFormReal_value(self, n, wt, u_ext, v, e, ext);
    }

    template<>
    std::complex<double> CustomVectorFormVol<std::complex<double> >::value(int n, double *wt, Func<std::complex<double> > *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<std::complex<double> > *ext) const
    {
      return pyVectorFormComplex_value(self, n, wt, u_ext, v, e, ext);
    }

    template<>
    Hermes::Ord CustomVectorFormVol<double>::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v, Geom<Hermes::Ord> *e,
        ExtData<Hermes::Ord> *ext) const
    {
      return pyVectorFormReal_ord(self, n, wt, u_ext, v, e, ext);
    }

    template<>
    Hermes::Ord CustomVectorFormVol<std::complex<double> >::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v, Geom<Hermes::Ord> *e,
        ExtData<Hermes::Ord> *ext) const
    {
      return pyVectorFormComplex_ord(self, n, wt, u_ext, v, e, ext);
    }



    template<typename Scalar>
    CustomVectorFormSurf<Scalar>::CustomVectorFormSurf(PyObject*self, unsigned int i, std::string area,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):VectorFormSurf<Scalar>(i, area, ext, scaling_factor, u_ext_offset),self(self){};

    template<typename Scalar>
    CustomVectorFormSurf<Scalar>::CustomVectorFormSurf(PyObject*self, unsigned int i, Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):VectorFormSurf<Scalar>(i, areas, ext, scaling_factor, u_ext_offset),self(self){};

    template<>
    double CustomVectorFormSurf<double>::value(int n, double *wt, Func<double> *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<double> *ext) const
    {
      return pyVectorFormReal_value(self, n, wt, u_ext, v, e, ext);
    }

    template<>
    std::complex<double> CustomVectorFormSurf<std::complex<double> >::value(int n, double *wt, Func<std::complex<double> > *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<std::complex<double> > *ext) const
    {
      return pyVectorFormComplex_value(self, n, wt, u_ext, v, e, ext);
    }

    template<>
    Hermes::Ord CustomVectorFormSurf<double>::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyVectorFormReal_ord(self, n, wt, u_ext, v, e, ext);
    }
    template<>
    Hermes::Ord CustomVectorFormSurf<std::complex<double> >::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyVectorFormComplex_ord(self, n, wt, u_ext, v, e, ext);
    }

    template<typename Scalar>
    CustomMultiComponentMatrixFormVol<Scalar>::CustomMultiComponentMatrixFormVol(PyObject*self, Hermes::vector<std::pair<unsigned int, unsigned int> >coordinates,
        std::string area, SymFlag sym,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MultiComponentMatrixFormVol<Scalar>(coordinates, area, sym, ext, scaling_factor, u_ext_offset),self(self){};

    template<typename Scalar>
    CustomMultiComponentMatrixFormVol<Scalar>::CustomMultiComponentMatrixFormVol(PyObject*self, Hermes::vector<std::pair<unsigned int, unsigned int> >coordinates,
        Hermes::vector<std::string> areas, SymFlag sym,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MultiComponentMatrixFormVol<Scalar>(coordinates, areas, sym, ext, scaling_factor, u_ext_offset),self(self){};

    template<>
    void CustomMultiComponentMatrixFormVol<double>::value(int n, double *wt, Func<double> *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<double> *ext, Hermes::vector<double>& result) const
    {
      pyMultiMatrixFormReal_value(self, n, wt, u_ext, u, v, e, ext, result);
    }

    template<>
    void CustomMultiComponentMatrixFormVol<std::complex<double> >::value(int n, double *wt, Func<std::complex<double> > *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<std::complex<double> > *ext, Hermes::vector<std::complex<double> >& result) const
    {
      pyMultiMatrixFormComplex_value(self, n, wt, u_ext, u, v, e, ext, result);
    }

    template<>
    Hermes::Ord CustomMultiComponentMatrixFormVol<double>::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMultiMatrixFormReal_ord(self, n, wt, u_ext, u, v, e, ext);
    }

    template<>
    Hermes::Ord CustomMultiComponentMatrixFormVol<std::complex<double> >::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMultiMatrixFormComplex_ord(self, n, wt, u_ext, u, v, e, ext);
    }

    template<typename Scalar>
    CustomMultiComponentMatrixFormSurf<Scalar>::CustomMultiComponentMatrixFormSurf(PyObject*self, Hermes::vector<std::pair<unsigned int, unsigned int> >coordinates,
        std::string area,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MultiComponentMatrixFormSurf<Scalar>(coordinates, area, ext, scaling_factor, u_ext_offset),self(self){};

    template<typename Scalar>
    CustomMultiComponentMatrixFormSurf<Scalar>::CustomMultiComponentMatrixFormSurf(PyObject*self, Hermes::vector<std::pair<unsigned int, unsigned int> >coordinates,
        Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MultiComponentMatrixFormSurf<Scalar>(coordinates, areas, ext, scaling_factor, u_ext_offset),self(self){};

    template<>
    void CustomMultiComponentMatrixFormSurf<double>::value(int n, double *wt, Func<double> *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<double> *ext, Hermes::vector<double>& result) const
    {
      pyMultiMatrixFormReal_value(self, n, wt, u_ext, u, v, e, ext, result);
    }

    template<>
    void CustomMultiComponentMatrixFormSurf<std::complex<double> >::value(int n, double *wt, Func<std::complex<double> > *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<std::complex<double> > *ext, Hermes::vector<std::complex<double> >& result) const
    {
      pyMultiMatrixFormComplex_value(self, n, wt, u_ext, u, v, e, ext, result);
    }

    template<>
    Hermes::Ord CustomMultiComponentMatrixFormSurf<double>::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMultiMatrixFormReal_ord(self, n, wt, u_ext, u, v, e, ext);
    }

    template<>
    Hermes::Ord CustomMultiComponentMatrixFormSurf<std::complex<double> >::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMultiMatrixFormComplex_ord(self, n, wt, u_ext, u, v, e, ext);
    }

    template<typename Scalar>
    CustomMultiComponentVectorFormVol<Scalar>::CustomMultiComponentVectorFormVol(PyObject*self, Hermes::vector<unsigned int> coordinates,
        std::string area,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MultiComponentVectorFormVol<Scalar>(coordinates, area, ext, scaling_factor, u_ext_offset),self(self){};

    template<typename Scalar>
    CustomMultiComponentVectorFormVol<Scalar>::CustomMultiComponentVectorFormVol(PyObject*self, Hermes::vector<unsigned int> coordinates,
        Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MultiComponentVectorFormVol<Scalar>( coordinates, areas, ext, scaling_factor, u_ext_offset),self(self){};

    template<>
    void CustomMultiComponentVectorFormVol<double>::value(int n, double *wt, Func<double> *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<double> *ext, Hermes::vector<double>& result) const
    {
      pyMultiVectorFormReal_value(self, n, wt, u_ext, v, e, ext, result);
    }

    template<>
    void CustomMultiComponentVectorFormVol<std::complex<double> >::value(int n, double *wt, Func<std::complex<double> > *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<std::complex<double> > *ext, Hermes::vector<std::complex<double> >& result) const
    {
      pyMultiVectorFormComplex_value(self, n, wt, u_ext, v, e, ext, result);
    }

    template<>
    Hermes::Ord CustomMultiComponentVectorFormVol<double>::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v, Geom<Hermes::Ord> *e,
        ExtData<Hermes::Ord> *ext) const
    {
      return pyMultiVectorFormReal_ord(self, n, wt, u_ext, v, e, ext);
    }

    template<>
    Hermes::Ord CustomMultiComponentVectorFormVol<std::complex<double> >::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v, Geom<Hermes::Ord> *e,
        ExtData<Hermes::Ord> *ext) const
    {
      return pyMultiVectorFormComplex_ord(self, n, wt, u_ext, v, e, ext);
    }


    template<typename Scalar>
    CustomMultiComponentVectorFormSurf<Scalar>::CustomMultiComponentVectorFormSurf(PyObject*self, Hermes::vector<unsigned int> coordinates,
        std::string area,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MultiComponentVectorFormSurf<Scalar>(coordinates, area, ext, scaling_factor, u_ext_offset),self(self){};

    template<typename Scalar>
    CustomMultiComponentVectorFormSurf<Scalar>::CustomMultiComponentVectorFormSurf(PyObject*self, Hermes::vector<unsigned int> coordinates,
        Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext,
        double scaling_factor, int u_ext_offset):MultiComponentVectorFormSurf<Scalar>(coordinates, areas, ext, scaling_factor, u_ext_offset),self(self){};

    template<>
    void CustomMultiComponentVectorFormSurf<double>::value(int n, double *wt, Func<double> *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<double> *ext, Hermes::vector<double>& result) const
    {
      pyMultiVectorFormReal_value(self, n, wt, u_ext, v, e, ext, result);
    }

    template<>
    void CustomMultiComponentVectorFormSurf<std::complex<double> >::value(int n, double *wt, Func<std::complex<double> > *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<std::complex<double> > *ext, Hermes::vector<std::complex<double> >& result) const
    {
      pyMultiVectorFormComplex_value(self, n, wt, u_ext, v, e, ext, result);
    }

    template<>
    Hermes::Ord CustomMultiComponentVectorFormSurf<double>::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMultiVectorFormReal_ord(self, n, wt, u_ext, v, e, ext);
    }

    template<>
    Hermes::Ord CustomMultiComponentVectorFormSurf<std::complex<double> >::ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const
    {
      return pyMultiVectorFormComplex_ord(self, n, wt, u_ext, v, e, ext);
    }

    template class CustomMatrixFormVol<double>;
    template class CustomMatrixFormSurf<double>;
    template class CustomVectorFormVol<double>;
    template class CustomVectorFormSurf<double>;
    template class CustomMultiComponentMatrixFormVol<double>;
    template class CustomMultiComponentMatrixFormSurf<double>;
    template class CustomMultiComponentVectorFormVol<double>;
    template class CustomMultiComponentVectorFormSurf<double>;
    template class CustomMatrixFormVol<std::complex<double> >;
    template class CustomMatrixFormSurf<std::complex<double> >;
    template class CustomVectorFormVol<std::complex<double> >;
    template class CustomVectorFormSurf<std::complex<double> >;
    template class CustomMultiComponentMatrixFormVol<std::complex<double> >;
    template class CustomMultiComponentMatrixFormSurf<std::complex<double> >;
    template class CustomMultiComponentVectorFormVol<std::complex<double> >;
    template class CustomMultiComponentVectorFormSurf<std::complex<double> >;
  }
}

