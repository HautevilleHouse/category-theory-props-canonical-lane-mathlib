import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure LimitColimitPackage where
  category : Type u
  limitExists : Prop
  colimitExists : Prop
  limitUniversalProperty : Prop
  colimitUniversalProperty : Prop
  closureCondition : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  limitUniversalPropertyClosed : L.limitUniversalProperty
  colimitUniversalPropertyClosed : L.colimitUniversalProperty
  closureConditionClosed : L.closureCondition

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.limitUniversalProperty ∧ L.colimitUniversalProperty ∧ L.closureCondition

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage)
    (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.limitExistsClosed
    (And.intro E.colimitExistsClosed
      (And.intro E.limitUniversalPropertyClosed
        (And.intro E.colimitUniversalPropertyClosed E.closureConditionClosed)))

def limits_bridge (A : AdmissibleClass) : Prop :=
  (∀ L : LimitColimitPackage, L.closureCondition) → bridgeClosed A

theorem limits_bridge_from_closed (A : AdmissibleClass)
    (h : ∀ L : LimitColimitPackage, LimitColimitClosed L) : bridgeClosed A := by
  exact bridge_from_admissible_class A

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
