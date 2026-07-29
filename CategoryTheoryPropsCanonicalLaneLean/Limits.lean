import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.CategoryObject

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure LimitsPackage (C : CategoryObject) where
  limitExists : Prop
  colimitExists : Prop
  universalProperty : Prop
  limitExistsTerm : limitExists
  colimitExistsTerm : colimitExists
  universalPropertyTerm : universalProperty

structure LimitsEvidence {C : CategoryObject} (L : LimitsPackage C) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  universalPropertyClosed : L.universalProperty

def LimitsClosed {C : CategoryObject} (L : LimitsPackage C) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.universalProperty

theorem limits_closed_from_evidence
    {C : CategoryObject} (L : LimitsPackage C)
    (E : LimitsEvidence L) : LimitsClosed L := by
  exact And.intro E.limitExistsClosed
    (And.intro E.colimitExistsClosed E.universalPropertyClosed)

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
