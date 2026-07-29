import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure MonadicityPackage where
  monad : Type u → Type u
  algebraCategory : Type u
  comparisonFunctor : Type u → Type u
  fullyFaithfulCondition : Prop
  essentiallySurjectiveCondition : Prop
  monadicityTheorem : Prop

structure MonadicityEvidence (M : MonadicityPackage) where
  fullyFaithfulConditionClosed : M.fullyFaithfulCondition
  essentiallySurjectiveConditionClosed : M.essentiallySurjectiveCondition
  monadicityTheoremClosed : M.monadicityTheorem

def MonadicityClosed (M : MonadicityPackage) : Prop :=
  M.fullyFaithfulCondition ∧ M.essentiallySurjectiveCondition ∧ M.monadicityTheorem

theorem monadicity_closed_from_evidence (M : MonadicityPackage)
    (E : MonadicityEvidence M) : MonadicityClosed M := by
  exact And.intro E.fullyFaithfulConditionClosed
    (And.intro E.essentiallySurjectiveConditionClosed E.monadicityTheoremClosed)

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse