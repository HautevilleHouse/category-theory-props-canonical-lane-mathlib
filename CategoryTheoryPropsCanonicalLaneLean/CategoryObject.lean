import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure CategoryObject where
  carrier : Type u
  identityMorphism : carrier → carrier
  composition : (carrier → carrier → carrier) → (carrier → carrier → carrier)
  leftIdentity : ∀ (a : carrier), composition (identityMorphism a) = (fun x => x)
  rightIdentity : ∀ (a : carrier), composition (fun _ => identityMorphism a) = (fun x => x)
  associativity : ∀ (f g h : carrier → carrier → carrier), composition (composition f g) h = composition f (composition g h)

structure CategoryAdmittedObject where
  category : CategoryObject
  property : Prop
  conclusion : property

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.property

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
