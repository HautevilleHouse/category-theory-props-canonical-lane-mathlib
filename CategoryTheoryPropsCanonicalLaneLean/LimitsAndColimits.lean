import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure LimitsPackage where
  diagram : Type u
  limitObject : Type v
  limitCone : Prop
  colimitObject : Type w
  colimitCocone : Prop
  limitUniversal : Prop
  colimitUniversal : Prop

structure LimitsEvidence (L : LimitsPackage) where
  limitUniversalClosed : L.limitUniversal
  colimitUniversalClosed : L.colimitUniversal

def LimitsClosed (L : LimitsPackage) : Prop := L.limitUniversal ∧ L.colimitUniversal

theorem limits_closed_from_evidence (L : LimitsPackage) (E : LimitsEvidence L) : LimitsClosed L := by
  exact And.intro E.limitUniversalClosed E.colimitUniversalClosed

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse