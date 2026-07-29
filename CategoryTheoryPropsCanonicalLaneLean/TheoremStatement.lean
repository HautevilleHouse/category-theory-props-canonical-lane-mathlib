import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure CategoryTheoryAdmittedObject where
  category : Type u
  morphisms : Type v
  yonedaFullFaithful : Prop
  limitExistence : Prop
  colimitExistence : Prop
  conclusion : Prop

structure CategoryTheoryState where
  object : CategoryTheoryAdmittedObject

def CategoryTheoryWitnessClosed (O : CategoryTheoryAdmittedObject) : Prop :=
  O.yonedaFullFaithful ∧ O.limitExistence ∧ O.colimitExistence

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse