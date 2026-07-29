import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure YonedaLemmaPackage (A : AdmissibleClass) where
  yonedaFunctor : Type u
  yonedaLemmaStatement : Prop
  yonedaEmbeddingFullFaithful : Prop
  naturalityCondition : Prop

structure YonedaEvidence (A : AdmissibleClass) (Y : YonedaLemmaPackage A) where
  yonedaLemmaStatementClosed : Y.yonedaLemmaStatement
  yonedaEmbeddingFullFaithfulClosed : Y.yonedaEmbeddingFullFaithful
  naturalityConditionClosed : Y.naturalityCondition

def YonedaClosed (A : AdmissibleClass) (Y : YonedaLemmaPackage A) : Prop :=
  Y.yonedaLemmaStatement ∧ Y.yonedaEmbeddingFullFaithful ∧ Y.naturalityCondition

theorem yoneda_closed_from_evidence (A : AdmissibleClass) (Y : YonedaLemmaPackage A) (E : YonedaEvidence A Y) :
    YonedaClosed A Y := by
  exact And.intro E.yonedaLemmaStatementClosed (And.intro E.yonedaEmbeddingFullFaithfulClosed E.naturalityConditionClosed)

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse