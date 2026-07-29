import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure AdjunctionPackage where
  leftAdjoint : Type u → Type u
  rightAdjoint : Type u → Type u
  unitNatural : Prop
  counitNatural : Prop
  triangleIdentities : Prop

structure AdjunctionEvidence (A : AdjunctionPackage) where
  unitNaturalClosed : A.unitNatural
  counitNaturalClosed : A.counitNatural
  triangleIdentitiesClosed : A.triangleIdentities

def AdjunctionClosed (A : AdjunctionPackage) : Prop :=
  A.unitNatural ∧ A.counitNatural ∧ A.triangleIdentities

theorem adjunction_closed_from_evidence (A : AdjunctionPackage)
    (E : AdjunctionEvidence A) : AdjunctionClosed A := by
  exact And.intro E.unitNaturalClosed
    (And.intro E.counitNaturalClosed E.triangleIdentitiesClosed)

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse