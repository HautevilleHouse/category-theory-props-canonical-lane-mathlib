import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.CategoryObject

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure AdjunctionPackage (C D : CategoryObject) where
  leftAdjoint : Type u
  rightAdjoint : Type v
  adjunctionIso : Prop
  unitCounit : Prop
  adjunctionIsoTerm : adjunctionIso
  unitCounitTerm : unitCounit

structure AdjunctionEvidence {C D : CategoryObject} (A : AdjunctionPackage C D) where
  adjunctionIsoClosed : A.adjunctionIso
  unitCounitClosed : A.unitCounit

def AdjunctionClosed {C D : CategoryObject} (A : AdjunctionPackage C D) : Prop :=
  A.adjunctionIso ∧ A.unitCounit

theorem adjunction_closed_from_evidence
    {C D : CategoryObject} (A : AdjunctionPackage C D)
    (E : AdjunctionEvidence A) : AdjunctionClosed A := by
  exact And.intro E.adjunctionIsoClosed E.unitCounitClosed

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
