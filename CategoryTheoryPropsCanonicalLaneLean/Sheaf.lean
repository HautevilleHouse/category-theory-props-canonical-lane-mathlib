import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure SheafData where
  C : Type u
  D : Type v
  [Category C] [Category D]
  J : GrothendieckTopology C
  F : Cᵒᵖ ⥤ D
  sheafCondition : Prop
  sheafConditionClosed : sheafCondition

structure SheafEvidence (S : SheafData) where
  sheafConditionClosed : S.sheafCondition

def SheafClosed (S : SheafData) : Prop :=
  S.sheafCondition

theorem sheaf_closed_from_evidence (S : SheafData) (E : SheafEvidence S) : SheafClosed S := by
  exact E.sheafConditionClosed

end HautevilleHouse
end CategoryTheoryPropsCanonicalLaneLean