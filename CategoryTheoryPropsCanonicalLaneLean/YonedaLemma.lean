import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.CategoryObject

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure YonedaLemmaPackage (C : CategoryObject) where
  yonedaEmbedding : Type u
  yonedaLemma : Prop
  naturalIsomorphism : Prop
  yonedaLemmaTerm : yonedaLemma
  naturalIsomorphismTerm : naturalIsomorphism

structure YonedaLemmaEvidence {C : CategoryObject} (Y : YonedaLemmaPackage C) where
  yonedaLemmaClosed : Y.yonedaLemma
  naturalIsomorphismClosed : Y.naturalIsomorphism

def YonedaLemmaClosed {C : CategoryObject} (Y : YonedaLemmaPackage C) : Prop :=
  Y.yonedaLemma ∧ Y.naturalIsomorphism

theorem yoneda_lemma_closed_from_evidence
    {C : CategoryObject} (Y : YonedaLemmaPackage C)
    (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y := by
  exact And.intro E.yonedaLemmaClosed E.naturalIsomorphismClosed

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
