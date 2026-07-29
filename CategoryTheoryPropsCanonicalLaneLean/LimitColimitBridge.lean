import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure LimitColimitPackage where
  category : Type u
  homSet : category → category → Type v
  identity : ∀ (A : category), homSet A A
  composition : ∀ {A B C : category}, homSet B C → homSet A B → homSet A C
  diagram : Type w → category
  cone : ∀ (J : Type w) (F : J → category), category
  limitingCone : ∀ (J : Type w) (F : J → category), cone J F
  universalProperty : ∀ (J : Type w) (F : J → category) (c : cone J F),
    ∃! u : homSet c (limitingCone J F), ∀ (j : J),
      composition (limitingCone J F).projection j u = c.projection j
  colimit : ∀ (J : Type w) (F : J → category), category
  cocone : ∀ (J : Type w) (F : J → category), category
  limitingCocone : ∀ (J : Type w) (F : J → category), cocone J F
  universalPropertyColimit : ∀ (J : Type w) (F : J → category) (c : cocone J F),
    ∃! u : homSet (limitingCocone J F) c, ∀ (j : J),
      composition u (limitingCocone J F).injection j = c.injection j
  completeness : Prop
  cocompleteness : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  universalPropertyClosed : L.universalProperty
  universalPropertyColimitClosed : L.universalPropertyColimit
  completenessClosed : L.completeness
  cocompletenessClosed : L.cocompleteness

def LimitColimitBridgeClosed (L : LimitColimitPackage) : Prop :=
  L.universalProperty ∧ L.universalPropertyColimit ∧ L.completeness ∧ L.cocompleteness

theorem limit_colimit_bridge_closed_from_evidence (L : LimitColimitPackage) (E : LimitColimitEvidence L) : LimitColimitBridgeClosed L := by
  exact And.intro E.universalPropertyClosed
    (And.intro E.universalPropertyColimitClosed
      (And.intro E.completenessClosed E.cocompletenessClosed))

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
