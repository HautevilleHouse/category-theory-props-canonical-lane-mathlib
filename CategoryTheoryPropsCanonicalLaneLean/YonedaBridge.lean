import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure YonedaPackage where
  category : Type u
  homSet : category → category → Type v
  identity : ∀ (A : category), homSet A A
  composition : ∀ {A B C : category}, homSet B C → homSet A B → homSet A C
  associativity : ∀ {A B C D : category} (f : homSet C D) (g : homSet B C) (h : homSet A B),
    composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ {A B : category} (f : homSet A B), composition (identity B) f = f
  identityRight : ∀ {A B : category} (f : homSet A B), composition f (identity A) = f
  yonedaEmbedding : category → (category → Type v)
  yonedaLemma : ∀ (A : category) (F : category → Type v),
    (category → Type v) (yonedaEmbedding A) → F A → (yonedaEmbedding A ⇒ F)
  representableFunctor : category → Type u
  representableCondition : Prop

structure YonedaEvidence (Y : YonedaPackage) where
  yonedaLemmaClosed : Y.yonedaLemma
  representableConditionClosed : Y.representableCondition

def YonedaBridgeClosed (Y : YonedaPackage) : Prop :=
  Y.yonedaLemma ∧ Y.representableCondition

theorem yoneda_bridge_closed_from_evidence (Y : YonedaPackage) (E : YonedaEvidence Y) : YonedaBridgeClosed Y := by
  exact And.intro E.yonedaLemmaClosed E.representableConditionClosed

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
