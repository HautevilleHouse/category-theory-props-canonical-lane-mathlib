import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure CategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  identity : (X : objects) → morphisms X X
  composition : {X Y Z : objects} → morphisms X Y → morphisms Y Z → morphisms X Z
  assoc : Prop
  leftUnit : Prop
  rightUnit : Prop
  idLeft : Prop
  idRight : Prop

structure FunctorPackage (C : CategoryPackage) where
  objMap : C.objects → C.objects
  morMap : {X Y : C.objects} → C.morphisms X Y → C.morphisms (objMap X) (objMap Y)
  preservesIdentity : Prop
  preservesComposition : Prop

structure NaturalTransformationPackage (C : CategoryPackage) (F G : FunctorPackage C) where
  components : (X : C.objects) → C.morphisms (F.objMap X) (G.objMap X)
  naturality : Prop

structure YonedaEmbeddingPackage (C : CategoryPackage) where
  yoneda : FunctorPackage C → FunctorPackage (CategoryPackage.opposite C)
  fullyFaithful : Prop

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse