import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.CategoryTheoryProps

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure AdjointPair (C D : Category) where
  left : Functor C D
  right : Functor D C
  unit : NaturalTransformation (Functor.id C) (comp left right)
  counit : NaturalTransformation (comp right left) (Functor.id D)
  triangleLeft : Prop
  triangleRight : Prop

def AdjointEvidence {C D : Category} (adj : AdjointPair C D) : Prop :=
  adj.triangleLeft ∧ adj.triangleRight

def AdjointClosure {C D : Category} (adj : AdjointPair C D) : Prop :=
  adj.triangleLeft ∧ adj.triangleRight

theorem adjoint_functor_closure {C D : Category} (adj : AdjointPair C D) (h : AdjointEvidence adj) : AdjointClosure adj :=
  h

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse