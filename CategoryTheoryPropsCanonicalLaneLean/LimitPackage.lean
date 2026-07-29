import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure LimitPackage (A : AdmissibleClass) where
  limitExists : Prop
  colimitExists : Prop
  universalProperty : Prop
  limitUnique : Prop

structure LimitEvidence (A : AdmissibleClass) (L : LimitPackage A) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  universalPropertyClosed : L.universalProperty
  limitUniqueClosed : L.limitUnique

def LimitClosed (A : AdmissibleClass) (L : LimitPackage A) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.universalProperty ∧ L.limitUnique

theorem limit_closed_from_evidence (A : AdmissibleClass) (L : LimitPackage A) (E : LimitEvidence A L) :
    LimitClosed A L := by
  exact And.intro E.limitExistsClosed (And.intro E.colimitExistsClosed (And.intro E.universalPropertyClosed E.limitUniqueClosed))

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse