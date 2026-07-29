import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.CategoryTheoryProps

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure YonedaData (C : Category) where
  X : C.Obj
  F : Functor C (Type u)
  naturalTransformations : Type (max u v) -- actually the set of natural transformations from Hom(X,-) to F
  bijection : Prop -- the Yoneda bijection

def YonedaEvidence (C : Category) (Y : YonedaData C) : Prop :=
  Y.bijection

def YonedaClosure (C : Category) (Y : YonedaData C) : Prop :=
  Y.bijection

theorem yoneda_lemma_closed (C : Category) (Y : YonedaData C) (h : YonedaEvidence C Y) : YonedaClosure C Y := h

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse