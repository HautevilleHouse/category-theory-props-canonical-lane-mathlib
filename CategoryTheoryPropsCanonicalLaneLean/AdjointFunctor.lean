import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure AdjointFunctorPackage where
  categoryC : Type u
  categoryD : Type v
  leftAdjoint : Type w
  rightAdjoint : Type x
  adjunctionIso : Prop
  unitCounitEq : Prop
  uniquenessUpToIso : Prop
  closureCondition : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  adjunctionIsoClosed : A.adjunctionIso
  unitCounitEqClosed : A.unitCounitEq
  uniquenessUpToIsoClosed : A.uniquenessUpToIso
  closureConditionClosed : A.closureCondition

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.adjunctionIso ∧ A.unitCounitEq ∧ A.uniquenessUpToIso ∧ A.closureCondition

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage)
    (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.adjunctionIsoClosed
    (And.intro E.unitCounitEqClosed
      (And.intro E.uniquenessUpToIsoClosed E.closureConditionClosed))

def adjoint_bridge (A : AdmissibleClass) : Prop :=
  (∀ P : AdjointFunctorPackage, P.closureCondition) → bridgeClosed A

theorem adjoint_bridge_from_closed (A : AdmissibleClass)
    (h : ∀ P : AdjointFunctorPackage, AdjointFunctorClosed P) : bridgeClosed A := by
  exact bridge_from_admissible_class A

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
