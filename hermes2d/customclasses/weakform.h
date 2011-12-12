#ifndef __CC_WEAKFORM_H
#define __CC_WEAKFORM_H

#include "Python.h"
#include "exceptions.h"
#include "weakform/weakform.h"
#include "../hermes2d.h"

namespace Hermes
{
  namespace Hermes2D
  {
    class RefMap;
    template<typename Scalar> class DiscreteProblem;
    template<typename Scalar> class RungeKutta;
    template<typename Scalar> class Space;
    template<typename Scalar> class MeshFunction;
    struct SurfPos;

    class Element;
    class Shapeset;
    template<typename T> class Func;
    template<typename T> class Geom;
    template<typename T> class ExtData;

    template<typename Scalar> class Stage;
    template<typename Scalar> class Form;
    template<typename Scalar> class MatrixFormVol;
    template<typename Scalar> class VectorFormVol;
    template<typename Scalar> class MatrixFormSurf;
    template<typename Scalar> class VectorFormSurf;
    template<typename Scalar> class MultiComponentMatrixFormVol;
    template<typename Scalar> class MultiComponentVectorFormVol;
    template<typename Scalar> class MultiComponentMatrixFormSurf;
    template<typename Scalar> class MultiComponentVectorFormSurf;

    template<typename Scalar>
    class CustomMatrixFormVol : public MatrixFormVol<Scalar>
    {
    public:
      /// One area constructor.
      CustomMatrixFormVol(PyObject*self, unsigned int i, unsigned int j,
        std::string area = HERMES_ANY, SymFlag sym = HERMES_NONSYM,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      /// Multiple areas constructor..
      CustomMatrixFormVol(PyObject*self, unsigned int i, unsigned int j,
        Hermes::vector<std::string> areas, SymFlag sym = HERMES_NONSYM,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      virtual Scalar value(int n, double *wt, Func<Scalar> *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<Scalar> *ext) const;

      virtual Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const;
    private:
      PyObject * self;
    };

    template<typename Scalar>
    class CustomMatrixFormSurf : public MatrixFormSurf<Scalar>
    {
    public:
      /// One area constructor.
      CustomMatrixFormSurf(PyObject*self, unsigned int i, unsigned int j, std::string area = HERMES_ANY,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      /// Multiple areas constructor..
      CustomMatrixFormSurf(PyObject*self, unsigned int i, unsigned int j, Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      virtual Scalar value(int n, double *wt, Func<Scalar> *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<Scalar> *ext) const;

      virtual Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const;
    private:
      PyObject * self;
    };

    template<typename Scalar>
    class CustomVectorFormVol : public VectorFormVol<Scalar>
    {
    public:
      /// One area constructor.
      CustomVectorFormVol(PyObject*self, unsigned int i, std::string area = HERMES_ANY,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      /// Multiple areas constructor..
      CustomVectorFormVol(PyObject*self, unsigned int i, Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);


      virtual Scalar value(int n, double *wt, Func<Scalar> *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<Scalar> *ext) const;

      virtual Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v, Geom<Hermes::Ord> *e,
        ExtData<Hermes::Ord> *ext) const;
    private:
      PyObject * self;
    };

    template<typename Scalar>
    class CustomVectorFormSurf : public VectorFormSurf<Scalar>
    {
    public:
      /// One area constructor.
      CustomVectorFormSurf(PyObject*self, unsigned int i, std::string area = HERMES_ANY,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      /// Multiple areas constructor..
      CustomVectorFormSurf(PyObject*self, unsigned int i, Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      virtual Scalar value(int n, double *wt, Func<Scalar> *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<Scalar> *ext) const;

      virtual Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const;
    private:
      PyObject * self;
    };

    /// Multi-component forms.
    /// The principle of functioning of multicomponent forms is as follows.
    /// The form is registered on coordinates in the vector 'coordinates', e.g. {[0, 0], [0, 1], [2, 1]}.
    /// The method 'value' then accepts the parameter 'result', which is a vector with resulting values for
    /// the form on one coordinate. The vectors coordinates and result must have 1-1 relationship, i.e. if the
    /// form is to be registered on three different coordinates, the method value must insert 3 values for these
    /// three coordinates in the same order.
    template<typename Scalar>
    class CustomMultiComponentMatrixFormVol : public MultiComponentMatrixFormVol<Scalar>
    {
    public:
      /// One area constructor.
      CustomMultiComponentMatrixFormVol(PyObject*self, Hermes::vector<std::pair<unsigned int, unsigned int> >coordinates,
        std::string area = HERMES_ANY, SymFlag sym = HERMES_NONSYM,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      /// Multiple areas constructor..
      CustomMultiComponentMatrixFormVol(PyObject*self, Hermes::vector<std::pair<unsigned int, unsigned int> >coordinates,
        Hermes::vector<std::string> areas, SymFlag sym = HERMES_NONSYM,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      virtual void value(int n, double *wt, Func<Scalar> *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<Scalar> *ext, Hermes::vector<Scalar>& result) const;

      virtual Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const;
    private:
      PyObject * self;
    };

    template<typename Scalar>
    class CustomMultiComponentMatrixFormSurf : public MultiComponentMatrixFormSurf<Scalar>
    {
    public:
      /// One area constructor.
      CustomMultiComponentMatrixFormSurf(PyObject*self, Hermes::vector<std::pair<unsigned int, unsigned int> >coordinates,
        std::string area = HERMES_ANY,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      /// Multiple areas constructor.
      CustomMultiComponentMatrixFormSurf(PyObject*self, Hermes::vector<std::pair<unsigned int, unsigned int> >coordinates,
        Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      virtual void value(int n, double *wt, Func<Scalar> *u_ext[], Func<double> *u, Func<double> *v,
        Geom<double> *e, ExtData<Scalar> *ext, Hermes::vector<Scalar>& result) const;

      virtual Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const;
    private:
      PyObject * self;
    };

    template<typename Scalar>
    class CustomMultiComponentVectorFormVol : public MultiComponentVectorFormVol<Scalar>
    {
    public:
      /// One area constructor.
      CustomMultiComponentVectorFormVol(PyObject*self, Hermes::vector<unsigned int> coordinates,
        std::string area = HERMES_ANY,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      /// Multiple areas constructor.
      CustomMultiComponentVectorFormVol(PyObject*self, Hermes::vector<unsigned int> coordinates,
        Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      virtual void value(int n, double *wt, Func<Scalar> *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<Scalar> *ext, Hermes::vector<Scalar>& result) const;

      virtual Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v, Geom<Hermes::Ord> *e,
        ExtData<Hermes::Ord> *ext) const;
    private:
      PyObject * self;
    };

    template<typename Scalar>
    class CustomMultiComponentVectorFormSurf : public MultiComponentVectorFormSurf<Scalar>
    {
    public:
      /// One area constructor.
      CustomMultiComponentVectorFormSurf(PyObject*self, Hermes::vector<unsigned int> coordinates,
        std::string area = HERMES_ANY,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      /// Multiple areas constructor.
      CustomMultiComponentVectorFormSurf(PyObject*self, Hermes::vector<unsigned int> coordinates,
        Hermes::vector<std::string> areas,
        Hermes::vector<MeshFunction<Scalar>*> ext = Hermes::vector<MeshFunction<Scalar>*>(),
        double scaling_factor = 1.0, int u_ext_offset = 0);

      virtual void value(int n, double *wt, Func<Scalar> *u_ext[], Func<double> *v,
        Geom<double> *e, ExtData<Scalar> *ext, Hermes::vector<Scalar>& result) const;

      virtual Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *v,
        Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext) const;
    private:
      PyObject * self;
    };
  }
}
#endif
